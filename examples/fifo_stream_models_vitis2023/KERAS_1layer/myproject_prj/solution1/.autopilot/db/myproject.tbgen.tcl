set moduleName myproject
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {myproject}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_1 int 160 regular {axi_s 0 volatile  { input_1 Data } }  }
	{ layer5_out int 16 regular {axi_s 1 volatile  { layer5_out Data } }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "input_1", "interface" : "axis", "bitwidth" : 160, "direction" : "READONLY"} , 
 	{ "Name" : "layer5_out", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ input_1_TDATA sc_in sc_lv 160 signal 0 } 
	{ layer5_out_TDATA sc_out sc_lv 16 signal 1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ input_1_TVALID sc_in sc_logic 1 invld 0 } 
	{ input_1_TREADY sc_out sc_logic 1 inacc 0 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ layer5_out_TVALID sc_out sc_logic 1 outvld 1 } 
	{ layer5_out_TREADY sc_in sc_logic 1 outacc 1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
}
set NewPortList {[ 
	{ "name": "input_1_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "input_1", "role": "TDATA" }} , 
 	{ "name": "layer5_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "layer5_out", "role": "TDATA" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "input_1_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_1", "role": "TVALID" }} , 
 	{ "name": "input_1_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_1", "role": "TREADY" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "layer5_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "layer5_out", "role": "TVALID" }} , 
 	{ "name": "layer5_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "layer5_out", "role": "TREADY" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "70", "71", "89", "92", "93", "94", "95", "96", "97"],
		"CDFG" : "myproject",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "26", "EstimateLatencyMax" : "26",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0"}],
		"OutputProcess" : [
			{"ID" : "89", "Name" : "sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0"}],
		"Port" : [
			{"Name" : "input_1", "Type" : "Axis", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0", "Port" : "input_1"}]},
			{"Name" : "layer5_out", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0", "Port" : "layer5_out"}]},
			{"Name" : "w2_66", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0", "Port" : "w2_66"}]},
			{"Name" : "w4_67", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "71", "SubInstance" : "dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0", "Port" : "w4_67"}]},
			{"Name" : "sigmoid_table", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0", "Port" : "sigmoid_table"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69"],
		"CDFG" : "dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "Rewind", "UnalignedPipeline" : "0", "RewindPipeline" : "1", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "10", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "input_1", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_1_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer2_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["70"], "DependentChan" : "92", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer2_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w2_66", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ReuseLoop", "PipelineType" : "rewind",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "has_continue" : "1"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.w2_66_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mux_5_3_16_1_1_U1", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mux_5_3_16_1_1_U2", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U3", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U4", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U5", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U6", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U7", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U8", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U9", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U10", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U11", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U12", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U13", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U14", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U15", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U16", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U17", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U18", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U19", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U20", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U21", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U22", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U23", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U24", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U25", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U26", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U27", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U28", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U29", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U30", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U31", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U32", "Parent" : "1"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U33", "Parent" : "1"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U34", "Parent" : "1"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U35", "Parent" : "1"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U36", "Parent" : "1"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U37", "Parent" : "1"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U38", "Parent" : "1"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U39", "Parent" : "1"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U40", "Parent" : "1"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U41", "Parent" : "1"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U42", "Parent" : "1"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U43", "Parent" : "1"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U44", "Parent" : "1"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U45", "Parent" : "1"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U46", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U47", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U48", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U49", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U50", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U51", "Parent" : "1"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U52", "Parent" : "1"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U53", "Parent" : "1"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U54", "Parent" : "1"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U55", "Parent" : "1"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U56", "Parent" : "1"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U57", "Parent" : "1"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U58", "Parent" : "1"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U59", "Parent" : "1"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U60", "Parent" : "1"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U61", "Parent" : "1"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U62", "Parent" : "1"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U63", "Parent" : "1"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U64", "Parent" : "1"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_16s_26_2_1_U65", "Parent" : "1"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.mul_16s_12s_26_2_1_U66", "Parent" : "1"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0.regslice_both_input_1_U", "Parent" : "1"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0", "Parent" : "0",
		"CDFG" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"StartSource" : "1",
		"StartFifo" : "start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0_U",
		"Port" : [
			{"Name" : "layer2_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["1"], "DependentChan" : "92", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer2_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer3_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["71"], "DependentChan" : "93", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer3_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0", "Parent" : "0", "Child" : ["72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88"],
		"CDFG" : "dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "Rewind", "UnalignedPipeline" : "0", "RewindPipeline" : "1", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "12", "EstimateLatencyMax" : "13",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"StartSource" : "70",
		"StartFifo" : "start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0_U",
		"Port" : [
			{"Name" : "layer3_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["70"], "DependentChan" : "93", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer3_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer4_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["89"], "DependentChan" : "94", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer4_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "w4_67", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "ReuseLoop", "PipelineType" : "rewind",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "has_continue" : "1"}}]},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.w4_67_U", "Parent" : "71"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U76", "Parent" : "71"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U77", "Parent" : "71"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U78", "Parent" : "71"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U79", "Parent" : "71"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U80", "Parent" : "71"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U81", "Parent" : "71"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U82", "Parent" : "71"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mux_4_2_16_1_1_U83", "Parent" : "71"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U84", "Parent" : "71"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U85", "Parent" : "71"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U86", "Parent" : "71"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U87", "Parent" : "71"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U88", "Parent" : "71"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U89", "Parent" : "71"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_16s_26_2_1_U90", "Parent" : "71"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0.mul_16s_11s_26_2_1_U91", "Parent" : "71"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0", "Parent" : "0", "Child" : ["90", "91"],
		"CDFG" : "sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"StartSource" : "71",
		"StartFifo" : "start_for_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0_U",
		"Port" : [
			{"Name" : "layer4_out", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["71"], "DependentChan" : "94", "DependentChanDepth" : "1", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "layer4_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "layer5_out", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "layer5_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sigmoid_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0.sigmoid_table_U", "Parent" : "89"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0.regslice_both_layer5_out_U", "Parent" : "89"},
	{"ID" : "92", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer2_out_U", "Parent" : "0"},
	{"ID" : "93", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer3_out_U", "Parent" : "0"},
	{"ID" : "94", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.layer4_out_U", "Parent" : "0"},
	{"ID" : "95", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0_U", "Parent" : "0"},
	{"ID" : "96", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0_U", "Parent" : "0"},
	{"ID" : "97", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	myproject {
		input_1 {Type I LastRead 1 FirstWrite -1}
		layer5_out {Type O LastRead -1 FirstWrite 5}
		w2_66 {Type I LastRead -1 FirstWrite -1}
		w4_67 {Type I LastRead -1 FirstWrite -1}
		sigmoid_table {Type I LastRead -1 FirstWrite -1}}
	dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s {
		input_1 {Type I LastRead 1 FirstWrite -1}
		layer2_out {Type O LastRead -1 FirstWrite 7}
		w2_66 {Type I LastRead -1 FirstWrite -1}}
	relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_s {
		layer2_out {Type I LastRead 0 FirstWrite -1}
		layer3_out {Type O LastRead -1 FirstWrite 2}}
	dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s {
		layer3_out {Type I LastRead 2 FirstWrite -1}
		layer4_out {Type O LastRead -1 FirstWrite 10}
		w4_67 {Type I LastRead -1 FirstWrite -1}}
	sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s {
		layer4_out {Type I LastRead 0 FirstWrite -1}
		layer5_out {Type O LastRead -1 FirstWrite 5}
		sigmoid_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "26", "Max" : "26"}
	, {"Name" : "Interval", "Min" : "7", "Max" : "7"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_1 { axis {  { input_1_TDATA in_data 0 160 }  { input_1_TVALID in_vld 0 1 }  { input_1_TREADY in_acc 1 1 } } }
	layer5_out { axis {  { layer5_out_TDATA out_data 1 16 }  { layer5_out_TVALID out_vld 1 1 }  { layer5_out_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
