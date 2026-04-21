# Pin Constraints for Stream Processing Accelerator
# Template - Adjust for your specific board

# Note: This is a TEMPLATE. Update with actual pin locations for your board.
# Uncomment and modify pin assignments based on your hardware.

# ============================================================================
# Clock and Reset
# ============================================================================

# Example for ZC702 board (adjust for your board)
# set_property PACKAGE_PIN H9 [get_ports clk]
# set_property IOSTANDARD LVCMOS33 [get_ports clk]

# set_property PACKAGE_PIN G9 [get_ports rst_n]
# set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

# ============================================================================
# Status LEDs
# ============================================================================

# Example LED assignments (adjust for your board)
# set_property PACKAGE_PIN T22 [get_ports {status_leds[0]}]
# set_property PACKAGE_PIN T21 [get_ports {status_leds[1]}]
# set_property PACKAGE_PIN U22 [get_ports {status_leds[2]}]
# set_property PACKAGE_PIN U21 [get_ports {status_leds[3]}]
# set_property IOSTANDARD LVCMOS33 [get_ports status_leds*]

# ============================================================================
# AXI Interface (typically connected to PS in Zynq)
# ============================================================================

# For Zynq designs, AXI interfaces are internal and don't need pin constraints
# For standalone designs, uncomment and assign pins

# ============================================================================
# Interrupts
# ============================================================================

# set_property PACKAGE_PIN P20 [get_ports done_interrupt]
# set_property PACKAGE_PIN P21 [get_ports error_interrupt]
# set_property IOSTANDARD LVCMOS33 [get_ports *interrupt]

# ============================================================================
# Configuration
# ============================================================================

# Set bitstream options
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# ============================================================================
# Board-Specific Examples
# ============================================================================

# --- ZC702 Board Example ---
# set_property BOARD_PART xilinx.com:zc702:part0:1.4 [current_project]

# --- ZCU102 Board Example ---
# set_property BOARD_PART xilinx.com:zcu102:part0:3.4 [current_project]

# --- KC705 Board Example ---
# set_property BOARD_PART xilinx.com:kc705:part0:1.6 [current_project]

# ============================================================================
# Notes
# ============================================================================
# 
# This is a template constraint file. To use:
# 
# 1. Identify your target board
# 2. Uncomment and modify pin assignments
# 3. Refer to your board's user guide for pin locations
# 4. Set appropriate IOSTANDARD values
# 
# For Zynq PS+PL designs:
# - Most signals connect internally via AXI
# - Only external I/O (LEDs, etc.) need pin constraints
# 
# For standalone FPGA designs:
# - All external interfaces need pin constraints
# - Refer to board schematic for pin assignments
#
# ============================================================================
