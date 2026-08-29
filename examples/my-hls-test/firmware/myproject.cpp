#include <iostream>

#include "myproject.h"
#include "parameters.h"


void myproject(
    input_t input_1[10],
    result_t layer5_out[1]
) {

    // hls-fpga-machine-learning insert IO
    #pragma HLS ARRAY_RESHAPE variable=input_1 complete dim=0
    #pragma HLS ARRAY_PARTITION variable=layer5_out complete dim=0
    #pragma HLS INTERFACE ap_vld port=input_1,layer5_out 
    #pragma HLS PIPELINE

    // hls-fpga-machine-learning insert load weights
#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        nnet::load_weights_from_txt<model_default_t, 320>(w2, "w2.txt");
        nnet::load_weights_from_txt<model_default_t, 32>(b2, "b2.txt");
        nnet::load_weights_from_txt<model_default_t, 32>(w4, "w4.txt");
        nnet::load_weights_from_txt<model_default_t, 1>(b4, "b4.txt");
        loaded_weights = true;    }
#endif
    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    // hls-fpga-machine-learning insert layers

    layer2_t layer2_out[32];
    #pragma HLS ARRAY_PARTITION variable=layer2_out complete dim=0

    layer3_t layer3_out[32];
    #pragma HLS ARRAY_PARTITION variable=layer3_out complete dim=0

    layer4_t layer4_out[1];
    #pragma HLS ARRAY_PARTITION variable=layer4_out complete dim=0

    nnet::dense<input_t, layer2_t, config2>(input_1, layer2_out, w2, b2); // fc1_relu

    nnet::relu<layer2_t, layer3_t, relu_config3>(layer2_out, layer3_out); // fc1_relu_relu

    nnet::dense<layer3_t, layer4_t, config4>(layer3_out, layer4_out, w4, b4); // output_sigmoid

    nnet::sigmoid<layer4_t, result_t, sigmoid_config5>(layer4_out, layer5_out); // output_sigmoid_sigmoid

}

