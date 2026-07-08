# =============================================================================
# ZedBoard HDMI (ADV7511) + VGA pin constraints
# Pinout per the Digilent ZedBoard master XDC / ADI reference designs.
# All video pins are on 3.3 V banks.
# =============================================================================

# ---- ADV7511 HDMI transmitter ------------------------------------------------
set_property -dict {PACKAGE_PIN W18  IOSTANDARD LVCMOS33} [get_ports hdmi_clk]
set_property -dict {PACKAGE_PIN W17  IOSTANDARD LVCMOS33} [get_ports hdmi_vsync]
set_property -dict {PACKAGE_PIN V17  IOSTANDARD LVCMOS33} [get_ports hdmi_hsync]
set_property -dict {PACKAGE_PIN U16  IOSTANDARD LVCMOS33} [get_ports hdmi_de]

set_property -dict {PACKAGE_PIN Y13  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[0]}]
set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[1]}]
set_property -dict {PACKAGE_PIN AA14 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[2]}]
set_property -dict {PACKAGE_PIN Y14  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[3]}]
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[4]}]
set_property -dict {PACKAGE_PIN AB16 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[5]}]
set_property -dict {PACKAGE_PIN AA16 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[6]}]
set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[7]}]
set_property -dict {PACKAGE_PIN AA17 IOSTANDARD LVCMOS33} [get_ports {hdmi_d[8]}]
set_property -dict {PACKAGE_PIN Y15  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[9]}]
set_property -dict {PACKAGE_PIN W13  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[10]}]
set_property -dict {PACKAGE_PIN W15  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[11]}]
set_property -dict {PACKAGE_PIN V15  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[12]}]
set_property -dict {PACKAGE_PIN U17  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[13]}]
set_property -dict {PACKAGE_PIN V14  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[14]}]
set_property -dict {PACKAGE_PIN V13  IOSTANDARD LVCMOS33} [get_ports {hdmi_d[15]}]

# ADV7511 I2C = AA18/Y16 (ADI mixer downstream ch1; R7/U7 is the FMC I2C and
# AB4/AB5 the audio codec). Driven by an axi_iic hardware master; the BD
# wrapper names the pads <intf>_scl_io / <intf>_sda_io and inserts IOBUFs.
set_property -dict {PACKAGE_PIN AA18 IOSTANDARD LVCMOS33} [get_ports hdmi_iic_scl_io]
set_property -dict {PACKAGE_PIN Y16  IOSTANDARD LVCMOS33} [get_ports hdmi_iic_sda_io]

# ---- VGA (resistor DAC, grayscale fallback) -----------------------------------
set_property -dict {PACKAGE_PIN V20  IOSTANDARD LVCMOS33} [get_ports {vga_r[0]}]
set_property -dict {PACKAGE_PIN U20  IOSTANDARD LVCMOS33} [get_ports {vga_r[1]}]
set_property -dict {PACKAGE_PIN V19  IOSTANDARD LVCMOS33} [get_ports {vga_r[2]}]
set_property -dict {PACKAGE_PIN V18  IOSTANDARD LVCMOS33} [get_ports {vga_r[3]}]
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports {vga_g[0]}]
set_property -dict {PACKAGE_PIN AA22 IOSTANDARD LVCMOS33} [get_ports {vga_g[1]}]
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports {vga_g[2]}]
set_property -dict {PACKAGE_PIN AA21 IOSTANDARD LVCMOS33} [get_ports {vga_g[3]}]
set_property -dict {PACKAGE_PIN Y21  IOSTANDARD LVCMOS33} [get_ports {vga_b[0]}]
set_property -dict {PACKAGE_PIN Y20  IOSTANDARD LVCMOS33} [get_ports {vga_b[1]}]
set_property -dict {PACKAGE_PIN AB20 IOSTANDARD LVCMOS33} [get_ports {vga_b[2]}]
set_property -dict {PACKAGE_PIN AB19 IOSTANDARD LVCMOS33} [get_ports {vga_b[3]}]
set_property -dict {PACKAGE_PIN AA19 IOSTANDARD LVCMOS33} [get_ports vga_hsync]
set_property -dict {PACKAGE_PIN Y19  IOSTANDARD LVCMOS33} [get_ports vga_vsync]

# ---- Timing --------------------------------------------------------------------
# FCLK0 (AXI 50/100 MHz) and FCLK1 (pixel 25 MHz) exchange data only through
# a dual-clock BRAM + toggle synchronizers designed for CDC.
set_clock_groups -asynchronous \
    -group [get_clocks clk_fpga_0] \
    -group [get_clocks clk_fpga_1]

# Video outputs feed the ADV7511 at 25 MHz — enormous margin; don't let the
# tools chase IO timing on them.
set_false_path -to [get_ports {hdmi_d[*] hdmi_de hdmi_hsync hdmi_vsync}]
set_false_path -to [get_ports {vga_r[*] vga_g[*] vga_b[*] vga_hsync vga_vsync}]
set_false_path -to [get_ports {hdmi_iic_scl_io hdmi_iic_sda_io}]
set_false_path -from [get_ports {hdmi_iic_scl_io hdmi_iic_sda_io}]

# Internal pull-ups for the ADV7511 I2C — belt and braces in case the board
# pull-ups are absent/weak on HD-SCL/HD-SDA.
set_property PULLUP true [get_ports hdmi_iic_scl_io]
set_property PULLUP true [get_ports hdmi_iic_sda_io]
