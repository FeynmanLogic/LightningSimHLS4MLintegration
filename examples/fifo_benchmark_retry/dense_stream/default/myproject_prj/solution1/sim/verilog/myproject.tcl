
 
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $coutputgroup]
add_wave /apatb_myproject_top/AESL_inst_myproject/layer9_out_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/AESL_inst_myproject/layer9_out_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/AESL_inst_myproject/layer9_out_TDATA -into $return_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(axis) -into $cinputgroup]
add_wave /apatb_myproject_top/AESL_inst_myproject/model_input_TREADY -into $return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/AESL_inst_myproject/model_input_TVALID -into $return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/AESL_inst_myproject/model_input_TDATA -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_start -into $blocksiggroup
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_done -into $blocksiggroup
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_ready -into $blocksiggroup
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_idle -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_myproject_top/AESL_inst_myproject/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_myproject_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_myproject_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_myproject_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_myproject_top/LENGTH_layer9_out -into $tb_portdepth_group -radix hex
add_wave /apatb_myproject_top/LENGTH_model_input -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcoutputgroup]
add_wave /apatb_myproject_top/layer9_out_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/layer9_out_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/layer9_out_TDATA -into $tb_return_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_return_group [add_wave_group return(axis) -into $tbcinputgroup]
add_wave /apatb_myproject_top/model_input_TREADY -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/model_input_TVALID -into $tb_return_group -color #ffff00 -radix hex
add_wave /apatb_myproject_top/model_input_TDATA -into $tb_return_group -radix hex
save_wave_config myproject.wcfg
run all
quit

