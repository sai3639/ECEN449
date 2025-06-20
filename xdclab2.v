#clock_rt1
set_property PACKAGE_PIN K17 [ get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [ get_ports clk_100MHz]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [ get_ports clk_100MHz]

#led_tri_o
set_property PACKAGE_PIN M14 [ get_ports {led_tri_o[0]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {led_tri_o[0]}]

set_property PACKAGE_PIN M15 [ get_ports {led_tri_o[1]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {led_tri_o[1]}]

set_property PACKAGE_PIN G14 [ get_ports {led_tri_o[2]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {led_tri_o[2]}]

set_property PACKAGE_PIN D18 [ get_ports {led_tri_o[3]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {led_tri_o[3]}]


#switch_tri_i
set_property PACKAGE_PIN K18 [ get_ports {switch_tri_io[0]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[0]}]

set_property PACKAGE_PIN P16 [ get_ports {switch_tri_io[1]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[1]}]

set_property PACKAGE_PIN K19 [ get_ports {switch_tri_io[2]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[2]}]

set_property PACKAGE_PIN Y16 [ get_ports {switch_tri_io[3]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[3]}]

set_property PACKAGE_PIN G15 [ get_ports {switch_tri_io[4]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[4]}]

set_property PACKAGE_PIN P15 [ get_ports {switch_tri_io[5]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[5]}]

set_property PACKAGE_PIN W13 [ get_ports {switch_tri_io[6]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[6]}]

set_property PACKAGE_PIN T16 [ get_ports {switch_tri_io[7]}]
set_property IOSTANDARD LVCMOS33 [ get_ports {switch_tri_io[7]}]