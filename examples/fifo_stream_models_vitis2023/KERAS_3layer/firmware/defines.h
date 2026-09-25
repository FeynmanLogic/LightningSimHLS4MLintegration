#ifndef DEFINES_H_
#define DEFINES_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "nnet_utils/nnet_types.h"
#include <array>
#include <cstddef>
#include <cstdio>
#include <tuple>
#include <tuple>


// hls-fpga-machine-learning insert numbers

// hls-fpga-machine-learning insert layer-precision
typedef nnet::array<ap_fixed<16,6>, 16*1> input_t;
typedef ap_fixed<16,6> model_default_t;
typedef nnet::array<ap_fixed<16,6>, 64*1> layer2_t;
typedef ap_uint<1> layer2_index;
typedef nnet::array<ap_fixed<16,6>, 64*1> layer3_t;
typedef ap_fixed<18,8> fc1_relu_relu_table_t;
typedef nnet::array<ap_fixed<16,6>, 32*1> layer4_t;
typedef ap_uint<1> layer4_index;
typedef nnet::array<ap_fixed<16,6>, 32*1> layer5_t;
typedef ap_fixed<18,8> fc2_relu_relu_table_t;
typedef nnet::array<ap_fixed<16,6>, 32*1> layer6_t;
typedef ap_uint<1> layer6_index;
typedef nnet::array<ap_fixed<16,6>, 32*1> layer7_t;
typedef ap_fixed<18,8> fc3_relu_relu_table_t;
typedef nnet::array<ap_fixed<16,6>, 5*1> layer8_t;
typedef ap_uint<1> layer8_index;
typedef nnet::array<ap_fixed<16,6>, 5*1> result_t;
typedef ap_fixed<18,8> output_softmax_softmax_table_t;
typedef ap_fixed<18,8,AP_RND,AP_SAT,0> output_softmax_softmax_exp_table_t;
typedef ap_fixed<18,8,AP_RND,AP_SAT,0> output_softmax_softmax_inv_table_t;
typedef ap_fixed<18,8,AP_RND,AP_SAT,0> output_softmax_softmax_inv_inp_t;

// hls-fpga-machine-learning insert emulator-defines


#endif
