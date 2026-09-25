set ModuleHierarchy {[{
"Name" : "myproject", "RefName" : "myproject","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "dense_array_ap_fixed_16u_array_ap_fixed_37_17_5_3_0_64u_config2_U0", "RefName" : "dense_array_ap_fixed_16u_array_ap_fixed_37_17_5_3_0_64u_config2_s","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_37_17_5_3_0_config2_s_fu_73", "RefName" : "dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_37_17_5_3_0_config2_s","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0", "RefName" : "relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_s","ID" : "3","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_U0", "RefName" : "dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_s","ID" : "4","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_39_19_5_3_0_config4_s_fu_289", "RefName" : "dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_39_19_5_3_0_config4_s","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0", "RefName" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_s","ID" : "6","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_U0", "RefName" : "dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_s","ID" : "7","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config6_s_fu_161", "RefName" : "dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config6_s","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0", "RefName" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_s","ID" : "9","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_U0", "RefName" : "dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_s","ID" : "10","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config8_s_fu_161", "RefName" : "dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config8_s","ID" : "11","Type" : "pipeline"},]},
	{"Name" : "softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0", "RefName" : "softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s","ID" : "12","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_fu_24", "RefName" : "softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s","ID" : "13","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_init_exp_table_ap_ufixed_37_17_5_3_0_softmax_config9_s_fu_285", "RefName" : "init_exp_table_ap_ufixed_37_17_5_3_0_softmax_config9_s","ID" : "14","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_151_1","RefName" : "VITIS_LOOP_151_1","ID" : "15","Type" : "pipeline"},]},]},]},]
}]}