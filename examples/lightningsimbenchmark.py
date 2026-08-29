#!/usr/bin/env python3

"""
Benchmark hls4ml example models with:

    1. Vitis HLS C/RTL co-simulation
    2. LightningSim

For each model:

    - Run Vitis C/RTL co-simulation
    - Record Vitis runtime
    - Enter Vitis latency
    - Run LightningSim
    - Record LightningSim runtime
    - Enter LightningSim latency from GUI
    - Compare latency
    - Save results to JSON
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
]

RESULTS_FILE = Path("benchmark_results.json")


# ============================================================
# Save results
# ============================================================

def save_results(results):

    with open(RESULTS_FILE, "w") as f:
        json.dump(results, f, indent=4)


# ============================================================
# Vitis latency
# ============================================================

def get_vitis_latency(model_name):

    print("\n" + "=" * 70)
    print(f"VITIS LATENCY: {model_name}")
    print("=" * 70)

    print(
        "\nVitis co-simulation has completed."
    )

    print(
        "Read the latency/cycle count from "
        "the Vitis report."
    )

    while True:

        value = input(
            "\nEnter Vitis latency (cycles): "
        ).strip()

        try:
            return int(value)

        except ValueError:
            print(
                "Please enter an integer number of cycles."
            )


# ============================================================
# LightningSim latency
# ============================================================

def get_lightningsim_latency(model_name):

    print("\n" + "=" * 70)
    print(f"LIGHTNINGSIM LATENCY: {model_name}")
    print("=" * 70)

    print(
        "\nRead the top-level latency from "
        "the LightningSim GUI."
    )

    while True:

        value = input(
            "\nEnter LightningSim latency (cycles): "
        ).strip()

        try:
            return int(value)

        except ValueError:
            print(
                "Please enter an integer number of cycles."
            )


# ============================================================
# Run Vitis co-simulation
# ============================================================

def run_vitis_cosimulation(
    hls_model,
    model_name,
):

    print("\n" + "=" * 80)
    print("VITIS C/RTL CO-SIMULATION")
    print("=" * 80)

    print(
        f"\nRunning Vitis co-simulation for "
        f"{model_name}..."
    )

    start = time.perf_counter()

    try:

        hls_model.build(
            csim=True,
            cosim=True,
        )

    except Exception as exc:

        print(
            f"\n✗ Vitis co-simulation FAILED:\n{exc}"
        )

        return {
            "status": "failed",
            "error": str(exc),
            "runtime_seconds": None,
            "latency_cycles": None,
        }

    runtime = (
        time.perf_counter() - start
    )

    print(
        "\n✓ Vitis co-simulation completed."
    )

    print(
        f"Vitis co-simulation time: "
        f"{runtime:.3f} seconds"
    )

    latency = get_vitis_latency(
        model_name
    )

    return {
        "status": "passed",
        "runtime_seconds": runtime,
        "latency_cycles": latency,
    }


# ============================================================
# Run LightningSim
# ============================================================

def run_lightningsim(model_name):

    print("\n" + "=" * 80)
    print("LIGHTNINGSIM")
    print("=" * 80)

    print(
        "\nLaunching LightningSim..."
    )

    print(
        "\nThe LightningSim GUI should be available at:"
    )

    print(
        "http://127.0.0.1:8080"
    )

    start = time.perf_counter()

    try:

        # IMPORTANT:
        # Your current run_lightningsim() uses
        # subprocess.run(), so this call returns
        # only after LightningSim finishes.

        hls4ml.run_lightningsim()

    except Exception as exc:

        print(
            f"\n✗ LightningSim FAILED:\n{exc}"
        )

        return {
            "status": "failed",
            "error": str(exc),
            "runtime_seconds": None,
            "latency_cycles": None,
        }

    runtime = (
        time.perf_counter() - start
    )

    print(
        "\n✓ LightningSim simulation completed."
    )

    print(
        f"LightningSim simulation time: "
        f"{runtime:.3f} seconds"
    )

    # --------------------------------------------------------
    # IMPORTANT:
    # Ask for latency AFTER LightningSim finishes.
    # --------------------------------------------------------

    latency = get_lightningsim_latency(
        model_name
    )

    return {
        "status": "passed",
        "runtime_seconds": runtime,
        "latency_cycles": latency,
    }


# ============================================================
# Compare latency
# ============================================================

def compare_results(
    vitis,
    lightningsim,
):

    vitis_latency = (
        vitis["latency_cycles"]
    )

    lightning_latency = (
        lightningsim["latency_cycles"]
    )

    difference = (
        lightning_latency -
        vitis_latency
    )

    if vitis_latency != 0:

        error_percent = (
            abs(difference) /
            vitis_latency
        ) * 100

    else:

        error_percent = None

    latency_match = (
        lightning_latency ==
        vitis_latency
    )

    print("\n" + "=" * 70)
    print("LATENCY COMPARISON")
    print("=" * 70)

    print(
        f"\nVitis latency:"
        f"        {vitis_latency} cycles"
    )

    print(
        f"LightningSim latency:"
        f" {lightning_latency} cycles"
    )

    print(
        f"Latency difference:"
        f"   {difference} cycles"
    )

    if error_percent is not None:

        print(
            f"Latency error:"
            f"        {error_percent:.4f}%"
        )

    print(
        f"Latency match:"
        f"          {'YES' if latency_match else 'NO'}"
    )

    return {
        "latency_difference_cycles":
            difference,

        "latency_error_percent":
            error_percent,

        "latency_match":
            latency_match,
    }


# ============================================================
# Benchmark one model
# ============================================================

def benchmark_model(model_name):

    print("\n\n" + "#" * 80)
    print(f"# MODEL: {model_name}")
    print("#" * 80)

    # --------------------------------------------------------
    # Fetch model
    # --------------------------------------------------------

    print("\nFetching example model...")

    config = hls4ml.utils.fetch_example_model(
        model_name,
        backend="Vitis",
    )

    # --------------------------------------------------------
    # Convert model
    # --------------------------------------------------------

    print("\nConverting model...")

    hls_model = hls4ml.converters.keras_v2_to_hls(
        config
    )

    # --------------------------------------------------------
    # Vitis
    # --------------------------------------------------------

    vitis = run_vitis_cosimulation(
        hls_model,
        model_name,
    )

    if vitis["status"] != "passed":

        return {
            "model": model_name,
            "status": "FAILED",
            "vitis_cosimulation": vitis,
        }

    # --------------------------------------------------------
    # LightningSim
    # --------------------------------------------------------

    lightningsim = run_lightningsim(
        model_name
    )

    if lightningsim["status"] != "passed":

        return {
            "model": model_name,
            "status": "FAILED",
            "vitis_cosimulation": vitis,
            "lightningsim": lightningsim,
        }

    # --------------------------------------------------------
    # Compare
    # --------------------------------------------------------

    comparison = compare_results(
        vitis,
        lightningsim,
    )

    # --------------------------------------------------------
    # Return complete result
    # --------------------------------------------------------

    return {
        "model": model_name,
        "status": "PASSED",

        "vitis_cosimulation": vitis,

        "lightningsim": lightningsim,

        "comparison": comparison,
    }


# ============================================================
# Main
# ============================================================

def main():

    print("=" * 80)
    print("hls4ml / Vitis / LightningSim Benchmark")
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
            f"\n\n"
            f"######## MODEL "
            f"{index}/{len(MODELS)} ########"
        )

        try:

            result = benchmark_model(
                model_name
            )

            results["results"].append(
                result
            )

            # Save after every model.

            save_results(results)

            print(
                f"\n✓ Results saved to "
                f"{RESULTS_FILE}"
            )

        except KeyboardInterrupt:

            print(
                "\nBenchmark interrupted."
            )

            save_results(results)
            break

        except Exception as exc:

            print(
                f"\n✗ Unexpected error for "
                f"{model_name}: {exc}"
            )

            results["results"].append({
                "model": model_name,
                "status": "FAILED",
                "error": str(exc),
            })

            save_results(results)

    print("\n\n" + "=" * 80)
    print("BENCHMARK COMPLETE")
    print("=" * 80)

    print(
        f"\nResults saved to:"
        f"\n{RESULTS_FILE}"
    )


if __name__ == "__main__":
    main()