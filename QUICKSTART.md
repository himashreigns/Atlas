# Quick Setup and Run Guide

## For Vivado Users

### Prerequisites Check
```bash
# Check Vivado installation
which vivado
vivado -version

# Should output: Vivado v2020.1 or later
```

### Method 1: Using Makefile (Recommended)

```bash
cd stream_processing_final

# Step 1: Create project
make create

# Step 2: Build (synthesis + implementation + bitstream)
make build

# Step 3: Open in GUI to review
make gui

# Step 4: Program FPGA (when hardware connected)
make program
```

### Method 2: Using TCL Scripts Directly

```bash
cd stream_processing_final

# Create project
vivado -mode batch -source scripts/create_project.tcl

# Open GUI
vivado vivado_project/stream_processing_final.xpr

# Or build from command line
vivado -mode batch -source scripts/build.tcl
```

### Method 3: Full GUI Workflow

1. **Launch Vivado**
   ```bash
   vivado &
   ```

2. **In Vivado TCL Console:**
   ```tcl
   cd /path/to/stream_processing_final
   source scripts/create_project.tcl
   ```

3. **Or use GUI menus:**
   - File → Project → New
   - Add sources from `rtl/`
   - Add constraints from `constraints/`
   - Set top module: `stream_processing_top`

4. **Run Synthesis:**
   - Flow Navigator → Run Synthesis
   - Or: `launch_runs synth_1`

5. **Run Implementation:**
   - Flow Navigator → Run Implementation  
   - Or: `launch_runs impl_1`

6. **Generate Bitstream:**
   - Flow Navigator → Generate Bitstream
   - Or: `launch_runs impl_1 -to_step write_bitstream`

## Configuration Before Build

### 1. Select Your Target Board

Edit `scripts/create_project.tcl`:

```tcl
# Find this line and update:
set target_device "xc7z020clg484-1"

# Common options:
# set target_device "xc7z020clg484-1"        # Zynq-7020 (ZC702, PYNQ-Z2)
# set target_device "xczu9eg-ffvb1156-2-e"   # Zynq UltraScale+ (ZCU102)
# set target_device "xc7k325tffg676-2"       # Kintex-7 (KC705)
# set target_device "xc7a100tcsg324-1"       # Artix-7 (Arty A7-100)
```

### 2. Configure Pin Constraints

Edit `constraints/pin_constraints.xdc`:

```tcl
# Uncomment and modify for your board
# Example for LEDs on Zynq:
# set_property PACKAGE_PIN T22 [get_ports {status_leds[0]}]
# set_property IOSTANDARD LVCMOS33 [get_ports status_leds*]
```

### 3. Choose Operating Mode

Edit `rtl/stream_processing_top.v`:

```verilog
// Line ~11
parameter MODE = "FIXED_PIPELINE",  // or "RECONFIGURABLE"
```

**FIXED_PIPELINE**: Best for known networks, faster
**RECONFIGURABLE**: Best for multiple networks, more flexible

### 4. Adjust Resources

Edit `rtl/stream_processing_top.v`:

```verilog
// Fixed pipeline (lines 13-16)
parameter N = 8,              // MAC array width (4, 8, 16, 32)
parameter NUM_LAYERS = 4,     // Number of layers (2-8)

// Reconfigurable (lines 18-20)
parameter TOTAL_MAC_UNITS = 64,    // Total MACs (32, 64, 128)
parameter TOTAL_BRAM_BLOCKS = 32,  // Total BRAMs (16, 32, 64)
parameter MAX_LAYERS = 16,         // Max layers (8, 16, 32)
```

## Expected Build Time

| Target | Synthesis | Implementation | Total |
|--------|-----------|----------------|-------|
| Zynq-7020 | ~5 min | ~10 min | ~15 min |
| UltraScale+ | ~8 min | ~15 min | ~25 min |
| Kintex-7 | ~6 min | ~12 min | ~20 min |

*Times on typical workstation with 8 cores*

## Verifying Success

### After Synthesis

Check `docs/synth_timing.txt`:
```
Worst Negative Slack: 0.523 ns  ← Should be positive!
```

Check `docs/synth_utilization.txt`:
```
| LUTs     | 15234 | 53200 | 28.64 |  ← Should be <80%
| FFs      | 8123  | 106400| 7.64  |
| BRAMs    | 24    | 140   | 17.14 |
| DSPs     | 32    | 220   | 14.55 |
```

