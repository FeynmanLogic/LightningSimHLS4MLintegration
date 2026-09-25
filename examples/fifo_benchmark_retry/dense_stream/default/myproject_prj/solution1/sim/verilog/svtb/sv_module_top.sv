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


    svr_if #(256)  svr_model_input_if    (.clk  (apatb_myproject_top.AESL_clock), .rst(apatb_myproject_top.AESL_reset));
    assign svr_model_input_if.ready = apatb_myproject_top.model_input_TREADY;
    assign apatb_myproject_top.model_input_TVALID = svr_model_input_if.valid;
    assign apatb_myproject_top.model_input_TDATA = svr_model_input_if.data[255:0];
    initial begin
        uvm_config_db #( virtual svr_if#(256) )::set(null, "uvm_test_top.top_env.env_master_svr_model_input.*", "vif", svr_model_input_if);
    end


    svr_if #(80)  svr_layer9_out_if    (.clk  (apatb_myproject_top.AESL_clock), .rst(apatb_myproject_top.AESL_reset));
    assign apatb_myproject_top.layer9_out_TREADY = svr_layer9_out_if.ready;
    assign svr_layer9_out_if.valid = apatb_myproject_top.layer9_out_TVALID;
    assign svr_layer9_out_if.data[79:0] = apatb_myproject_top.layer9_out_TDATA;
    initial begin
        uvm_config_db #( virtual svr_if#(80) )::set(null, "uvm_test_top.top_env.env_slave_svr_layer9_out.*", "vif", svr_layer9_out_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
