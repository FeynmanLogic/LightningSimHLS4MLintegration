#!/usr/bin/env python3
"""Benchmark hls4ml FIFO optimization against FIFOAdvisor.

The script creates two Keras models, converts each with Vitis and io_stream,
and evaluates:

1. Default hls4ml FIFO configuration.
2. hls4ml's built-in ``vitis:fifo_depth_optimization`` flow.
3. FIFOAdvisor's baseline evaluation and a selected optimization solver.

FIFOAdvisor installation/setup is performed before timing, so installation
time is not counted as optimization time.
"""

from __future__ import annotations

import argparse
import json
import shutil
import subprocess
import time
from pathlib import Path
from typing import Any

import hls4ml
from tensorflow import keras


DEFAULT_PART = "xc7z020clg400-1"
DEFAULT_ENV = "fifo-advisor"
RESULTS_FILE = Path("fifo_optimizer_benchmark_results.json")


def save_json(path: Path, payload: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2), encoding="utf-8")


def read_json_if_present(path: Path) -> Any | None:
    if not path.exists():
        return None
    with path.open("r", encoding="utf-8") as stream:
        return json.load(stream)


def run_checked(cmd: list[str], cwd: Path | None = None) -> float:
    print("\nRunning:")
    print(" ".join(cmd))
    start = time.perf_counter()
    subprocess.run(cmd, cwd=cwd, check=True)
    return time.perf_counter() - start


def make_dense_model() -> keras.Model:
    """Official hls4ml FIFO-depth documentation style model."""
    return keras.Sequential(
        [
            keras.layers.Input(shape=(16,), name="model_input"),
            keras.layers.Dense(64, activation="relu", name="fc1"),
            keras.layers.Dense(32, activation="relu", name="fc2"),
            keras.layers.Dense(32, activation="relu", name="fc3"),
            keras.layers.Dense(5, activation="softmax", name="output"),
        ],
        name="dense_stream",
    )


def make_conv1d_model() -> keras.Model:
    """Streaming CNN with rate changes and several internal channels."""
    return keras.Sequential(
        [
            keras.layers.Input(shape=(32, 4), name="model_input"),
            keras.layers.Conv1D(8, 3, padding="same", activation="relu", name="conv1"),
            keras.layers.MaxPooling1D(2, name="pool1"),
            keras.layers.Conv1D(16, 3, padding="same", activation="relu", name="conv2"),
            keras.layers.MaxPooling1D(2, name="pool2"),
            keras.layers.Flatten(name="flatten"),
            keras.layers.Dense(16, activation="relu", name="fc1"),
            keras.layers.Dense(5, activation="softmax", name="output"),
        ],
        name="conv1d_stream",
    )


MODEL_FACTORIES = {
    "dense_stream": make_dense_model,
    "conv1d_stream": make_conv1d_model,
}


def configure_model(model: keras.Model) -> dict[str, Any]:
    config = hls4ml.utils.config_from_keras_model(model, granularity="name")
    # A moderate reuse factor keeps synthesis manageable while allowing
    # producer/consumer rates to differ across layers.
    for layer_config in config.get("LayerName", {}).values():
        if isinstance(layer_config, dict) and "ReuseFactor" in layer_config:
            layer_config["ReuseFactor"] = 4
    return config


def convert_model(
    model: keras.Model,
    output_dir: Path,
    part: str,
    use_hls4ml_fifo_optimizer: bool,
) -> Any:
    config = configure_model(model)

    if use_hls4ml_fifo_optimizer:
        config["Flows"] = ["vitis:fifo_depth_optimization"]
        hls4ml.model.optimizer.get_optimizer(
            "vitis:fifo_depth_optimization"
        ).configure(profiling_fifo_depth=100_000)

    return hls4ml.converters.convert_from_keras_model(
        model,
        hls_config=config,
        io_type="io_stream",
        backend="Vitis",
        output_dir=str(output_dir),
        project_name="myproject",
        part=part,
    )


def solution_path(project_dir: Path) -> Path:
    expected = project_dir / "myproject_prj" / "solution1"
    if expected.is_dir():
        return expected.resolve()

    matches = list(project_dir.rglob("solution1"))
    if len(matches) != 1:
        raise FileNotFoundError(
            f"Expected one solution1 below {project_dir}, found {len(matches)}"
        )
    return matches[0].resolve()


def verify_internal_streams(project_dir: Path) -> list[str]:
    """Return generated source lines declaring streams/FIFO pragmas."""
    evidence: list[str] = []
    for suffix in ("*.cpp", "*.h"):
        for path in project_dir.rglob(suffix):
            try:
                for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
                    if "hls::stream" in line or "#pragma HLS STREAM" in line:
                        evidence.append(f"{path}: {line.strip()}")
            except OSError:
                continue
    if not evidence:
        raise RuntimeError(f"No internal stream/FIFO declarations found in {project_dir}")
    return evidence


def build_default(model: keras.Model, project_dir: Path, part: str) -> dict[str, Any]:
    print(f"\n{'=' * 80}\nDEFAULT HLS4ML: {model.name}\n{'=' * 80}")
    hls_model = convert_model(model, project_dir, part, False)
    start = time.perf_counter()
    hls_model.build(csim=True, synth=True, cosim=False)
    runtime = time.perf_counter() - start
    evidence = verify_internal_streams(project_dir)
    return {
        "status": "PASSED",
        "runtime_seconds": runtime,
        "solution": str(solution_path(project_dir)),
        "stream_evidence_count": len(evidence),
        "stream_evidence_preview": evidence[:10],
    }


