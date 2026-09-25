#include <iostream>
#include "hls_stream.h"

using namespace std;

struct __cosim_T_10__ {char data[10];};
extern "C" void fpga_fifo_push_10(__cosim_T_10__* val, hls::stream<__cosim_T_10__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_10(__cosim_T_10__* val, hls::stream<__cosim_T_10__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_10(hls::stream<__cosim_T_10__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_10(hls::stream<__cosim_T_10__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_32__ {char data[32];};
extern "C" void fpga_fifo_push_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_32(hls::stream<__cosim_T_32__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_32(hls::stream<__cosim_T_32__>* fifo) {
  return fifo->exist();
}
