//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef MYPROJECT_SUBSYSTEM_PKG__SV          
    `define MYPROJECT_SUBSYSTEM_PKG__SV      
                                                     
    package myproject_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "myproject_config.sv"           
        `include "myproject_reference_model.sv"  
        `include "myproject_scoreboard.sv"       
        `include "myproject_subsystem_monitor.sv"
        `include "myproject_virtual_sequencer.sv"
        `include "myproject_pkg_sequence_lib.sv" 
        `include "myproject_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