### After Implementation

Check `docs/impl_timing.txt`:
```
Worst Negative Slack: 0.234 ns  ← Should be positive!
```

If timing is negative:
1. Reduce clock frequency in `constraints/timing_constraints.xdc`
2. Add pipeline stages
3. Try different synthesis strategy

### After Bitstream

Check for file:
```bash
ls -lh bitstream/stream_processing_final.bit
# Should show ~5-15 MB file
```

## Common Issues and Solutions

### Issue: "Project not found"

**Solution:**
```bash
make create
# Then retry your command
```

### Issue: "Timing not met"

**Solution 1**: Reduce clock frequency
```tcl
# In constraints/timing_constraints.xdc
# Change from 10ns to 12ns (83 MHz instead of 100 MHz)
create_clock -period 12.000 -name clk [get_ports clk]
```

**Solution 2**: Change strategy
```tcl
# In scripts/create_project.tcl, try:
set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]
```

### Issue: "Out of resources"

**Solution**: Reduce parameters
```verilog
// In stream_processing_top.v
parameter N = 4,              // Reduce from 8
parameter NUM_LAYERS = 2,     // Reduce from 4
```

### Issue: "Unresolved module"

**Solution**: Check all files are in `rtl/`
```bash
ls rtl/*.v
# Should list all 12 .v files
```

## Running Simulation (Optional)

```bash
# Behavioral simulation
make simulate

# Or in Vivado:
# Flow Navigator → Simulation → Run Simulation → Run Behavioral Simulation
```

## Programming the FPGA

### Using Vivado Hardware Manager

1. Connect FPGA board via JTAG/USB
2. Power on board
3. In Vivado:
   ```tcl
   open_hw_manager
   connect_hw_server
   open_hw_target
   set_property PROGRAM.FILE {bitstream/stream_processing_final.bit} [get_hw_devices]
   program_hw_devices [get_hw_devices]
   ```

### Using Vivado GUI

1. Tools → Hardware Manager → Open Hardware Manager
2. Open target → Auto Connect
3. Right-click device → Program Device
4. Select `bitstream/stream_processing_final.bit`
5. Program

## Testing the Accelerator

### Option 1: Use Python Tools

```bash
cd python_tools

# Export TensorFlow model
python3 tf_to_hardware.py

# Generate test vectors
python3 run_end_to_end_example.py

# Compare with hardware (after running on FPGA)
python3 compare_hw_golden.py
```

### Option 2: Write C Driver

See `docs/` for register map and control interface.

Example:
```c
#include <stdio.h>
#include <stdint.h>

#define BASE_ADDR 0x43C00000  // Update for your design

void write_reg(uint32_t offset, uint32_t value) {
    volatile uint32_t *reg = (uint32_t*)(BASE_ADDR + offset);
    *reg = value;
}

uint32_t read_reg(uint32_t offset) {
    volatile uint32_t *reg = (uint32_t*)(BASE_ADDR + offset);
    return *reg;
}

int main() {
    // Load weights
    write_reg(0x00, 0x02);  // LOAD_WEIGHTS
    while(!(read_reg(0x04) & 0x04));  // Wait for loaded
    
    // Run inference
    write_reg(0x00, 0x01);  // START
    while(!(read_reg(0x04) & 0x01));  // Wait for done
    
    printf("Inference complete!\n");
    return 0;
}
```

## Next Steps

1. ✅ Build completes successfully
2. ✅ Timing is met (positive slack)
3. ✅ Bitstream generated
4. ✅ FPGA programmed
5. → Write software driver
6. → Load test data
7. → Run inference
8. → Validate results

## Getting Help

- **Synthesis errors**: Check `vivado_project/*/synth_1/runme.log`
- **Implementation errors**: Check `vivado_project/*/impl_1/runme.log`
- **Timing issues**: Review `docs/impl_timing.txt`
- **Resource issues**: Review `docs/impl_utilization.txt`

## Summary

**Fastest path to bitstream:**
```bash
cd stream_processing_final
make create
make build
# Wait 15-25 minutes
# Bitstream ready in bitstream/stream_processing_final.bit
```

**Congratulations! You now have a working NN accelerator on FPGA!**
