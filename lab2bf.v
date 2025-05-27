
//snippet of led_sw.v

timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "led_sw,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=led_sw,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=19,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=6,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=5,da_mb_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "led_sw.hwdef" *)
module led_sw
   (clk_100MHz,
    led_tri_o,
    switch_tri_i,
    switch_tri_o,
    switch_tri_t);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN led_sw_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 led TRI_O" *) output [3:0]led_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 switch " *) input [7:0]switch_tri_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 switch " *) output [7:0]switch_tri_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 switch " *) output [7:0]switch_tri_t;