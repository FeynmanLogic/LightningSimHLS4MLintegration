set ModuleHierarchy {[{
"Name" : "myproject","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_U0","ID" : "1","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0","ID" : "3","Type" : "sequential"},
	{"Name" : "dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0","ID" : "4","Type" : "pipeline",
		"SubLoops" : [
		{"Name" : "ReuseLoop","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0","ID" : "6","Type" : "sequential"},]
}]}