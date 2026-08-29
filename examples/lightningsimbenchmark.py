#!/usr/bin/env python3

"""
Benchmark hls4ml example models with Vitis HLS co-simulation
and LightningSim.

For each model:

    1. Fetch the hls4ml example model
    2. Convert it to a Vitis HLS project
    3. Run Vitis C/RTL co-simulation
    4. Record co-simulation runtime
    5. Run LightningSim
    6. Record LightningSim runtime
    7. Manually enter Vitis and LightningSim latency
    8. Compare latency and simulation speed

Results:
    benchmark_results.json
"""

import json
import time
from pathlib import Path

import hls4ml


# ============================================================
# Models
# ============================================================

MODELS = [
    "KERAS_1layer.json",
    "KERAS_3layer.json",
    "KERAS_3layer_batch_norm.json",
    "KERAS_conv1d.json",
    "KERAS_dense_16x100x100x100x100x100x5.json",
]


RESULTS_FILE = Path("benchmark_results.json")


# ============================================================
# Helpers
# ============================================================

def save_results(results):
    with open(RESULTS_FILE, "w") as f:
        json.dump(results, f, indent=4)


def get_latency(model_name, source):
    """Manually enter latency in cycles."""

    print("\n" + "=" * 70)
    print(f"{source} latency - {model_name}")
    print("=" * 70)

    while True:
        value = input(
            f"Enter {source} latency (cycles): "
        ).strip()

        try:
            return int(value)
        except ValueError:
            print("Please enter an integer.")


# ============================================================
# Benchmark one model
# ============================================================

def benchmark_model(model_name):

    print("\n" + "=" * 80)
    print(f"BENCHMARKING: {model_name}")
    print("=" * 80)

    result = {
        "model": model_name,

        "vitis_cosimulation": {
            "status": None,
            "runtime_seconds": None,
            "latency_cycles": None,
        },

        "lightningsim": {
            "status": None,
            "runtime_seconds": None,
            "latency_cycles": None,
        },

        "comparison": {
            "latency_difference_cycles": None,
            "latency_error_percent": None,
            "latency_match": None,
            "speedup": None,
        },
    }

    # --------------------------------------------------------
    # Fetch model
    # --------------------------------------------------------

    print("\n[1/4] Fetching example model...")

    config = hls4ml.utils.fetch_example_model(
        model_name,
        backend="Vitis",
    )

    # --------------------------------------------------------
    # Convert
    # --------------------------------------------------------

    print("\n[2/4] Converting model...")

    hls_model = hls4ml.converters.keras_v2_to_hls(
        config
    )

    # --------------------------------------------------------
    # Vitis C/RTL co-simulation
    # --------------------------------------------------------

    print(
        "\n[3/4] Running Vitis C/RTL co-simulation..."
    )

    start = time.perf_counter()

    try:
        hls_model.build(
            csim=True,
            cosim=True,
        )

    except Exception as exc:

        result["vitis_cosimulation"]["status"] = "failed"
        result["vitis_cosimulation"]["error"] = str(exc)

        print(f"\nVitis co-simulation FAILED:\n{exc}")

        return result

    cosim_time = time.perf_counter() - start

    result["vitis_cosimulation"]["status"] = "passed"
    result["vitis_cosimulation"][
        "runtime_seconds"
    ] = cosim_time

    print(
        f"\n✓ Vitis co-simulation completed"
        f"\n  Runtime: {cosim_time:.3f} seconds"
    )

    # --------------------------------------------------------
    # Vitis latency
    # --------------------------------------------------------

    vitis_cycles = get_latency(
        model_name,
        "Vitis co-simulation",
    )

    result["vitis_cosimulation"][
        "latency_cycles"
    ] = vitis_cycles

    # --------------------------------------------------------
    # LightningSim
    # --------------------------------------------------------

    print("\n[4/4] Running LightningSim GUI...")

    print(
        "\nLightningSim GUI will be launched by "
        "hls4ml.run_lightningsim()."
    )

    print(
        "After it starts, open the LightningSim web "
        "interface through your SSH tunnel."
    )

    start = time.perf_counter()

    try:
        hls4ml.run_lightningsim()

    except Exception as exc:

        result["lightningsim"]["status"] = "failed"
        result["lightningsim"]["error"] = str(exc)

        print(
            f"\nLightningSim FAILED:\n{exc}"
        )

        return result

    lightning_time = time.perf_counter() - start

    result["lightningsim"]["status"] = "passed"
    result["lightningsim"][
        "runtime_seconds"
    ] = lightning_time

    print(
        f"\n✓ LightningSim completed"
        f"\n  Runtime: {lightning_time:.3f} seconds"
    )

    # --------------------------------------------------------
    # LightningSim latency
    # --------------------------------------------------------

    lightning_cycles = get_latency(
        model_name,
        "LightningSim",
    )

    result["lightningsim"][
        "latency_cycles"
    ] = lightning_cycles

    # --------------------------------------------------------
    # Latency comparison
    # --------------------------------------------------------

    difference = (
        lightning_cycles -
        vitis_cycles
    )

    if vitis_cycles != 0:

        error_percent = (
            abs(difference) /
            vitis_cycles
        ) * 100

    else:
        error_percent = None

    result["comparison"][
        "latency_difference_cycles"
    ] = difference

    result["comparison"][
        "latency_error_percent"
    ] = error_percent

    result["comparison"][
        "latency_match"
    ] = (
        lightning_cycles == vitis_cycles
    )

    # --------------------------------------------------------
    # Simulation speedup
    # --------------------------------------------------------

    if lightning_time > 0:

        speedup = (
            cosim_time /
            lightning_time
        )

        result["comparison"][
            "speedup"
        ] = speedup

    # --------------------------------------------------------
    # Print result
    # --------------------------------------------------------

    print("\n" + "=" * 70)
    print("RESULT")
    print("=" * 70)

    print(
        f"\nVitis latency        : "
        f"{vitis_cycles} cycles"
    )

    print(
        f"LightningSim latency: "
        f"{lightning_cycles} cycles"
    )

    print(
        f"Latency difference   : "
        f"{difference} cycles"
    )

    if error_percent is not None:
        print(
            f"Latency error        : "
            f"{error_percent:.4f}%"
        )

    print(
        f"\nVitis co-sim time    : "
        f"{cosim_time:.3f} s"
    )

    print(
        f"LightningSim time    : "
        f"{lightning_time:.3f} s"
    )

    print(
        f"Speedup              : "
        f"{speedup:.2f}x"
    )

    return result


