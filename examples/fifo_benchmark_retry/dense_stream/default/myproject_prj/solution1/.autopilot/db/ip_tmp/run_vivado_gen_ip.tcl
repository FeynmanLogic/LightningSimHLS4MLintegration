create_project prj -part xc7z020-clg400-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "/nethome/dkulkarni47/LightningSimHLS4MLintegration/examples/fifo_benchmark_retry/dense_stream/default/myproject_prj/solution1/syn/verilog/myproject_fpext_32ns_64_4_no_dsp_1_ip.tcl"
source "/nethome/dkulkarni47/LightningSimHLS4MLintegration/examples/fifo_benchmark_retry/dense_stream/default/myproject_prj/solution1/syn/verilog/myproject_fexp_32ns_32ns_32_31_full_dsp_1_ip.tcl"
