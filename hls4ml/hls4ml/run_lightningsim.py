#!/usr/bin/env python3

"""
Run LightningSim on an hls4ml-generated Vitis HLS project.

Workflow
--------
1. Locate Conda
2. Check whether the LightningSim environment exists
3. If not, create it automatically
4. Locate a Vitis HLS solution1 directory
5. Launch LightningSim
"""

from pathlib import Path
import argparse
import shutil
import subprocess
import sys

DEFAULT_ENV = "lightningsim"


# --------------------------------------------------------------------
# Conda
# --------------------------------------------------------------------

def find_conda():

    exe = shutil.which("conda")

    if exe:
        return exe

    candidates = [
        Path.home() / "miniconda3" / "condabin" / "conda.bat",
        Path.home() / "anaconda3" / "condabin" / "conda.bat",
        Path("C:/ProgramData/miniconda3/condabin/conda.bat"),
        Path("C:/ProgramData/anaconda3/condabin/conda.bat"),
    ]

    for c in candidates:
        if c.exists():
            return str(c)

    return None


# --------------------------------------------------------------------
# LightningSim installation
# --------------------------------------------------------------------

def ensure_lightningsim(conda, env):

    print("\nChecking LightningSim installation...")

    result = subprocess.run(
        [
            conda,
            "run",
            "-n",
            env,
            "lightningsim",
            "--help",
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    if result.returncode == 0:
        print("✓ LightningSim is already installed.")
        return

    print("\nLightningSim environment not found.")
    print("Creating Conda environment...\n")

    subprocess.run(
        [
            conda,
            "create",
            "--yes",
            "--name",
            env,
            "--channel",
            "https://sharc-lab.github.io/LightningSim/repo",
            "--channel",
            "conda-forge",
            "lightningsim",
        ],
        check=True,
    )

    print("\n✓ LightningSim installed successfully.")


# --------------------------------------------------------------------
# Search for solution1
# --------------------------------------------------------------------

def find_solution():

    matches = sorted(Path.cwd().rglob("solution1"))

    matches = [m for m in matches if m.is_dir()]

    if not matches:
        return None

    if len(matches) == 1:
        return matches[0]

    print("\nMultiple Vitis solutions found:\n")

    for i, m in enumerate(matches, start=1):
        print(f"{i}. {m}")

    while True:

        try:
            choice = int(input("\nSelect project number: "))
            return matches[choice - 1]
        except (ValueError, IndexError):
            print("Invalid selection.")


# --------------------------------------------------------------------
# Main
# --------------------------------------------------------------------

def main():

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "solution",
        nargs="?",
        help="Path to solution1 (optional)"
    )

    parser.add_argument(
        "--env",
        default=DEFAULT_ENV,
        help="Conda environment name"
    )

    args = parser.parse_args()

    print("Locating Conda...")

    conda = find_conda()

    if conda is None:
        print("\nERROR")
        print("--------------------------------------------")
        print("Conda could not be located.")
        print()
        print("Please install Miniconda or Anaconda.")
        print("https://www.anaconda.com/download")
        print("--------------------------------------------")
        sys.exit(1)

    print(f"✓ Conda found:\n{conda}")

    ensure_lightningsim(conda, args.env)

    if args.solution:
        solution = Path(args.solution).resolve()
    else:
        solution = find_solution()

    if solution is None:
        print("\nNo Vitis HLS solution1 directory found.")
        sys.exit(1)

    print(f"\nUsing solution:\n{solution}")

    cmd = [
        conda,
        "run",
        "-n",
        args.env,
        "lightningsim",
        "--skip-wait-for-synthesis",
        "--gui",
        str(solution),
    ]

    print("\nLaunching LightningSim...\n")

    print(" ".join(cmd))
    print()

    # ------------------------------------------------------------
    # CHANGED PORTION
    # ------------------------------------------------------------

    process = subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        bufsize=1,
    )

    simulation_finished = False

    while True:

        line = process.stdout.readline()

        if line:
            print(line, end="")

            if "Simulation finished." in line:
                simulation_finished = True
                break

        elif process.poll() is not None:
            break

    if not simulation_finished:

        return_code = process.poll()

        if return_code != 0:
            raise subprocess.CalledProcessError(
                return_code,
                cmd,
            )

        raise RuntimeError(
            "LightningSim exited before simulation finished."
        )

    print(
        "\n✓ LightningSim simulation completed successfully."
    )

    print(
        "✓ LightningSim GUI is still running."
    )

    # Return the process so the caller can terminate it
    # after reading the latency from the GUI.
    return process


if __name__ == "__main__":
    main()