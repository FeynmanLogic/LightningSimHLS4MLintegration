#ifndef MYPROJECT_H_
#define MYPROJECT_H_

#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"

#include "defines.h"


// Prototype of top level function for C-synthesis
void myproject(
    input_t input_1[10],
    result_t layer5_out[1]
);

// hls-fpga-machine-learning insert emulator-defines


#endif
