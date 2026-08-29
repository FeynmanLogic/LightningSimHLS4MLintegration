//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef MYPROJECT_SUBSYSTEM_MONITOR_SV
`define MYPROJECT_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_master_input_1)
`uvm_analysis_imp_decl(_svr_slave_layer5_out)

class myproject_subsystem_monitor extends uvm_component;

    myproject_reference_model refm;
    myproject_scoreboard scbd;

    `uvm_component_utils_begin(myproject_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_master_input_1#(svr_pkg::svr_transfer#(160), myproject_subsystem_monitor) svr_master_input_1_imp;
    uvm_analysis_imp_svr_slave_layer5_out#(svr_pkg::svr_transfer#(16), myproject_subsystem_monitor) svr_slave_layer5_out_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(myproject_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = myproject_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_master_input_1_imp = new("svr_master_input_1_imp", this);
        svr_slave_layer5_out_imp = new("svr_slave_layer5_out_imp", this);
    endfunction

    virtual function void write_svr_master_input_1(svr_transfer#(160) tr);
        refm.write_svr_master_input_1(tr);
        scbd.write_svr_master_input_1(tr);
    endfunction

    virtual function void write_svr_slave_layer5_out(svr_transfer#(16) tr);
        refm.write_svr_slave_layer5_out(tr);
        scbd.write_svr_slave_layer5_out(tr);
    endfunction
endclass
`endif
