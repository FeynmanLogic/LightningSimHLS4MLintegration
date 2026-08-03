#!/usr/bin/env python3

"""
Run FIFOAdvisor on an hls4ml-generated Vitis HLS project.

Workflow
--------
1. Locate Conda.
2. Check whether the FIFOAdvisor environment exists.
3. If not, create it automatically.
4. Install FIFOAdvisor.
5. Locate a Vitis HLS solution1 directory.
6. Launch FIFOAdvisor.
"""

from pathlib import Path
import argparse
import shutil
import subprocess
import sys

DEFAULT_ENV = "fifo-advisor"


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

    for candidate in candidates:
        if candidate.exists():
            return str(candidate)

    return None


# --------------------------------------------------------------------
# FIFOAdvisor installation
# --------------------------------------------------------------------

def ensure_fifoadvisor(conda, env):
    print("\nChecking FIFOAdvisor installation...")

    result = subprocess.run(
        [
            conda,
            "run",
            "-n",
            env,
            "fifo-advisor",
            "--help",
        ],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    if result.returncode == 0:
        print("✓ FIFOAdvisor is already installed.")
        return

    print("\nFIFOAdvisor environment not found.")
    print("Creating Conda environment...\n")

    subprocess.run(
        [
            conda,
            "create",
            "--yes",
            "--name",
            env,
            "--channel",
            "conda-forge",
            "--channel",
            "https://sharc-lab.github.io/LightningSim/repo",
            "python=3.12",
            "lightningsim=0.2.6",
            "numpy",
            "pandas",
            "matplotlib",
            "seaborn",
            "scipy",
            "pymoo",
            "joblib",
            "ruff",
            "mypy",
            "git",
            "pip",
        ],
        check=True,
    )

    print("\nInstalling FIFOAdvisor...\n")

    subprocess.run(
        [
            conda,
            "run",
            "-n",
            env,
            "pip",
            "install",
            "--no-deps",
            "git+https://github.com/sharc-lab/fifo-advisor.git",
        ],
        check=True,
    )

    print("\n✓ FIFOAdvisor installed successfully.")


# --------------------------------------------------------------------
# Search for solution1
# --------------------------------------------------------------------

def find_solution():
    matches = sorted(
        p for p in Path.cwd().rglob("solution1")
        if p.is_dir()
    )

    if not matches:
        return None

    if len(matches) == 1:
        return matches[0]

    print("\nMultiple Vitis HLS solutions found:\n")

    for i, match in enumerate(matches, start=1):
        print(f"{i}. {match}")

    while True:
        try:
            choice = int(input("\nSelect solution number: "))
            return matches[choice - 1]
        except (ValueError, IndexError):
            print("Invalid selection.")


# --------------------------------------------------------------------
# Main
# --------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Run FIFOAdvisor on a Vitis HLS solution."
    )

    parser.add_argument(
        "solution",
        nargs="?",
        help="Path to solution1 (optional).",
    )

    parser.add_argument(
        "--env",
        default=DEFAULT_ENV,
        help="Conda environment name.",
    )

    parser.add_argument(
        "--solver",
        default="random",
        choices=[
            "random",
            "group-random",
            "heuristic",
            "sa",
            "group-sa",
        ],
        help="FIFOAdvisor optimization strategy.",
    )

    parser.add_argument(
        "--baseline",
        action="store_true",
        help="Evaluate default and depth-2 FIFO configurations.",
    )

    parser.add_argument(
        "--output",
        default="fifo_advisor_results.json",
        help="Output JSON file.",
    )

    parser.add_argument(
        "--seed",
        type=int,
        default=7,
        help="Random seed.",
    )

    parser.add_argument(
        "--n-samples",
        type=int,
        default=1000,
        help="Number of random samples.",
    )

    parser.add_argument(
        "--maxfun",
        type=int,
        default=100,
        help="Maximum evaluations for simulated annealing.",
    )

    parser.add_argument(
        "--n-scaling-factors",
        type=int,
        default=8,
        help="Scaling factors for simulated annealing.",
    )

    parser.add_argument(
        "--round-type",
        default="rint",
        choices=["floor", "ceil", "fix", "trunc", "round", "rint"],
        help="Rounding method for simulated annealing.",
    )

    parser.add_argument(
        "--init-with-largest",
        action="store_true",
        help="Initialize simulated annealing with largest FIFO depths.",
    )

    args = parser.parse_args()

    print("Locating Conda...")

    conda = find_conda()

    if conda is None:
        print("\nERROR")
        print("--------------------------------------------")
        print("Conda could not be located.")
        print("Please install Miniconda or Anaconda.")
        print("https://www.anaconda.com/download")
        print("--------------------------------------------")
        sys.exit(1)

    print(f"✓ Conda found:\n{conda}")

    ensure_fifoadvisor(conda, args.env)

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
        "fifo-advisor",
        str(solution),
    ]

    if args.baseline:
        cmd.append("--baseline")
    else:
        cmd.extend(
            [
                "--solver",
                args.solver,
            ]
        )

        if args.solver in ("random", "group-random"):
            cmd.extend(
                [
                    "--seed",
                    str(args.seed),
                    "--n-samples",
                    str(args.n_samples),
                ]
            )

        elif args.solver in ("sa", "group-sa"):
            cmd.extend(
                [
                    "--maxfun",
                    str(args.maxfun),
                    "--n-scaling-factors",
                    str(args.n_scaling_factors),
                    "--round-type",
                    args.round_type,
                ]
            )

            if args.init_with_largest:
                cmd.append("--init-with-largest")

    cmd.extend(
        [
            "--output",
            args.output,
        ]
    )

    print("\nLaunching FIFOAdvisor...\n")
    print(" ".join(cmd))
    print()

    subprocess.run(cmd, check=True)

    print("\n✓ FIFOAdvisor completed successfully.")


if __name__ == "__main__":
    main()