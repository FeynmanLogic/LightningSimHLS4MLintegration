set SynModuleInfo {
  {SRCNAME dense<array<ap_fixed,10u>,array<ap_fixed<16,6,5,3,0>,32u>,config2> MODELNAME dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s RTLNAME myproject_dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s
    SUBMODULES {
      {MODELNAME myproject_mux_5_3_16_1_1 RTLNAME myproject_mux_5_3_16_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_16s_26_2_1 RTLNAME myproject_mul_16s_16s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_12s_26_2_1 RTLNAME myproject_mul_16s_12s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s_w2_66_ROM_NPbkb RTLNAME myproject_dense_array_ap_fixed_10u_array_ap_fixed_16_6_5_3_0_32u_config2_s_w2_66_ROM_NPbkb BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myproject_regslice_both RTLNAME myproject_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME myproject_regslice_both_U}
    }
  }
  {SRCNAME relu<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,relu_config3> MODELNAME relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_s RTLNAME myproject_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_s}
  {SRCNAME dense<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,1u>,config4> MODELNAME dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s
    SUBMODULES {
      {MODELNAME myproject_mux_4_2_16_1_1 RTLNAME myproject_mux_4_2_16_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_11s_26_2_1 RTLNAME myproject_mul_16s_11s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s_w4_67_ROM_NP_cud RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_s_w4_67_ROM_NP_cud BINDTYPE storage TYPE rom_np IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sigmoid<array,array<ap_fixed<16,6,5,3,0>,1u>,sigmoid_config5> MODELNAME sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s RTLNAME myproject_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s
    SUBMODULES {
      {MODELNAME myproject_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s_sigmoid_table_ROdEe RTLNAME myproject_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_s_sigmoid_table_ROdEe BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME myproject MODELNAME myproject RTLNAME myproject IS_TOP 1
    SUBMODULES {
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer3_out_U}
      {MODELNAME myproject_fifo_w16_d1_S RTLNAME myproject_fifo_w16_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer4_out_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config3_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_1u_config4_U0_U}
      {MODELNAME myproject_start_for_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0 RTLNAME myproject_start_for_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_sigmoid_array_array_ap_fixed_16_6_5_3_0_1u_sigmoid_config5_U0_U}
    }
  }
}
