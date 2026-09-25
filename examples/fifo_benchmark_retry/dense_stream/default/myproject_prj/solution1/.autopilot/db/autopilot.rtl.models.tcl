set SynModuleInfo {
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<37, 17, 5, 3, 0>, config2>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_37_17_5_3_0_config2_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_37_17_5_3_0_config2_s
    SUBMODULES {
      {MODELNAME myproject_mul_16s_8s_24_2_1 RTLNAME myproject_mul_16s_8s_24_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_7s_23_2_1 RTLNAME myproject_mul_16s_7s_23_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_8ns_24_2_1 RTLNAME myproject_mul_16s_8ns_24_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_9s_25_2_1 RTLNAME myproject_mul_16s_9s_25_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_9ns_25_2_1 RTLNAME myproject_mul_16s_9ns_25_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_10ns_26_2_1 RTLNAME myproject_mul_16s_10ns_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_7ns_23_2_1 RTLNAME myproject_mul_16s_7ns_23_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_10s_26_2_1 RTLNAME myproject_mul_16s_10s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_6ns_22_2_1 RTLNAME myproject_mul_16s_6ns_22_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_6s_22_2_1 RTLNAME myproject_mul_16s_6s_22_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_5s_21_2_1 RTLNAME myproject_mul_16s_5s_21_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_mul_16s_5ns_21_2_1 RTLNAME myproject_mul_16s_5ns_21_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME dense<array<ap_fixed,16u>,array<ap_fixed<37,17,5,3,0>,64u>,config2> MODELNAME dense_array_ap_fixed_16u_array_ap_fixed_37_17_5_3_0_64u_config2_s RTLNAME myproject_dense_array_ap_fixed_16u_array_ap_fixed_37_17_5_3_0_64u_config2_s
    SUBMODULES {
      {MODELNAME myproject_regslice_both RTLNAME myproject_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
  {SRCNAME relu<array<ap_fixed,64u>,array<ap_fixed<16,6,5,3,0>,64u>,relu_config3> MODELNAME relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_s RTLNAME myproject_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_s}
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<39, 19, 5, 3, 0>, config4>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_39_19_5_3_0_config4_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_39_19_5_3_0_config4_s}
  {SRCNAME dense<array<ap_fixed,64u>,array<ap_fixed<39,19,5,3,0>,32u>,config4> MODELNAME dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_s RTLNAME myproject_dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_s}
  {SRCNAME relu<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,relu_config5> MODELNAME relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_s RTLNAME myproject_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_s}
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<38, 18, 5, 3, 0>, config6>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config6_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config6_s}
  {SRCNAME dense<array<ap_fixed,32u>,array<ap_fixed<38,18,5,3,0>,32u>,config6> MODELNAME dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_s RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_s}
  {SRCNAME relu<array<ap_fixed,32u>,array<ap_fixed<16,6,5,3,0>,32u>,relu_config7> MODELNAME relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_s RTLNAME myproject_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_s}
  {SRCNAME {dense_latency<ap_fixed<16, 6, 5, 3, 0>, ap_fixed<38, 18, 5, 3, 0>, config8>} MODELNAME dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config8_s RTLNAME myproject_dense_latency_ap_fixed_16_6_5_3_0_ap_fixed_38_18_5_3_0_config8_s}
  {SRCNAME dense<array<ap_fixed,32u>,array<ap_fixed<38,18,5,3,0>,5u>,config8> MODELNAME dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_s RTLNAME myproject_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_s}
  {SRCNAME {init_exp_table<ap_ufixed<37, 17, 5, 3, 0>, softmax_config9>} MODELNAME init_exp_table_ap_ufixed_37_17_5_3_0_softmax_config9_s RTLNAME myproject_init_exp_table_ap_ufixed_37_17_5_3_0_softmax_config9_s
    SUBMODULES {
      {MODELNAME myproject_fpext_32ns_64_4_no_dsp_1 RTLNAME myproject_fpext_32ns_64_4_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME myproject_fexp_32ns_32ns_32_31_full_dsp_1 RTLNAME myproject_fexp_32ns_32ns_32_31_full_dsp_1 BINDTYPE op TYPE fexp IMPL fulldsp LATENCY 30 ALLOW_PRAGMA 1}
      {MODELNAME myproject_ctlz_37_37_1_1 RTLNAME myproject_ctlz_37_37_1_1 BINDTYPE op TYPE ctlz IMPL auto}
      {MODELNAME myproject_bitselect_1ns_37ns_6ns_1_1_1 RTLNAME myproject_bitselect_1ns_37ns_6ns_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME myproject_lshr_37ns_32ns_37_7_1 RTLNAME myproject_lshr_37ns_32ns_37_7_1 BINDTYPE op TYPE lshr IMPL auto_pipe LATENCY 6}
      {MODELNAME myproject_shl_37ns_32ns_37_7_1 RTLNAME myproject_shl_37ns_32ns_37_7_1 BINDTYPE op TYPE shl IMPL auto_pipe LATENCY 6}
      {MODELNAME myproject_bitselect_1ns_54ns_6ns_1_1_1 RTLNAME myproject_bitselect_1ns_54ns_6ns_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME myproject_ashr_54ns_11ns_54_7_1 RTLNAME myproject_ashr_54ns_11ns_54_7_1 BINDTYPE op TYPE ashr IMPL auto_pipe LATENCY 6}
      {MODELNAME myproject_lshr_54ns_6ns_54_7_1 RTLNAME myproject_lshr_54ns_6ns_54_7_1 BINDTYPE op TYPE lshr IMPL auto_pipe LATENCY 6}
      {MODELNAME myproject_shl_18ns_11ns_18_2_1 RTLNAME myproject_shl_18ns_11ns_18_2_1 BINDTYPE op TYPE shl IMPL auto_pipe LATENCY 1}
      {MODELNAME myproject_sparsemux_7_2_18_1_1 RTLNAME myproject_sparsemux_7_2_18_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME myproject_sparsemux_7_2_1_1_1 RTLNAME myproject_sparsemux_7_2_1_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME myproject_sparsemux_7_2_16_1_1 RTLNAME myproject_sparsemux_7_2_16_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME myproject_flow_control_loop_pipe_sequential_init RTLNAME myproject_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME myproject_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME softmax_stable<array,array<ap_fixed<16,6,5,3,0>,5u>,softmax_config9> MODELNAME softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s
    SUBMODULES {
      {MODELNAME myproject_mul_18s_16s_26_2_1 RTLNAME myproject_mul_18s_16s_26_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_invert_tabkb RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_invert_tabkb BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_exp_tablecud RTLNAME myproject_softmax_stable_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s_exp_tablecud BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME softmax<array,array<ap_fixed<16,6,5,3,0>,5u>,softmax_config9> MODELNAME softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s RTLNAME myproject_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_s}
  {SRCNAME myproject MODELNAME myproject RTLNAME myproject IS_TOP 1
    SUBMODULES {
      {MODELNAME myproject_fifo_w2368_d1_S RTLNAME myproject_fifo_w2368_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer2_out_U}
      {MODELNAME myproject_fifo_w1024_d1_S RTLNAME myproject_fifo_w1024_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer3_out_U}
      {MODELNAME myproject_fifo_w1248_d1_S RTLNAME myproject_fifo_w1248_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer4_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer5_out_U}
      {MODELNAME myproject_fifo_w1216_d1_S RTLNAME myproject_fifo_w1216_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer6_out_U}
      {MODELNAME myproject_fifo_w512_d1_S RTLNAME myproject_fifo_w512_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer7_out_U}
      {MODELNAME myproject_fifo_w190_d1_S RTLNAME myproject_fifo_w190_d1_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME layer8_out_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_64u_array_ap_fixed_16_6_5_3_0_64u_relu_config3_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_64u_array_ap_fixed_39_19_5_3_0_32u_config4_U0_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config5_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_32u_config6_U0_U}
      {MODELNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0 RTLNAME myproject_start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_relu_array_ap_fixed_32u_array_ap_fixed_16_6_5_3_0_32u_relu_config7_U0_U}
      {MODELNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_U0 RTLNAME myproject_start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_dense_array_ap_fixed_32u_array_ap_fixed_38_18_5_3_0_5u_config8_U0_U}
      {MODELNAME myproject_start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0 RTLNAME myproject_start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0 BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME start_for_softmax_array_array_ap_fixed_16_6_5_3_0_5u_softmax_config9_U0_U}
    }
  }
}
