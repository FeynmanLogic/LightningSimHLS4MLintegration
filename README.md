# LightningSim–hls4ml Integration (Proof of Concept)

## Overview

This repository contains an initial proof of concept for integrating **LightningSim** into the **hls4ml** workflow.

The objective is to explore a user-friendly workflow in which an hls4ml user can:

1. Generate and synthesize a Vitis HLS project using hls4ml.
2. Launch LightningSim with a single helper script.

This repository is **not** a modification of hls4ml itself. Instead, it serves as a prototype for evaluating the integration workflow before incorporating it into the hls4ml Vitis backend.

---

## Repository Structure

```text
.
├── activate_hls4ml_env.bat
├── main.py
└── run_lightningsim.py
```

### `main.py`

A minimal hls4ml example that:

* Downloads an example Keras model.
* Converts it to an hls4ml project.
* Invokes

```python
hls_model.build()
```

to generate and synthesize a Vitis HLS project.

---

### `run_lightningsim.py`

A helper utility intended to be executed **after synthesis completes**.

Current functionality:

* Locates a Conda installation.
* Detects whether a LightningSim Conda environment exists.
* Creates the environment automatically if required.
* Searches for the generated Vitis HLS `solution1` directory.
* Launches LightningSim using

```bash
lightningsim --skip-wait-for-synthesis <solution1>
```

The long-term goal is to package this functionality with hls4ml so users can launch LightningSim without manually locating the HLS project or invoking the LightningSim command themselves.

---

## Workflow

```text
User
 │
 ▼
python main.py
 │
 ▼
hls_model.build()
 │
 ▼
Vitis HLS synthesis
 │
 ▼
python run_lightningsim.py
 │
 ▼
LightningSim
```

---

## Current Status

### Completed

* Successfully synthesized an example hls4ml design using the Vitis backend.
* Developed a helper script that automates the LightningSim launch workflow.
* Added automatic detection of:

  * Conda installation
  * LightningSim environment
  * Generated `solution1` directory

### Current Limitation

The published LightningSim Conda package currently provides **Linux** binaries only.

As a result, while the helper script functions correctly, LightningSim itself cannot currently be installed on Windows using the published Conda package.

Validation on a Linux environment is planned.

---

## Design Philosophy

Rather than requiring users to learn LightningSim-specific commands, the goal is to preserve the existing hls4ml workflow.

The intended user experience is:

1. Write and execute a standard hls4ml script.
2. Run a single helper script to launch LightningSim.

This keeps LightningSim as an optional post-processing step while minimizing changes to the existing hls4ml interface.

---

## Future Work

* Validate the workflow on a Linux machine.
* Evaluate integration with the hls4ml Vitis backend.
* Investigate tighter integration with LightningSim's ability to execute in parallel with HLS synthesis, rather than only after synthesis has completed.
* Package the helper functionality with hls4ml to simplify installation and usage.

---

## Disclaimer

This repository is an exploratory proof of concept intended to evaluate possible integration strategies between LightningSim and hls4ml. It is not an official component of either project.
