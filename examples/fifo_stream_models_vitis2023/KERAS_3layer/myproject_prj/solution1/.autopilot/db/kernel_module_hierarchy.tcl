set ModuleHierarchy {[{
"Name" : "myproject","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "dense_array_ap_fixed_16u_array_ap_fixed_16_6_5_3_0_64u_config2_U0","ID" : "1","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0","ID" : "3","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_U0","ID" : "4","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0","ID" : "6","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_U0","ID" : "7","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0","ID" : "9","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_U0","ID" : "10","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "11","Type" : "pipeline"},]},
	{"Name" : "softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0","ID" : "12","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_fu_26","ID" : "13","Type" : "sequential"},]},]
}]}