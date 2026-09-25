; ModuleID = '/nethome/dkulkarni47/LightningSimHLS4MLintegration/examples/fifo_stream_models_vitis2023/KERAS_1layer/myproject_prj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>" = type { %"struct.nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>" }
%"struct.nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>" = type { [10 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"] }
%"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>" = type { %"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" }
%"struct.ap_fixed_base<16, 6, true, AP_TRN, AP_WRAP, 0>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }
%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>" = type { %"struct.nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>" }
%"struct.nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>" = type { [1 x %"struct.ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>"] }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_myproject_ir(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias nocapture nonnull dereferenceable(20) %input_1, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias nocapture nonnull dereferenceable(2) %layer5_out) local_unnamed_addr #1 {
entry:
  %input_1_copy = alloca %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>", align 512
  call void @llvm.sideeffect() #7 [ "stream_interface"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %input_1_copy, i32 0) ]
  %layer5_out_copy = alloca %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>", align 512
  call void @llvm.sideeffect() #8 [ "stream_interface"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %layer5_out_copy, i32 0) ]
  call fastcc void @copy_in(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* nonnull %input_1, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* nonnull align 512 %input_1_copy, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* nonnull %layer5_out, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* nonnull align 512 %layer5_out_copy)
  call void @apatb_myproject_hw(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %input_1_copy, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %layer5_out_copy)
  call void @copy_back(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %input_1, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %input_1_copy, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %layer5_out, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %layer5_out_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias align 512, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* align 512 %1, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* align 512 %3, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias align 512 %dst, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %dst, null
  %1 = icmp eq %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* nonnull align 512 %dst, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias nocapture align 512, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias nocapture) unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_20(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_20(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>", %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %2
  %8 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0 to i8*
  call void @fpga_fifo_push_20(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias align 512 %dst, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %dst, null
  %1 = icmp eq %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* nonnull align 512 %dst, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias nocapture align 512, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias nocapture) unnamed_addr #4 {
entry:
  %2 = alloca %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_2(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>", %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2
  %8 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %0 to i8*
  call void @fpga_fifo_push_2(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias align 512, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* align 512 %3)
  ret void
}

declare void @apatb_myproject_hw(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"*, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* noalias align 512, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* noalias align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %2, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* align 512 %3)
  ret void
}

define void @myproject_hw_stub_wrapper(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"*, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"*) #6 {
entry:
  call void @copy_out(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* null, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* null, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %1)
  call void @myproject_hw_stub(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %1)
  call void @copy_in(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* null, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"* %0, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* null, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"* %1)
  ret void
}

declare void @myproject_hw_stub(%"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 10>, 0>"*, %"class.hls::stream<nnet::array<ap_fixed<16, 6, AP_TRN, AP_WRAP, 0>, 1>, 0>"*)

declare i1 @fpga_fifo_not_empty_20(i8*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare void @fpga_fifo_pop_20(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_push_20(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="160" "xlx.source"="user" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="16" "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
