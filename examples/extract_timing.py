#!/usr/bin/env python3

"""
Extract Vitis and LightningSim timing information from a
benchmark terminal log.

Input:
    timing_full.log

Output:
    extracted_timings.txt
"""

import re
from pathlib import Path


LOG_FILE = Path("timing_full.log")
OUTPUT_FILE = Path("extracted_timings.txt")


def seconds_from_hms(hours, minutes, seconds):
    return (
        int(hours) * 3600
        + int(minutes) * 60
        + int(seconds)
    )


def parse_time_string(value):
    """
    Convert common time formats to seconds.

    Examples:
        1m59s
        0h1m59s
        3m30s
    """

    match = re.fullmatch(
        r"(?:(\d+)h)?(?:(\d+)m)?(?:(\d+(?:\.\d+)?)s)?",
        value.strip(),
    )

    if not match:
        return None

    hours = int(match.group(1) or 0)
    minutes = int(match.group(2) or 0)
    seconds = float(match.group(3) or 0)

    return (
        hours * 3600
        + minutes * 60
        + seconds
    )


def main():

    if not LOG_FILE.exists():

        print(
            f"ERROR: {LOG_FILE} was not found."
        )

        print(
            "Run the benchmark first with:"
        )

        print(
            "python benchmark_timing.py 2>&1 | tee timing_full.log"
        )

        return

    text = LOG_FILE.read_text(
        errors="replace"
    )

    lines = text.splitlines()

    results = []

    current_model = None

    # --------------------------------------------------------
    # Model detection
    # --------------------------------------------------------

    model_pattern = re.compile(
        r"# (KERAS_[^\s]+\.json)"
    )

    # --------------------------------------------------------
    # Timing patterns
    # --------------------------------------------------------

    patterns = {

        "python_vitis_timer": re.compile(
            r"Vitis co-simulation time:\s*"
            r"([0-9.]+)\s*seconds",
            re.IGNORECASE,
        ),

        "explicit_cosimulation_time": re.compile(
            r"Co-simulation time:\s*"
            r"([0-9.]+)\s*seconds",
            re.IGNORECASE,
        ),

        "c_rtl_simulation_completed": re.compile(
            r"C/RTL SIMULATION COMPLETED IN\s*"
            r"([0-9hms.]+)",
            re.IGNORECASE,
        ),

        "hls_total_elapsed": re.compile(
            r"Total elapsed time:\s*"
            r"([0-9.]+)\s*seconds",
            re.IGNORECASE,
        ),

        "vitis_run_total": re.compile(
            r"Total elapsed time:\s*"
            r"([0-9hms.]+)",
            re.IGNORECASE,
        ),

        "lightningsim_time": re.compile(
            r"LightningSim time:\s*"
            r"([0-9.]+)\s*seconds",
            re.IGNORECASE,
        ),

        "lightningsim_simulation_time": re.compile(
            r"LightningSim simulation time:\s*"
            r"([0-9.]+)\s*seconds",
            re.IGNORECASE,
        ),

        "xsim_cpu_usage": re.compile(
            r"Simulation CPU Usage:\s*"
            r"([0-9.]+)\s*ms",
            re.IGNORECASE,
        ),
    }

    # --------------------------------------------------------
    # Parse log
    # --------------------------------------------------------

    for line in lines:

        model_match = model_pattern.search(line)

        if model_match:
            current_model = model_match.group(1)

            results.append({
                "model": current_model,
                "timings": [],
            })

        if current_model is None:
            continue

        # Vitis Python timer

        match = patterns[
            "python_vitis_timer"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "Vitis benchmark timer",
                "seconds": float(match.group(1)),
                "source": line.strip(),
            })

        # Explicit co-simulation time

        match = patterns[
            "explicit_cosimulation_time"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "Vitis reported co-simulation time",
                "seconds": float(match.group(1)),
                "source": line.strip(),
            })

        # C/RTL simulation

        match = patterns[
            "c_rtl_simulation_completed"
        ].search(line)

        if match:

            seconds = parse_time_string(
                match.group(1)
            )

            if seconds is not None:

                results[-1]["timings"].append({
                    "type": "Vitis C/RTL simulation completed",
                    "seconds": seconds,
                    "source": line.strip(),
                })

        # HLS total elapsed

        match = patterns[
            "hls_total_elapsed"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "HLS total elapsed",
                "seconds": float(match.group(1)),
                "source": line.strip(),
            })

        # Vitis-run total elapsed

        match = patterns[
            "vitis_run_total"
        ].search(line)

        if match:

            seconds = parse_time_string(
                match.group(1)
            )

            if seconds is not None:

                results[-1]["timings"].append({
                    "type": "Vitis-run total elapsed",
                    "seconds": seconds,
                    "source": line.strip(),
                })

        # LightningSim time

        match = patterns[
            "lightningsim_time"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "LightningSim time",
                "seconds": float(match.group(1)),
                "source": line.strip(),
            })

        # LightningSim simulation time

        match = patterns[
            "lightningsim_simulation_time"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "LightningSim simulation time",
                "seconds": float(match.group(1)),
                "source": line.strip(),
            })

        # XSIM CPU usage

        match = patterns[
            "xsim_cpu_usage"
        ].search(line)

        if match:

            results[-1]["timings"].append({
                "type": "XSIM CPU usage",
                "seconds": float(match.group(1)) / 1000,
                "source": line.strip(),
            })

    # --------------------------------------------------------
    # Write report
    # --------------------------------------------------------

    with open(
        OUTPUT_FILE,
        "w",
    ) as f:

        f.write(
            "VITIS / LIGHTNINGSIM TIMING EXTRACTION\n"
        )

        f.write(
            "=" * 70 + "\n\n"
        )

        for result in results:

            f.write(
                f"MODEL: {result['model']}\n"
            )

            f.write(
                "-" * 70 + "\n"
            )

            if not result["timings"]:

                f.write(
                    "No timing information found.\n\n"
                )

                continue

            for timing in result["timings"]:

                f.write(
                    f"{timing['type']}:\n"
                )

                f.write(
                    f"    {timing['seconds']:.3f} seconds\n"
                )

                f.write(
                    f"    Source: {timing['source']}\n\n"
                )

    print(
        f"✓ Extracted timing information written to "
        f"{OUTPUT_FILE}"
    )


if __name__ == "__main__":
    main()