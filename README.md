Part available on my system: xc7z010clg400-1
# LightningSim–hls4ml Integration (V1)

## Overview

This repository contains **Version 1** of the LightningSim integration for **hls4ml**.

The repository serves as a self-contained development environment that includes:

* a local checkout of the hls4ml source tree,
* modifications implementing the LightningSim integration,
* a minimal example demonstrating the workflow, and
* supporting scripts for setting up the required development environment.

The objective is to evaluate a seamless post-synthesis simulation workflow that allows users to launch LightningSim directly from hls4ml after Vitis HLS synthesis.

---

## Repository Structure

```text
LightningSimHLS4MLintegration/
│
├── README.md
├── activate_hls4ml_env.bat
├── main.py
│
└── hls4ml/
    ├── setup.py
    ├── pyproject.toml
    ├── hls4ml/
    │   ├── __init__.py
    │   ├── run_lightningsim.py
    │   └── ...
    └── ...
```

### Components

**`main.py`**

Demonstrates a complete hls4ml workflow:

* converts an example neural network,
* synthesizes the design using Vitis HLS,
* launches LightningSim using

```python
hls4ml.run_lightningsim()
```

---

**`hls4ml/`**

A local development copy of the hls4ml source tree.

Version 1 introduces:

* `run_lightningsim.py`
* updates to `__init__.py`
* supporting integration changes

These modifications expose LightningSim as a native hls4ml API.

---

**`activate_hls4ml_env.bat`**

Convenience script for activating the required Vitis and Conda environments during development.

---

## Workflow

```
User Script
     │
     ▼
hls_model.build()
     │
     ▼
Vitis HLS synthesis
     │
     ▼
hls4ml.run_lightningsim()
     │
     ▼
LightningSim
```

---

## Current Features

* Automatic detection of Conda.
* Automatic detection or creation of the LightningSim environment.
* Automatic discovery of the generated `solution1` directory.
* Launches LightningSim without requiring manual command-line interaction.
* Validated on Linux (RHEL) for end-to-end execution.

---

## Current Limitations

The published LightningSim Conda package currently provides Linux binaries only.

Development and API integration have been carried out on Windows, while complete execution has been validated on Linux.

---

## Future Work

* Integrate the launcher directly into the official hls4ml Vitis backend.
* Remove filesystem-based project discovery by using internal project metadata.
* Investigate tighter integration with LightningSim's parallel execution capabilities.
* Submit the implementation for consideration by the hls4ml project.

---

## Purpose

This repository represents **Version 1** of the proposed LightningSim integration for hls4ml and is intended as a development branch prior to upstream integration.

---

