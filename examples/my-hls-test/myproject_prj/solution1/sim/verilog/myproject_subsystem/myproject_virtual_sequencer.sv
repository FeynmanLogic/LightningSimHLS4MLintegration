//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYPROJECT_VIRTUAL_SEQUENCER__SV                        
    `define MYPROJECT_VIRTUAL_SEQUENCER__SV                    
                                                                       
    class myproject_virtual_sequencer extends uvm_sequencer;         
        svr_master_sequencer#(160) svr_port_input_1_sqr;
        svr_slave_sequencer#(16) svr_port_layer5_out_sqr;
 
        function new (string name, uvm_component parent);              
            super.new(name, parent);                                   
            //`uvm_info(this.get_full_name(), "new is called", UVM_LOW)
        endfunction                                                    
                                                                       
        `uvm_component_utils_begin(myproject_virtual_sequencer)      
        `uvm_component_utils_end                                       
                                                                       
    endclass

`endif
