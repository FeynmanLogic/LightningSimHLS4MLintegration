//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import myproject_subsystem_pkg::*;
`include "myproject_subsys_test_sequence_lib.sv"
`include "myproject_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_myproject_top.AESL_clock), .reset(apatb_myproject_top.AESL_reset) );
    assign apatb_myproject_top.ap_start = misc_if.tb2dut_ap_start;
    assign misc_if.dut2tb_ap_done = apatb_myproject_top.ap_done;
    assign misc_if.dut2tb_ap_ready = apatb_myproject_top.ap_ready;
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(160)  svr_input_1_if    (.clk  (apatb_myproject_top.AESL_clock), .rst(apatb_myproject_top.AESL_reset));
    assign apatb_myproject_top.input_1_ap_vld = svr_input_1_if.valid;
    assign apatb_myproject_top.input_1 = svr_input_1_if.data[159:0];
    assign svr_input_1_if.ready = svr_input_1_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(160) )::set(null, "uvm_test_top.top_env.env_master_svr_input_1.*", "vif", svr_input_1_if);
    end


    svr_if #(16)  svr_layer5_out_if    (.clk  (apatb_myproject_top.AESL_clock), .rst(apatb_myproject_top.AESL_reset));
    assign svr_layer5_out_if.valid = apatb_myproject_top.layer5_out_ap_vld;
    assign svr_layer5_out_if.data[15:0] = apatb_myproject_top.layer5_out;
    initial begin
        uvm_config_db #( virtual svr_if#(16) )::set(null, "uvm_test_top.top_env.env_slave_svr_layer5_out.*", "vif", svr_layer5_out_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
