set SynModuleInfo {
  {SRCNAME dense<array<ap_fixed,16u>,array<ap_fixed<16,6,5,3,0>,64u>,config2> MODELNAME dense_array_ap_fixed_16u_array_ap_fixed_16_6_5_3_0_64u_config2_s RTLNAME myproject_dense_array_ap_fixed_16u_array_ap_fixed_16_6_5_3_0_64u_config2_s
    SUBMODULES {
      {MODELNAME myproject_mux_4_2_16_1_1 RTLNAME myproject_mux_4_2_16_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_16s_26_2_1 RTLNAME myproject_mul_16s_16s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_10s_26_2_1 RTLNAME myproject_mul_16s_10s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_dense_array_ap_fixed_16u_array_ap_fixed_16_6_5_3_0_64u_config2_s_w2_ROM_NP_BRbkb RTLNAME myproject_dense_array_ap_fixed_16u_array_ap_fixed_16_6_5_3_0_64u_config2_s_w2_ROM_NP_BRbkb BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myproject_regslice_both RTLNAME myproject_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME myproject_regslice_both_U}
    }
  }
  {SRCNAME relu<array<ap_fixed,64u>,array<ap_fixed<16,6,5,3,0>,64u>,relu_config3> MODELNAME relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_s RTLNAME myproject_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_s}
  {SRCNAME dense<array<ap_fixed,64u>,array<ap_fixed<16,6,5,3,0>,32u>,config4> MODELNAME dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_s RTLNAME myproject_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_s
    SUBMODULES {
      {MODELNAME myproject_mul_16s_9s_25_2_1 RTLNAME myproject_mul_16s_9s_25_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_s_w4_ROM_NP_BRcud RTLNAME myproject_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_s_w4_ROM_NP_BRcud BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME relu<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,relu_config5> MODELNAME relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_s RTLNAME myproject_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_s}
  {SRCNAME dense<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,config6> MODELNAME dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_s RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_s
    SUBMODULES {
      {MODELNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_s_w6_ROM_NP_BRdEe RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_s_w6_ROM_NP_BRdEe BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME relu<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,relu_config7> MODELNAME relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_s RTLNAME myproject_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_s}
  {SRCNAME dense<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,5u>,config8> MODELNAME dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_s RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_s
    SUBMODULES {
      {MODELNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_s_w8_ROM_NP_BRAeOg RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_s_w8_ROM_NP_BRAeOg BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME softmax_stable<array,array<ap_fixed<16,6,5,3,0>,5u>,softmax_config9> MODELNAME softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s
    SUBMODULES {
      {MODELNAME myproject_mul_18s_11ns_26_2_1 RTLNAME myproject_mul_18s_11ns_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_exp_tablefYi RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_exp_tablefYi BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_invert_tag8j RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_invert_tag8j BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME softmax<array,array<ap_fixed<16,6,5,3,0>,5u>,softmax_config9> MODELNAME softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s RTLNAME myproject_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s}
  {SRCNAME myproject MODELNAME myproject RTLNAME myproject IS_TOP 1
    SUBMODULES {
      {MODELNAME myproject_fifo_w1024_d1_S RTLNAME myproject_fifo_w1024_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_U}
      {MODELNAME myproject_fifo_w1024_d1_S RTLNAME myproject_fifo_w1024_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer3_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer4_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer5_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer6_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer7_out_U}
      {MODELNAME myproject_fifo_w80_d1_S RTLNAME myproject_fifo_w80_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer8_out_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_32u_config4_U0_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_config6_U0_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_5u_config8_U0_U}
      {MODELNAME myproject_start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0 RTLNAME myproject_start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0_U}
    }
  }
}
