//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2.1 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef MYPROJECT_SCOREBOARD__SV                                                       
    `define MYPROJECT_SCOREBOARD__SV                                                   
                                                                                               
    `define AUTOTB_TVOUT_layer9_out_layer9_out_TDATA_wrapc  "../tv/rtldatafile/rtl.myproject.autotvout_layer9_out.dat"
    `define STREAM_SIZE_OUT_layer9_out_layer9_out_TDATA  "../tv/stream_size/stream_size_out_layer9_out.dat"
                                                                                               
    class myproject_scoreboard extends uvm_component;                                        
                                                                                               
        myproject_reference_model refm;                                                      
                                                                                               
        typedef integer TRANS_SIZE_QUEUE_TYPE [$];                                      
        TRANS_SIZE_QUEUE_TYPE TVOUT_transaction_size_queue;                                
        int write_file_done_layer9_out_layer9_out_TDATA;                                                          
        int write_section_done_layer9_out_layer9_out_TDATA = 0;                                                   
                                                                                           
        file_agent_pkg::file_read_agent#(32) file_rd_TVOUT_transaction_size;               
                                                                                           
        file_agent_pkg::file_write_agent#(80) file_wr_port_layer9_out_layer9_out_TDATA;
                                                                                               
        `uvm_component_utils_begin(myproject_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_field_object(file_rd_TVOUT_transaction_size, UVM_DEFAULT)
        `uvm_field_queue_int(TVOUT_transaction_size_queue, UVM_DEFAULT)                    
        `uvm_field_object(file_wr_port_layer9_out_layer9_out_TDATA, UVM_DEFAULT)
        `uvm_field_int(write_file_done_layer9_out_layer9_out_TDATA, UVM_DEFAULT)
        `uvm_field_int(write_section_done_layer9_out_layer9_out_TDATA, UVM_DEFAULT)
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(myproject_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
            file_rd_TVOUT_transaction_size = file_agent_pkg::file_read_agent#(32)::type_id::create("file_rd_TVOUT_transaction_size", this);
                                                                                               
            file_wr_port_layer9_out_layer9_out_TDATA = file_agent_pkg::file_write_agent#(80)::type_id::create("file_wr_port_layer9_out_layer9_out_TDATA", this);
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
            write_file_done_layer9_out_layer9_out_TDATA = 0;                                                          
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               
            create_TVOUT_transaction_size_queue_by_file(`STREAM_SIZE_OUT_layer9_out_layer9_out_TDATA);
            file_wr_port_layer9_out_layer9_out_TDATA.config_file(   
                    `AUTOTB_TVOUT_layer9_out_layer9_out_TDATA_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            

            fork                                                                               
                                                                                               
                forever begin
                    @refm.dut2tb_ap_done;
                    `uvm_info(this.get_full_name(), "receive dut2tb_ap_done and do axim dump", UVM_LOW)
                    file_wr_port_layer9_out_layer9_out_TDATA.receive_ap_done();
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                    file_wr_port_layer9_out_layer9_out_TDATA.wait_write_file_done();
                end                                                                            
                begin                                                                      
                    forever begin                                                              
                        wait(write_section_done_layer9_out_layer9_out_TDATA);                          
                        write_section_done_layer9_out_layer9_out_TDATA = 0;                                               
                        -> refm.allsvr_output_done;                                         
                    end                                                                        
                end                                                                        
            join                                                                               
        endtask                                                                                
                                                                                               
         virtual function void create_TVOUT_transaction_size_queue_by_file(string TVOUT_file); 
             typedef bit [31: 0] DATA_QUEUE_TYPE [$];                                     
             DATA_QUEUE_TYPE TV_Queue [$];                                                  
             DATA_QUEUE_TYPE TV;                                                               
             string file_queue [$];                                                         
             integer bitwidth_queue [$];                                                    
             file_queue.push_back(TVOUT_file);                                                 
             bitwidth_queue.push_back(32);                                                     
                                                                                               
             file_rd_TVOUT_transaction_size.config_file(                                       
                 file_queue,                                                                   
                 bitwidth_queue                                                                
             );                                                                                
                                                                                               
             file_rd_TVOUT_transaction_size.read_TVIN_file();                                  
                                                                                               
             TV_Queue = file_rd_TVOUT_transaction_size.TV_Queue;                               
             TVOUT_transaction_size_queue.delete();                                            
             while (TV_Queue.size() > 0) begin                                                 
                 TV = TV_Queue.pop_front();                                                    
                 if (TV.size() != 1)                                                           
                         `uvm_fatal(this.get_full_name(), $sformatf("number of each transaction size should be 1, read %0d in file %0s   ", TV.size(), TVOUT_file))
                 `uvm_info(this.get_full_name(), $sformatf("get transaction size %0d", TV[0]), UVM_MEDIUM)
                 TVOUT_transaction_size_queue.push_back(TV.pop_front());                       
             end                                                                               
         endfunction                                                                           
                                                                                               
        virtual function void write_svr_master_model_input(svr_transfer#(256) tr);
            `uvm_info(this.get_full_name(), "port model_input collected one pkt", UVM_DEBUG);          
        endfunction
                   
        virtual function void write_svr_slave_layer9_out(svr_transfer#(80) tr);
            `uvm_info(this.get_full_name(), "port layer9_out collected one pkt", UVM_DEBUG);          
            file_wr_port_layer9_out_layer9_out_TDATA.write_TVOUT_data(tr.data[79: 0]);
            write_file_done_layer9_out_layer9_out_TDATA = file_wr_port_layer9_out_layer9_out_TDATA.is_write_file_done();
            write_section_done_layer9_out_layer9_out_TDATA = file_wr_port_layer9_out_layer9_out_TDATA.is_write_section_done();
            if(write_section_done_layer9_out_layer9_out_TDATA) 
                `uvm_info("layer9_out rx data done", "signal name:layer9_out_TDATA", UVM_MEDIUM)
        endfunction
                   
    endclass                                                                                   
                                                                                               
`endif                                                                                         
