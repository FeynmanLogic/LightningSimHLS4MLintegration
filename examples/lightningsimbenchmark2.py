#!/usr/bin/env python3

"""
Benchmark hls4ml example models with:

    1. Vitis HLS C/RTL co-simulation
    2. LightningSim

For each model:

    - Run Vitis C/RTL co-simulation
    - Record Vitis runtime
    - Enter Vitis latency from the co-simulation report
    - Run LightningSim
    - Record LightningSim runtime
    - Enter LightningSim latency from the GUI
    - Compare latency and simulation speed

Results are saved to:

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
]


RESULTS_FILE = Path("benchmark_results.json")


# ============================================================
# JSON
# ============================================================

def save_results(results):
    with open(RESULTS_FILE, "w") as f:
        json.dump(results, f, indent=4)


# ============================================================
# Vitis latency input
# ============================================================

def get_vitis_latency(model_name):
    """
    Ask for the latency reported by Vitis co-simulation.

    This function is called ONLY after Vitis co-simulation
    has completed.
    """

    print("\n" + "=" * 70)
    print(f"VITIS CO-SIMULATION LATENCY: {model_name}")
    print("=" * 70)

    print(
        "\nVitis co-simulation has completed."
    )

    print(
        "Read the latency/cycle count from the "
        "Vitis co-simulation results."
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
# LightningSim latency input
# ============================================================

def get_lightningsim_latency(model_name):
    """
    Ask for the latency reported by LightningSim GUI.

    This function is called ONLY after LightningSim
    has completed/produced its GUI results.
    """

    print("\n" + "=" * 70)
    print(f"LIGHTNINGSIM LATENCY: {model_name}")
    print("=" * 70)

    print(
        "\nLightningSim has completed."
    )

    print(
        "Read the reported latency from the "
        "LightningSim web interface."
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

def run_vitis_cosimulation(hls_model, model_name):
    """
    Run Vitis C/RTL co-simulation and return:

        runtime_seconds
        latency_cycles
        status
    """

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
        f"\n✓ Vitis co-simulation completed."
    )

    print(
        f"Runtime: {runtime:.3f} seconds"
    )

    # IMPORTANT:
    # Ask for Vitis latency only AFTER co-simulation
    # has finished.

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
    """
    Run LightningSim through the hls4ml integration.

    The modified hls4ml run_lightningsim() function is
    responsible for launching LightningSim with --gui.
    """

    print("\n" + "=" * 80)
    print("LIGHTNINGSIM")
    print("=" * 80)

    print(
        "\nStarting LightningSim..."
    )

    print(
        "\nThe LightningSim GUI should be available at:"
    )

    print(
        "http://127.0.0.1:8080"
    )

    print(
        "\nFor the remote server, make sure your SSH "
        "port tunnel is active."
    )

    start = time.perf_counter()

    try:

        # The hls4ml integration handles:
        #
        #   Conda environment
        #   solution1 discovery
        #   --gui
        #   LightningSim execution

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
        f"\n✓ LightningSim completed."
    )

    print(
        f"Runtime: {runtime:.3f} seconds"
    )

    # IMPORTANT:
    # Ask for LightningSim latency ONLY AFTER
    # LightningSim has run.

    latency = get_lightningsim_latency(
        model_name
    )

    return {
        "status": "passed",
        "runtime_seconds": runtime,
        "latency_cycles": latency,
    }


# ============================================================
# Compare results
# ============================================================

def compare_results(
    vitis,
    lightningsim,
):
    """
    Compare Vitis co-simulation and LightningSim.
    """

    vitis_latency = (
        vitis["latency_cycles"]
    )

    lightning_latency = (
        lightningsim["latency_cycles"]
    )

    vitis_time = (
        vitis["runtime_seconds"]
    )

    lightning_time = (
        lightningsim["runtime_seconds"]
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

    if lightning_time > 0:

        speedup = (
            vitis_time /
            lightning_time
        )

    else:

        speedup = None

    comparison = {
        "latency_difference_cycles":
            difference,

        "latency_error_percent":
            error_percent,

        "latency_match":
            lightning_latency == vitis_latency,

        "speedup":
            speedup,
    }

    print("\n" + "=" * 70)
    print("COMPARISON")
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
        f"\nVitis co-sim time:"
        f"       {vitis_time:.3f} s"
    )

    print(
        f"LightningSim time:"
        f"       {lightning_time:.3f} s"
    )

    if speedup is not None:

        print(
            f"Speedup:"
            f"                {speedup:.2f}x"
        )

    return comparison


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
    # Final result
    # --------------------------------------------------------

    return {
        "model": model_name,

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