#!/usr/bin/env python3

import argparse
import json
import platform
import time
import traceback
from pathlib import Path

import hls4ml


MODELS = {
    "keras_3layer": "KERAS_3layer.json",
    "keras_3layer_batch_norm": "KERAS_3layer_batch_norm.json",
}

PART = "xc7z020clg400-1"
PROFILING_FIFO_DEPTH = 100_000


def save_json(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)

    with path.open("w") as file:
        json.dump(data, file, indent=4)


def optimize_model(model_key, example_name, work_root):
    output_dir = (work_root / model_key).resolve()
    fifo_depths_file = output_dir / "fifo_depths.json"

    print("\n" + "=" * 80)
    print(f"HLS4ML FIFO OPTIMIZATION: {model_key}")
    print(f"Example: {example_name}")
    print(f"Output:  {output_dir}")
    print("=" * 80)

    config = hls4ml.utils.fetch_example_model(
        example_name,
        backend="Vitis",
    )

    config["IOType"] = "io_stream"
    config["OutputDir"] = str(output_dir)
    config["Part"] = PART

    print("\nConfiguration:")
    print(f"  IOType:    {config['IOType']}")
    print(f"  Part:      {config['Part']}")
    print(f"  OutputDir: {config['OutputDir']}")

    conversion_start = time.perf_counter()

    hls_model = hls4ml.converters.keras_v2_to_hls(config)

    conversion_seconds = time.perf_counter() - conversion_start

    optimizer = hls4ml.model.optimizer.get_optimizer(
        "vitis:fifo_depth_optimization"
    )

    optimizer.configure(
        profiling_fifo_depth=PROFILING_FIFO_DEPTH
    )

    print("\nStarting official hls4ml FIFO optimization.")
    print("This performs synthesis and RTL co-simulation.")

    optimization_start = time.perf_counter()

    optimizer.transform(hls_model)

    optimization_seconds = (
        time.perf_counter() - optimization_start
    )

    if not fifo_depths_file.exists():
        raise FileNotFoundError(
            f"hls4ml did not generate {fifo_depths_file}"
        )

    with fifo_depths_file.open() as file:
        fifo_depths = json.load(file)

    # Persist the optimized depths into the generated project files.
    write_start = time.perf_counter()
    hls_model.write()
    write_seconds = time.perf_counter() - write_start

    total_initial_depth = sum(
        item["initial"] for item in fifo_depths.values()
    )

    total_optimized_depth = sum(
        item["optimized"] for item in fifo_depths.values()
    )

    reduction = total_initial_depth - total_optimized_depth

    reduction_percent = (
        100.0 * reduction / total_initial_depth
        if total_initial_depth > 0
        else 0.0
    )

    print("\nFIFO DEPTH RESULTS")
    print("-" * 80)

    for fifo_name, depths in fifo_depths.items():
        print(
            f"{fifo_name}: "
            f"{depths['initial']} -> "
            f"{depths['optimized']}"
        )

    print("\nSUMMARY")
    print("-" * 80)
    print(f"Number of internal FIFOs: {len(fifo_depths)}")
    print(f"Total initial depth:      {total_initial_depth}")
    print(f"Total optimized depth:    {total_optimized_depth}")
    print(f"Depth reduction:          {reduction}")
    print(f"Depth reduction percent:  {reduction_percent:.2f}%")
    print(
        f"Optimizer runtime:        "
        f"{optimization_seconds:.3f} seconds"
    )

    return {
        "model": model_key,
        "example_model": example_name,
        "status": "PASSED",
        "output_dir": str(output_dir),
        "part": PART,
        "io_type": "io_stream",
        "profiling_fifo_depth": PROFILING_FIFO_DEPTH,
        "conversion_seconds": conversion_seconds,
        "optimizer_runtime_seconds": optimization_seconds,
        "project_write_seconds": write_seconds,
        "number_of_internal_fifos": len(fifo_depths),
        "total_initial_fifo_depth": total_initial_depth,
        "total_optimized_fifo_depth": total_optimized_depth,
        "fifo_depth_reduction": reduction,
        "fifo_depth_reduction_percent": reduction_percent,
        "fifo_depths": fifo_depths,
    }


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--models",
        nargs="+",
        choices=MODELS.keys(),
        default=list(MODELS.keys()),
    )

    parser.add_argument(
        "--work-dir",
        default="hls4ml_fifo_optimizer_results",
    )

    parser.add_argument(
        "--results",
        default="results/hls4ml_fifo_optimizer_results.json",
    )

    args = parser.parse_args()

    work_root = Path(args.work_dir).resolve()
    results_file = Path(args.results).resolve()

    work_root.mkdir(parents=True, exist_ok=True)
    results_file.parent.mkdir(parents=True, exist_ok=True)

    results = {
        "configuration": {
            "models": args.models,
            "part": PART,
            "io_type": "io_stream",
            "profiling_fifo_depth": PROFILING_FIFO_DEPTH,
            "python_version": platform.python_version(),
            "hls4ml_version": getattr(
                hls4ml,
                "__version__",
                "unknown",
            ),
        },
        "results": [],
    }

    for model_key in args.models:
        try:
            result = optimize_model(
                model_key,
                MODELS[model_key],
                work_root,
            )

        except KeyboardInterrupt:
            print("\nInterrupted.")
            save_json(results_file, results)
            raise

        except Exception as exc:
            print(
                f"\nFAILED {model_key}: "
                f"{type(exc).__name__}: {exc}"
            )
            traceback.print_exc()

            result = {
                "model": model_key,
                "example_model": MODELS[model_key],
                "status": "FAILED",
                "error_type": type(exc).__name__,
                "error": str(exc),
            }

        results["results"].append(result)
        save_json(results_file, results)

        print(
            f"\nSaved intermediate results to "
            f"{results_file}"
        )

    print("\nBenchmark complete.")
    print(f"Results: {results_file}")


if __name__ == "__main__":
    main()