def build_hls4ml_optimized(
    model: keras.Model, project_dir: Path, part: str
) -> dict[str, Any]:
    print(f"\n{'=' * 80}\nHLS4ML FIFO OPTIMIZER: {model.name}\n{'=' * 80}")
    hls_model = convert_model(model, project_dir, part, True)
    start = time.perf_counter()
    hls_model.build(reset=False, csim=True, synth=True, cosim=True)
    runtime = time.perf_counter() - start
    depths_path = project_dir / "fifo_depths.json"
    depths = read_json_if_present(depths_path)
    if depths is None:
        raise FileNotFoundError(f"hls4ml did not create {depths_path}")
    return {
        "status": "PASSED",
        "runtime_seconds": runtime,
        "fifo_depths_file": str(depths_path.resolve()),
        "fifo_depths": depths,
    }


def ensure_fifoadvisor_available(conda: str, env: str) -> None:
    result = subprocess.run(
        [conda, "run", "-n", env, "fifo-advisor", "--help"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    if result.returncode != 0:
        raise RuntimeError(
            f"FIFOAdvisor is unavailable in Conda environment '{env}'. "
            "Run your run_fifoadvisor installer once, then rerun this benchmark."
        )


def run_fifoadvisor(
    conda: str,
    env: str,
    solution: Path,
    output: Path,
    solver: str,
    baseline: bool,
    seed: int,
    n_samples: int,
    maxfun: int,
) -> dict[str, Any]:
    output = output.resolve()
    cmd = [conda, "run", "-n", env, "fifo-advisor", str(solution)]
    if baseline:
        cmd.append("--baseline")
    else:
        cmd.extend(["--solver", solver])
        if solver in {"random", "group-random"}:
            cmd.extend(["--seed", str(seed), "--n-samples", str(n_samples)])
        elif solver in {"sa", "group-sa"}:
            cmd.extend(["--maxfun", str(maxfun)])
    cmd.extend(["--output", str(output)])

    runtime = run_checked(cmd)
    payload = read_json_if_present(output)
    if payload is None:
        raise FileNotFoundError(f"FIFOAdvisor did not create {output}")
    return {
        "status": "PASSED",
        "runtime_seconds": runtime,
        "output_file": str(output),
        "results": payload,
    }


def benchmark_model(args: argparse.Namespace, model_name: str) -> dict[str, Any]:
    root = args.work_dir.resolve() / model_name
    default_dir = root / "default"
    optimized_dir = root / "hls4ml_optimized"
    model = MODEL_FACTORIES[model_name]()
    result: dict[str, Any] = {"model": model_name, "status": "PASSED"}

    try:
        default = build_default(model, default_dir, args.part)
        result["default_hls4ml"] = default

        baseline_path = root / "fifoadvisor_baseline.json"
        result["fifoadvisor_baseline"] = run_fifoadvisor(
            args.conda,
            args.env,
            Path(default["solution"]),
            baseline_path,
            args.solver,
            True,
            args.seed,
            args.n_samples,
            args.maxfun,
        )

        advisor_path = root / "fifoadvisor_optimized.json"
        result["fifoadvisor_optimized"] = run_fifoadvisor(
            args.conda,
            args.env,
            Path(default["solution"]),
            advisor_path,
            args.solver,
            False,
            args.seed,
            args.n_samples,
            args.maxfun,
        )

        # Create a fresh project because hls4ml's optimizer mutates FIFO depths.
        result["hls4ml_fifo_optimized"] = build_hls4ml_optimized(
            MODEL_FACTORIES[model_name](), optimized_dir, args.part
        )
    except Exception as exc:
        result["status"] = "FAILED"
        result["error"] = f"{type(exc).__name__}: {exc}"
        print(f"\nFAILED {model_name}: {result['error']}")

    return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--part", default=DEFAULT_PART)
    parser.add_argument("--env", default=DEFAULT_ENV)
    parser.add_argument("--conda", default=shutil.which("conda") or "conda")
    parser.add_argument(
        "--solver",
        default="group-random",
        choices=["random", "group-random", "heuristic", "sa", "group-sa"],
    )
    parser.add_argument("--seed", type=int, default=7)
    parser.add_argument("--n-samples", type=int, default=1000)
    parser.add_argument("--maxfun", type=int, default=100)
    parser.add_argument("--work-dir", type=Path, default=Path("fifo_benchmark_projects"))
    parser.add_argument("--results", type=Path, default=RESULTS_FILE)
    parser.add_argument(
        "--models",
        nargs="+",
        choices=sorted(MODEL_FACTORIES),
        default=list(MODEL_FACTORIES),
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    ensure_fifoadvisor_available(args.conda, args.env)
    results: dict[str, Any] = {
        "configuration": {
            "models": args.models,
            "part": args.part,
            "fifoadvisor_environment": args.env,
            "fifoadvisor_solver": args.solver,
            "seed": args.seed,
            "n_samples": args.n_samples,
            "maxfun": args.maxfun,
        },
        "results": [],
    }

    for index, model_name in enumerate(args.models, start=1):
        print(f"\n\n######## MODEL {index}/{len(args.models)}: {model_name} ########")
        results["results"].append(benchmark_model(args, model_name))
        save_json(args.results, results)
        print(f"\nSaved intermediate results to {args.results}")

    print(f"\nBenchmark complete. Results: {args.results.resolve()}")


if __name__ == "__main__":
    main()