# ============================================================
# Main
# ============================================================

def main():

    print("=" * 80)
    print("hls4ml + Vitis + LightningSim Benchmark")
    print("=" * 80)

    results = {
        "benchmark": {
            "num_models": len(MODELS),
            "models": MODELS,
        },
        "results": [],
    }

    for index, model_name in enumerate(
        MODELS,
        start=1,
    ):

        print(
            f"\n\n######## "
            f"MODEL {index}/{len(MODELS)} "
            f"########"
        )

        try:

            result = benchmark_model(
                model_name
            )

            results["results"].append(result)

            # Save after every model.
            save_results(results)

        except KeyboardInterrupt:

            print(
                "\nBenchmark interrupted."
            )
            break

        except Exception as exc:

            print(
                f"\nUnexpected error for "
                f"{model_name}: {exc}"
            )

            results["results"].append({
                "model": model_name,
                "status": "FAILED",
                "error": str(exc),
            })

            save_results(results)

    # --------------------------------------------------------
    # Final summary
    # --------------------------------------------------------

    print("\n\n" + "=" * 80)
    print("FINAL SUMMARY")
    print("=" * 80)

    for result in results["results"]:

        if "comparison" not in result:
            continue

        print(
            f"\n{result['model']}"
        )

        print(
            f"  Vitis latency: "
            f"{result['vitis_cosimulation']['latency_cycles']} cycles"
        )

        print(
            f"  LightningSim latency: "
            f"{result['lightningsim']['latency_cycles']} cycles"
        )

        print(
            f"  Latency error: "
            f"{result['comparison']['latency_error_percent']:.4f}%"
        )

        print(
            f"  Speedup: "
            f"{result['comparison']['speedup']:.2f}x"
        )

    print(
        f"\nResults saved to: "
        f"{RESULTS_FILE}"
    )


if __name__ == "__main__":
    main()
