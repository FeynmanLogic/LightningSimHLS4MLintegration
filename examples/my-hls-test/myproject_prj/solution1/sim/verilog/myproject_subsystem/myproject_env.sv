//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYPROJECT_ENV__SV                                                                                   
    `define MYPROJECT_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class myproject_env extends uvm_env;                                                                          
                                                                                                                    
        myproject_virtual_sequencer myproject_virtual_sqr;                                                      
        myproject_config myproject_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(160) env_master_svr_input_1;
        svr_pkg::svr_env#(16) env_slave_svr_layer5_out;
                                                                                                                    
        myproject_reference_model   refm;                                                                         
                                                                                                                    
        myproject_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(myproject_env)                                                                 
        `uvm_field_object (env_master_svr_input_1,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_layer5_out,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (myproject_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (myproject_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "myproject_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void myproject_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        myproject_cfg = myproject_config::type_id::create("myproject_cfg", this);                           
                                                                                                                    
        myproject_cfg.port_input_1_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_input_1  = svr_env#(160)::type_id::create("env_master_svr_input_1", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_input_1*", "cfg", myproject_cfg.port_input_1_cfg);
        myproject_cfg.port_input_1_cfg.prt_type = svr_pkg::AP_VLD;
        myproject_cfg.port_input_1_cfg.is_active = svr_pkg::SVR_ACTIVE;
        myproject_cfg.port_input_1_cfg.spec_cfg = svr_pkg::NORMAL;
        myproject_cfg.port_input_1_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        myproject_cfg.port_layer5_out_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_layer5_out  = svr_env#(16)::type_id::create("env_slave_svr_layer5_out", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_layer5_out*", "cfg", myproject_cfg.port_layer5_out_cfg);
        myproject_cfg.port_layer5_out_cfg.prt_type = svr_pkg::AP_VLD;
        myproject_cfg.port_layer5_out_cfg.is_active = svr_pkg::SVR_ACTIVE;
        myproject_cfg.port_layer5_out_cfg.spec_cfg = svr_pkg::NORMAL;
        myproject_cfg.port_layer5_out_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 



        refm = myproject_reference_model::type_id::create("refm", this);


        uvm_config_db#(myproject_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = myproject_subsystem_monitor::type_id::create("subsys_mon", this);


        myproject_virtual_sqr = myproject_virtual_sequencer::type_id::create("myproject_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void myproject_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        myproject_virtual_sqr.svr_port_input_1_sqr = env_master_svr_input_1.m_agt.sqr;
        env_master_svr_input_1.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_input_1_imp);
 
        myproject_virtual_sqr.svr_port_layer5_out_sqr = env_slave_svr_layer5_out.s_agt.sqr;
        env_slave_svr_layer5_out.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_layer5_out_imp);
 
        refm.myproject_cfg = myproject_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task myproject_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "myproject_env is running", UVM_LOW)
    endtask


`endif
