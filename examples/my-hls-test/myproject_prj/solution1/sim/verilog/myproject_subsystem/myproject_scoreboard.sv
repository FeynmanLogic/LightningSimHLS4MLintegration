//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYPROJECT_SCOREBOARD__SV                                                       
    `define MYPROJECT_SCOREBOARD__SV                                                   
                                                                                               
    `define AUTOTB_TVOUT_layer5_out_layer5_out_wrapc  "../tv/rtldatafile/rtl.myproject.autotvout_layer5_out.dat"
                                                                                               
    class myproject_scoreboard extends uvm_component;                                        
                                                                                               
        myproject_reference_model refm;                                                      
                                                                                               
        typedef integer TRANS_SIZE_QUEUE_TYPE [$];                                      
        TRANS_SIZE_QUEUE_TYPE TVOUT_transaction_size_queue;                                
        int write_file_done_layer5_out_layer5_out;                                                          
        int write_section_done_layer5_out_layer5_out = 0;                                                   
                                                                                           
        file_agent_pkg::file_write_agent#(16) file_wr_port_layer5_out_layer5_out;
    svr_transfer#(16) layer5_out_apvld_rxtr;
                                                                                               
        `uvm_component_utils_begin(myproject_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_field_queue_int(TVOUT_transaction_size_queue, UVM_DEFAULT)                    
        `uvm_field_object(file_wr_port_layer5_out_layer5_out, UVM_DEFAULT)
        `uvm_field_int(write_file_done_layer5_out_layer5_out, UVM_DEFAULT)
        `uvm_field_int(write_section_done_layer5_out_layer5_out, UVM_DEFAULT)
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(myproject_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
                                                                                               
            file_wr_port_layer5_out_layer5_out = file_agent_pkg::file_write_agent#(16)::type_id::create("file_wr_port_layer5_out_layer5_out", this);
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
            write_file_done_layer5_out_layer5_out = 0;                                                          
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               
            create_TVOUT_transaction_size_queue_by_depth(1);
            file_wr_port_layer5_out_layer5_out.config_file(   
                    `AUTOTB_TVOUT_layer5_out_layer5_out_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            

            fork                                                                               
                                                                                               
                forever begin
                    @refm.dut2tb_ap_done;
                    `uvm_info(this.get_full_name(), "receive dut2tb_ap_done and do axim dump", UVM_LOW)
            if (layer5_out_apvld_rxtr) file_wr_port_layer5_out_layer5_out.write_TVOUT_data(layer5_out_apvld_rxtr.data[15: 0]);
                    file_wr_port_layer5_out_layer5_out.receive_ap_done();
             layer5_out_apvld_rxtr = null;
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                    file_wr_port_layer5_out_layer5_out.wait_write_file_done();
                end                                                                            
                begin                                                                      
                    forever begin                                                              
                        wait(write_section_done_layer5_out_layer5_out);                          
                        write_section_done_layer5_out_layer5_out = 0;                                               
                        -> refm.allsvr_output_done;                                         
                    end                                                                        
                end                                                                        
            join                                                                               
        endtask                                                                                
                                                                                               
        virtual function void create_TVOUT_transaction_size_queue_by_depth(integer depth); 
            integer i;                                                                     
            TVOUT_transaction_size_queue.delete();                                         
            for (i = 0; i < 5; i++)                                    
                TVOUT_transaction_size_queue.push_back(depth);                             
        endfunction                                                                        
                                                                                           
        virtual function void write_svr_master_input_1(svr_transfer#(160) tr);
            `uvm_info(this.get_full_name(), "port input_1 collected one pkt", UVM_DEBUG);          
        endfunction
                   
        virtual function void write_svr_slave_layer5_out(svr_transfer#(16) tr);
            `uvm_info(this.get_full_name(), "port layer5_out collected one pkt", UVM_DEBUG);          
             layer5_out_apvld_rxtr = tr;
            write_section_done_layer5_out_layer5_out = 1;
        endfunction
                   
    endclass                                                                                   
                                                                                               
`endif                                                                                         
