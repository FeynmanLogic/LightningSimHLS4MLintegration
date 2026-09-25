#!/usr/bin/env python3

from pathlib import Path

import hls4ml


MODELS = [
    "KERAS_1layer.json",
    "KERAS_3layer.json",
]

PART = "xc7z020clg400-1"
ROOT = Path("fifo_stream_models_vitis2023").resolve()


def build_model(model_name):
    model_stem = Path(model_name).stem
    output_dir = ROOT / model_stem

    print("\n" + "=" * 80)
    print(f"Building {model_name}")
    print(f"Output: {output_dir}")
    print("=" * 80)

    config = hls4ml.utils.fetch_example_model(
        model_name,
        backend="Vitis",
    )

    # The important change. This creates streaming interfaces
    # and FIFOs between supported layers.
    config["IOType"] = "io_stream"
    config["OutputDir"] = str(output_dir)
    config["Part"] = PART

    # Use resource-oriented implementations so the examples are
    # reasonably sized for synthesis.
    config.setdefault("HLSConfig", {})
    config["HLSConfig"].setdefault("Model", {})
    config["HLSConfig"]["Model"]["Strategy"] = "Resource"
    config["HLSConfig"]["Model"]["ReuseFactor"] = 4

    print("IOType:", config["IOType"])
    print("Part:", config["Part"])
    print("OutputDir:", config["OutputDir"])
    print("HLSConfig:", config["HLSConfig"])

    hls_model = hls4ml.converters.keras_v2_to_hls(config)

    # C synthesis is sufficient for the initial FIFOAdvisor run.
    # RTL co-simulation is not needed here.
    hls_model.build(
        csim=False,
        synth=True,
        cosim=False,
        export=False,
    )

    print(f"Completed: {model_name}")


def main():
    ROOT.mkdir(parents=True, exist_ok=True)

    for model in MODELS:
        build_model(model)


if __name__ == "__main__":
    main()