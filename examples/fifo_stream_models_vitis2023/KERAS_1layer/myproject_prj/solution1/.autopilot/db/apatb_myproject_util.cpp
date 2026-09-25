#include <iostream>
#include "hls_stream.h"

using namespace std;

struct __cosim_T_2__ {char data[2];};
extern "C" void fpga_fifo_push_2(__cosim_T_2__* val, hls::stream<__cosim_T_2__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_2(__cosim_T_2__* val, hls::stream<__cosim_T_2__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_2(hls::stream<__cosim_T_2__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_2(hls::stream<__cosim_T_2__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_20__ {char data[20];};
extern "C" void fpga_fifo_push_20(__cosim_T_20__* val, hls::stream<__cosim_T_20__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_20(__cosim_T_20__* val, hls::stream<__cosim_T_20__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_20(hls::stream<__cosim_T_20__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_20(hls::stream<__cosim_T_20__>* fifo) {
  return fifo->exist();
}
