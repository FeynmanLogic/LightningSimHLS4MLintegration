set SynModuleInfo {
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<16, 6, 5, 3, 0>, config2>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s
    SUBMODULES {
      {MODELNAME myproject_mul_16s_10ns_26_1_1 RTLNAME myproject_mul_16s_10ns_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_9ns_25_1_1 RTLNAME myproject_mul_16s_9ns_25_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_11ns_26_1_1 RTLNAME myproject_mul_16s_11ns_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_7s_23_1_1 RTLNAME myproject_mul_16s_7s_23_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_10s_26_1_1 RTLNAME myproject_mul_16s_10s_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_8s_24_1_1 RTLNAME myproject_mul_16s_8s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_11s_26_1_1 RTLNAME myproject_mul_16s_11s_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_8ns_24_1_1 RTLNAME myproject_mul_16s_8ns_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_7ns_23_1_1 RTLNAME myproject_mul_16s_7ns_23_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_9s_25_1_1 RTLNAME myproject_mul_16s_9s_25_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_12s_26_1_1 RTLNAME myproject_mul_16s_12s_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_6s_22_1_1 RTLNAME myproject_mul_16s_6s_22_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_6ns_22_1_1 RTLNAME myproject_mul_16s_6ns_22_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_12ns_26_1_1 RTLNAME myproject_mul_16s_12ns_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_5s_21_1_1 RTLNAME myproject_mul_16s_5s_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {relu<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<16, 6, 5, 3, 0>, relu_config3>} MODELNAME relu_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_relu_config3_s RTLNAME myproject_relu_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_relu_config3_s}
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<16, 6, 5, 3, 0>, config4>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config4_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config4_s}
  {SRCNAME {sigmoid<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<16, 6, 5, 3, 0>, sigmoid_config5>} MODELNAME sigmoid_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_sigmoid_config5_s RTLNAME myproject_sigmoid_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_sigmoid_config5_s
    SUBMODULES {
      {MODELNAME myproject_sigmoid_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_sigmoid_config5_s_sigmoid_tabbkb RTLNAME myproject_sigmoid_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_sigmoid_config5_s_sigmoid_tabbkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME myproject MODELNAME myproject RTLNAME myproject IS_TOP 1}
}
