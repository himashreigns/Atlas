# =============================================================================
# zedboard.xdc
# Constraints for the streaming DNN accelerator on ZedBoard (XC7Z020-CLG484-1)
# =============================================================================
# Target board : Avnet/Digilent ZedBoard, Rev D, XC7Z020-1CLG484
# Tool         : Vivado 2022.2 or newer
# Top module   : zedboard_top  (wraps streaming_nn_system; see rtl_stubs/)
#
# Bank summary (per Avnet/Digilent ZedBoard Master XDC):
#   Bank 13 : 3.3 V fixed (GCLK Y9, PMODs JA-JD)
#   Bank 33 : 3.3 V fixed (LEDs LD0-LD7, VGA, HDMI)
#   Bank 34 : 1.8 V default (push-buttons BTNC..BTNU, FMC LA00-LA16)
#   Bank 35 : 1.8 V default (DIP switches SW0..SW7, XADC, FMC LA17-LA33)
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Primary system clock: 100 MHz from the on-board oscillator on pin Y9
#    (10 ns period). This is what the user RTL sees as 'clk'.
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9       [get_ports clk]
set_property IOSTANDARD  LVCMOS33 [get_ports clk]
create_clock -name sys_clk_pin -period 10.000 -waveform {0.000 5.000} [get_ports clk]

# -----------------------------------------------------------------------------
# 2. Active-low reset: BTNC (P16, Bank 34, LVCMOS18)
#    The reset is treated as asynchronous; mark its path as false from STA.
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN P16      [get_ports rst_n]
set_property IOSTANDARD  LVCMOS18 [get_ports rst_n]
set_property PULLUP true          [get_ports rst_n]

# Async reset false-path so the unconstrained async edge doesn't pollute STA
set_false_path -from [get_ports rst_n]

# -----------------------------------------------------------------------------
# 3. Status LEDs (Bank 33, LVCMOS33 fixed)
#    LD0  : system_ready
#    LD1  : weights_loaded
#    LD2  : inference_done
#    LD3-6: layer_busy[3:0] (one LED per pipeline stage)
#    LD7  : heartbeat (free-running, ~1 Hz divided from 100 MHz)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports {leds[0]}]
set_property PACKAGE_PIN T21 [get_ports {leds[1]}]
set_property PACKAGE_PIN U22 [get_ports {leds[2]}]
set_property PACKAGE_PIN U21 [get_ports {leds[3]}]
set_property PACKAGE_PIN V22 [get_ports {leds[4]}]
set_property PACKAGE_PIN W22 [get_ports {leds[5]}]
set_property PACKAGE_PIN U19 [get_ports {leds[6]}]
set_property PACKAGE_PIN U14 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[*]}]

# LEDs are informational; relax I/O timing so they aren't on the critical path
set_false_path -to [get_ports {leds[*]}]

# -----------------------------------------------------------------------------
# 4. DIP switches: SW0=start_inference, SW1=load_weights (manual control)
#    (Bank 35 default 1.8 V on this board)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN F22 [get_ports {switches[0]}]
set_property PACKAGE_PIN G22 [get_ports {switches[1]}]
set_property IOSTANDARD  LVCMOS18 [get_ports {switches[*]}]

# Switches are debounced asynchronous inputs; mark async
set_false_path -from [get_ports {switches[*]}]

# -----------------------------------------------------------------------------
# 5. Timing exceptions and operating conditions
# -----------------------------------------------------------------------------
# Per-clock uncertainty (PLL jitter, sampling, derating)
set_clock_uncertainty -setup 0.200 [get_clocks sys_clk_pin]
set_clock_uncertainty -hold  0.050 [get_clocks sys_clk_pin]

# -----------------------------------------------------------------------------
# 6. Bitstream / configuration
# -----------------------------------------------------------------------------
set_property CFGBVS VCCO          [current_design]
set_property CONFIG_VOLTAGE 3.3   [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
