## Nexys A7 100T Constraints for Systolic Array Demo
## Clock: 100MHz onboard oscillator

# System Clock
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Buttons (CPU_RST = center, BTN_UP = up)
set_property PACKAGE_PIN N17 [get_ports btn_cpu_rst]
set_property IOSTANDARD LVCMOS33 [get_ports btn_cpu_rst]

set_property PACKAGE_PIN M18 [get_ports btn_up]
set_property IOSTANDARD LVCMOS33 [get_ports btn_up]

# Slide Switches (SW0-SW15)
set_property PACKAGE_PIN J15 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]

set_property PACKAGE_PIN L16 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]

set_property PACKAGE_PIN M13 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]

set_property PACKAGE_PIN R15 [get_ports sw[3]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]

set_property PACKAGE_PIN R17 [get_ports sw[4]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[4]]

set_property PACKAGE_PIN T18 [get_ports sw[5]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[5]]

set_property PACKAGE_PIN U18 [get_ports sw[6]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]]

set_property PACKAGE_PIN R13 [get_ports sw[7]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]]

set_property PACKAGE_PIN T8 [get_ports sw[8]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[8]]

set_property PACKAGE_PIN U8 [get_ports sw[9]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[9]]

set_property PACKAGE_PIN R16 [get_ports sw[10]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[10]]

set_property PACKAGE_PIN T13 [get_ports sw[11]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[11]]

set_property PACKAGE_PIN H6 [get_ports sw[12]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[12]]

set_property PACKAGE_PIN U12 [get_ports sw[13]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[13]]

set_property PACKAGE_PIN U11 [get_ports sw[14]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[14]]

set_property PACKAGE_PIN V6 [get_ports sw[15]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[15]]

# LEDs (LED0-LED15)
set_property PACKAGE_PIN H17 [get_ports led[0]]
set_property IOSTANDARD LVCMOS33 [get_ports led[0]]

set_property PACKAGE_PIN K15 [get_ports led[1]]
set_property IOSTANDARD LVCMOS33 [get_ports led[1]]

set_property PACKAGE_PIN J13 [get_ports led[2]]
set_property IOSTANDARD LVCMOS33 [get_ports led[2]]

set_property PACKAGE_PIN N14 [get_ports led[3]]
set_property IOSTANDARD LVCMOS33 [get_ports led[3]]

set_property PACKAGE_PIN R18 [get_ports led[4]]
set_property IOSTANDARD LVCMOS33 [get_ports led[4]]

set_property PACKAGE_PIN V17 [get_ports led[5]]
set_property IOSTANDARD LVCMOS33 [get_ports led[5]]

set_property PACKAGE_PIN U17 [get_ports led[6]]
set_property IOSTANDARD LVCMOS33 [get_ports led[6]]

set_property PACKAGE_PIN U16 [get_ports led[7]]
set_property IOSTANDARD LVCMOS33 [get_ports led[7]]

set_property PACKAGE_PIN K17 [get_ports led[8]]
set_property IOSTANDARD LVCMOS33 [get_ports led[8]]

set_property PACKAGE_PIN L18 [get_ports led[9]]
set_property IOSTANDARD LVCMOS33 [get_ports led[9]]

set_property PACKAGE_PIN H15 [get_ports led[10]]
set_property IOSTANDARD LVCMOS33 [get_ports led[10]]

set_property PACKAGE_PIN J16 [get_ports led[11]]
set_property IOSTANDARD LVCMOS33 [get_ports led[11]]

set_property PACKAGE_PIN J18 [get_ports led[12]]
set_property IOSTANDARD LVCMOS33 [get_ports led[12]]

set_property PACKAGE_PIN K13 [get_ports led[13]]
set_property IOSTANDARD LVCMOS33 [get_ports led[13]]

set_property PACKAGE_PIN P15 [get_ports led[14]]
set_property IOSTANDARD LVCMOS33 [get_ports led[14]]

set_property PACKAGE_PIN P16 [get_ports led[15]]
set_property IOSTANDARD LVCMOS33 [get_ports led[15]]

# 7-Segment Display (disabled in this demo)
set_property PACKAGE_PIN G14 [get_ports an[0]]
set_property IOSTANDARD LVCMOS33 [get_ports an[0]]

set_property PACKAGE_PIN D18 [get_ports an[1]]
set_property IOSTANDARD LVCMOS33 [get_ports an[1]]

set_property PACKAGE_PIN K16 [get_ports an[2]]
set_property IOSTANDARD LVCMOS33 [get_ports an[2]]

set_property PACKAGE_PIN E17 [get_ports an[3]]
set_property IOSTANDARD LVCMOS33 [get_ports an[3]]

set_property PACKAGE_PIN F15 [get_ports an[4]]
set_property IOSTANDARD LVCMOS33 [get_ports an[4]]

set_property PACKAGE_PIN F16 [get_ports an[5]]
set_property IOSTANDARD LVCMOS33 [get_ports an[5]]

set_property PACKAGE_PIN G15 [get_ports an[6]]
set_property IOSTANDARD LVCMOS33 [get_ports an[6]]

set_property PACKAGE_PIN H14 [get_ports an[7]]
set_property IOSTANDARD LVCMOS33 [get_ports an[7]]

set_property PACKAGE_PIN C17 [get_ports dp]
set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN D17 [get_ports seg[0]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[0]]

set_property PACKAGE_PIN C13 [get_ports seg[1]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[1]]

set_property PACKAGE_PIN E15 [get_ports seg[2]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[2]]

set_property PACKAGE_PIN C15 [get_ports seg[3]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[3]]

set_property PACKAGE_PIN D15 [get_ports seg[4]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[4]]

set_property PACKAGE_PIN D14 [get_ports seg[5]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[5]]

set_property PACKAGE_PIN F14 [get_ports seg[6]]
set_property IOSTANDARD LVCMOS33 [get_ports seg[6]]
