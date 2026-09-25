#!/usr/bin/env python3

from pathlib import Path

import hls4ml


OUTPUT_DIR = Path(
    "fifoadvisor_adapter_models/keras_3layer"
).resolve()

PART = "xc7z020clg400-1"


WRAPPER_HEADER = r'''
#ifndef MYPROJECT_ARRAY_WRAPPER_H_
#define MYPROJECT_ARRAY_WRAPPER_H_

#include "myproject.h"

void myproject_array_wrapper(
    input_t &input_1,
    result_t &layer9_out
);

#endif
'''.lstrip()


WRAPPER_SOURCE = r'''
#include "myproject_array_wrapper.h"


static void input_to_stream(
    input_t &input_1,
    hls::stream<input_t> &input_stream
) {
#pragma HLS INLINE off
    input_stream.write(input_1);
}


static void stream_to_output(
    hls::stream<result_t> &output_stream,
    result_t &layer9_out
) {
#pragma HLS INLINE off
    layer9_out = output_stream.read();
}


void myproject_array_wrapper(
    input_t &input_1,
    result_t &layer9_out
) {
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS DATAFLOW

    hls::stream<input_t> input_stream(
        "adapter_input_stream"
    );

    hls::stream<result_t> output_stream(
        "adapter_output_stream"
    );

#pragma HLS STREAM variable=input_stream depth=2
#pragma HLS STREAM variable=output_stream depth=2

    input_to_stream(input_1, input_stream);
    myproject(input_stream, output_stream);
    stream_to_output(output_stream, layer9_out);
}
'''.lstrip()


TESTBENCH = r'''
#include <fstream>
#include <iostream>

#include "firmware/myproject_array_wrapper.h"


int main() {
    std::ofstream output_file(
        "tb_data/adapter_csim_results.log"
    );

    if (!output_file.is_open()) {
        std::cerr << "Unable to open output file."
                  << std::endl;
        return 1;
    }

    const unsigned number_of_samples = 5;

    for (
        unsigned sample = 0;
        sample < number_of_samples;
        sample++
    ) {
        input_t input_1;
        result_t layer9_out;

        for (unsigned index = 0; index < 16; index++) {
            float value = (
                static_cast<float>(sample)
                + static_cast<float>(index)
            ) / 32.0f;

            input_1[index] = value;
        }

        myproject_array_wrapper(
            input_1,
            layer9_out
        );

        for (unsigned index = 0; index < 5; index++) {
            float value = layer9_out[index].to_float();

            std::cout << value;

            output_file << value;

            if (index + 1 != 5) {
                std::cout << " ";
                output_file << " ";
            }
        }

        std::cout << std::endl;
        output_file << std::endl;
    }

    output_file.close();

    std::cout
        << "Adapter testbench completed successfully."
        << std::endl;

    return 0;
}
'''.lstrip()


def replace_once(text, old, new, description):
    count = text.count(old)

    if count != 1:
        raise RuntimeError(
            f"{description}: expected one occurrence, "
            f"found {count}"
        )

    return text.replace(old, new)


def main():
    print("Generating fresh hls4ml io_stream project...")

    config = hls4ml.utils.fetch_example_model(
        "KERAS_3layer.json",
        backend="Vitis",
    )

    config["IOType"] = "io_stream"
    config["OutputDir"] = str(OUTPUT_DIR)
    config["Part"] = PART

    hls_model = hls4ml.converters.keras_v2_to_hls(
        config
    )

    # Generate source only. Do not run synthesis yet.
    hls_model.write()

    firmware_dir = OUTPUT_DIR / "firmware"

    wrapper_header = (
        firmware_dir / "myproject_array_wrapper.h"
    )

    wrapper_source = (
        firmware_dir / "myproject_array_wrapper.cpp"
    )

    wrapper_testbench = (
        OUTPUT_DIR / "myproject_array_wrapper_test.cpp"
    )

    wrapper_header.write_text(WRAPPER_HEADER)
    wrapper_source.write_text(WRAPPER_SOURCE)
    wrapper_testbench.write_text(TESTBENCH)

    build_tcl = OUTPUT_DIR / "build_prj.tcl"
    build_text = build_tcl.read_text()

    build_text = replace_once(
        build_text,
        "set_top ${project_name}",
        "set_top myproject_array_wrapper",
        "top-function replacement",
    )

    build_text = replace_once(
        build_text,
        (
            'add_files firmware/${project_name}.cpp '
            '-cflags "-std=c++0x"'
        ),
        (
            'add_files firmware/${project_name}.cpp '
            '-cflags "-std=c++0x"\n'
            'add_files '
            'firmware/myproject_array_wrapper.cpp '
            '-cflags "-std=c++0x"'
        ),
        "wrapper source insertion",
    )

    testbench_count = build_text.count(
        "${project_name}_test.cpp"
    )

    if testbench_count < 1:
        raise RuntimeError(
            "No generated testbench references found."
        )

    build_text = build_text.replace(
        "${project_name}_test.cpp",
        "myproject_array_wrapper_test.cpp",
    )

    build_tcl.write_text(build_text)

    print("\nAdapter project prepared:")
    print(OUTPUT_DIR)

    print("\nTop function:")
    print("myproject_array_wrapper")

    print("\nInternal FIFO pragmas:")

    core_source = firmware_dir / "myproject.cpp"

    for line in core_source.read_text().splitlines():
        if "#pragma HLS STREAM" in line:
            print(line.strip())


if __name__ == "__main__":
    main()

