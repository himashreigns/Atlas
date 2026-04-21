# Timing Constraints for Stream Processing Accelerator
# Target: 100 MHz operation (10 ns period)

# Create clock constraint
create_clock -period 10.000 -name clk [get_ports clk]

# Set input delay constraints (assume signals come from registers)
set_input_delay -clock clk -min 0.000 [get_ports -filter {NAME !~ "clk"}]
set_input_delay -clock clk -max 2.000 [get_ports -filter {NAME !~ "clk"}]

# Set output delay constraints
set_output_delay -clock clk -min 0.000 [get_ports -filter {DIRECTION == OUT}]
set_output_delay -clock clk -max 2.000 [get_ports -filter {DIRECTION == OUT}]

# Clock uncertainty for jitter and skew
set_clock_uncertainty 0.200 [get_clocks clk]

# False paths for reset
set_false_path -from [get_ports rst_n]

# Multicycle paths for memory accesses (2 cycles)
set_multicycle_path 2 -from [get_pins -hierarchical *mem_addr_reg*/C] \
                       -to [get_pins -hierarchical *mem_rdata_reg*/D]

# Max delay constraints for critical paths
set_max_delay 10.000 -from [get_pins -hierarchical *mac_array*/*/C] \
                     -to [get_pins -hierarchical *mac_array*/*/D]

# Case analysis for configuration parameters
# Set MODE to FIXED_PIPELINE for this build
# set_case_analysis 0 [get_pins -hierarchical */MODE*]

# Timing exceptions for debug signals
set_false_path -to [get_ports status_leds*]
set_false_path -to [get_ports done_interrupt]
set_false_path -to [get_ports error_interrupt]

# AXI interface timing
# Relax timing on AXI handshake signals (these have protocol level timing)
set_multicycle_path 2 -from [get_pins -hierarchical *axi*valid_reg/C] \
                       -to [get_pins -hierarchical *axi*ready*/D]

# BRAM timing
# Allow extra cycle for BRAM access
set_multicycle_path 2 -from [get_pins -hierarchical *bram*raddr*/C] \
                       -to [get_pins -hierarchical *bram*rdata*/D]

# Report timing settings
puts "Timing constraints applied:"
puts "  Clock period: 10 ns (100 MHz)"
puts "  Input delay: 0-2 ns"
puts "  Output delay: 0-2 ns"
puts "  Clock uncertainty: 0.2 ns"
