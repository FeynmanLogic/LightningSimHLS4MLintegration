//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYPROJECT_CONFIG__SV                        
    `define MYPROJECT_CONFIG__SV                    
                                                            
    class myproject_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_input_1_cfg;
        svr_pkg::svr_config port_layer5_out_cfg;

        `uvm_object_utils_begin(myproject_config)         
        `uvm_field_object(port_input_1_cfg, UVM_DEFAULT)
        `uvm_field_object(port_layer5_out_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "myproject_config");
            super.new(name);                                
            port_input_1_cfg = svr_pkg::svr_config::type_id::create("port_input_1_cfg");
            port_layer5_out_cfg = svr_pkg::svr_config::type_id::create("port_layer5_out_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
