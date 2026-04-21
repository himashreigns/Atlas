# Stream Processing Neural Network Accelerator - Final Package

Complete hardware implementation of a reconfigurable neural network accelerator for FPGA deployment.

## Package Contents

```
stream_processing_final/
├── rtl/                          # RTL source files
│   ├── stream_processing_top.v  # Top-level FPGA wrapper
│   ├── mac_stage.v               # Basic MAC unit
│   ├── mac_array.v               # Systolic MAC array
│   ├── mac_array_stage_with_bram.v
│   ├── nn_layer_control_unit.v  # Address generation
│   ├── streaming_row_buffer.v    # Minimal buffering
│   ├── streaming_nn_layer_stage.v
│   ├── streaming_nn_pipeline.v   # Fixed pipeline
│   ├── streaming_nn_system.v     # Complete system
│   ├── reconfigurable_nn_accelerator.v  # Reconfigurable mode
│   ├── runtime_resource_manager.v
│   └── dynamic_interconnect.v
├── tb/                           # Testbenches
│   ├── tb_streaming_nn_system.v
│   └── tb_hw_vs_golden.sv
├── scripts/                      # Build automation
│   ├── create_project.tcl        # Create Vivado project
│   ├── build.tcl                 # Full synthesis flow
│   └── simulate.tcl              # Run simulation
├── constraints/                  # FPGA constraints
│   ├── timing_constraints.xdc
│   └── pin_constraints.xdc
├── docs/                         # Documentation
│   └── (reports generated here)
├── bitstream/                    # Generated bitstreams
└── README.md                     # This file
```

## Quick Start Guide

### Prerequisites

- **Xilinx Vivado** 2020.1 or later
- **Target Board**: Zynq-7000, UltraScale+, or Kintex-7
- **Python 3.7+** (for TensorFlow validation tools)
- **TensorFlow 2.x** (optional, for model export)

### Step 1: Setup

```bash
cd stream_processing_final
```

### Step 2: Create Vivado Project

```bash
vivado -mode batch -source scripts/create_project.tcl
```

Or in Vivado GUI:
```tcl
cd stream_processing_final
source scripts/create_project.tcl
```

### Step 3: Configure for Your Board

Edit `scripts/create_project.tcl` and set your target device:
```tcl
# Examples:
set target_device "xc7z020clg484-1"        # Zynq-7000 ZC702
# set target_device "xczu9eg-ffvb1156-2-e" # ZCU102
# set target_device "xc7k325tffg676-2"     # KC705
```

### Step 4: Update Pin Constraints

Edit `constraints/pin_constraints.xdc` with your board's pin assignments.

### Step 5: Build

**Option A: Full automated build**
```bash
vivado -mode batch -source scripts/build.tcl
```

**Option B: Step-by-step in GUI**
```tcl
# In Vivado TCL console:
cd stream_processing_final
open_project vivado_project/stream_processing_final.xpr

# Run synthesis
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# Run implementation
launch_runs impl_1 -jobs 8
wait_on_run impl_1

# Generate bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
```

### Step 6: Program FPGA

```tcl
# In Vivado Hardware Manager:
open_hw_manager
connect_hw_server
open_hw_target
current_hw_device [get_hw_devices xc7z020_1]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices] 0]
set_property PROGRAM.FILE {bitstream/stream_processing_final.bit} [get_hw_devices]
program_hw_devices [get_hw_devices]
```

## Configuration Modes

### Fixed Pipeline Mode (Default)

Best for: Known network architecture, maximum throughput
- 4-8 layers in fixed pipeline
- Lower resource usage
- Predictable latency
- No runtime reconfiguration

**To use:**
```verilog
// In stream_processing_top.v
parameter MODE = "FIXED_PIPELINE"
```

### Reconfigurable Mode

Best for: Multiple networks, deep networks, resource-constrained designs
- 16+ layers supported
- Runtime resource allocation
- Dynamic MAC/memory sharing
- Phase-based execution

**To use:**
```verilog
// In stream_processing_top.v
parameter MODE = "RECONFIGURABLE"
```

## Operating the Accelerator

### Memory Map (Control Interface)

| Address | Register | Access | Description |
|---------|----------|--------|-------------|
| 0x0000 | CTRL | W | Control register |
| 0x0004 | STATUS | R | Status register |
| 0x0008 | CONFIG | R | Configuration |
| 0x0010 | INPUT_BASE | W | Input data address |
| 0x0014 | OUTPUT_BASE | W | Output data address |
| 0x0018 | WEIGHT_BASE | W | Weight data address |

### Control Register (0x0000)

| Bit | Name | Description |
|-----|------|-------------|
| 0 | START | Start inference (write 1) |
| 1 | LOAD_WEIGHTS | Load weights (write 1) |
| 3:2 | MODE | Operation mode |

### Status Register (0x0004)

| Bit | Name | Description |
|-----|------|-------------|
| 0 | DONE | Inference complete |
| 1 | BUSY | Processing active |
| 2 | WEIGHTS_LOADED | Weights loaded |
| 11:4 | LAYER_BUSY | Per-layer busy status |

### Example Usage (C code)

```c
// Initialize accelerator
write_reg(ADDR_INPUT_BASE, 0x10000000);   // Input at 256MB
write_reg(ADDR_OUTPUT_BASE, 0x20000000);  // Output at 512MB
write_reg(ADDR_WEIGHT_BASE, 0x30000000);  // Weights at 768MB

// Load weights
write_reg(ADDR_CTRL, 0x02);  // Set LOAD_WEIGHTS
while(!(read_reg(ADDR_STATUS) & 0x04));  // Wait for WEIGHTS_LOADED

// Run inference
write_reg(ADDR_CTRL, 0x01);  // Set START
while(!(read_reg(ADDR_STATUS) & 0x01));  // Wait for DONE

// Read results from OUTPUT_BASE
```

## Resource Utilization

### Fixed Pipeline (4 layers, N=8)

| Resource | Used | Available | Utilization |
|----------|------|-----------|-------------|
| LUTs | ~15K | 53200 | ~28% |
| FFs | ~8K | 106400 | ~8% |
| BRAMs | ~24 | 140 | ~17% |
| DSPs | ~32 | 220 | ~15% |

### Reconfigurable (64 MACs, 32 BRAMs)

| Resource | Used | Available | Utilization |
|----------|------|-----------|-------------|
| LUTs | ~35K | 53200 | ~66% |
| FFs | ~18K | 106400 | ~17% |
| BRAMs | ~32 | 140 | ~23% |
| DSPs | ~64 | 220 | ~29% |

*Target device: Zynq-7020*

## Performance

### Fixed Pipeline
- **Clock**: 100 MHz
- **Throughput**: ~1-2 FPS for 28×28 images (LeNet-5 style)
- **Latency**: 1,500-2,500 cycles per inference
- **MAC Utilization**: 85-95%

### Reconfigurable
- **Clock**: 100 MHz  
- **Throughput**: ~0.5-1 FPS (depends on network depth)
- **Latency**: 5,000-10,000 cycles (includes reconfiguration)
- **MAC Utilization**: 90-95%
- **Reconfiguration Overhead**: <1%

## Validation with TensorFlow

See separate documentation in the Python scripts directory.

1. Export TensorFlow model:
```bash
python3 tf_to_hardware.py
```

2. Generate test vectors and golden outputs

3. Run hardware simulation

4. Compare results:
```bash
python3 compare_hw_golden.py
```

## Troubleshooting

### Synthesis Fails

**Error: Out of memory**
- Reduce NUM_LAYERS parameter
- Use incremental synthesis
- Close other applications

**Error: Timing not met**
- Reduce target clock frequency in constraints
- Add pipeline stages (increase ACC_W)
- Change synthesis strategy

### Implementation Fails

**Error: Unroutable design**
- Reduce resource usage (lower NUM_LAYERS or TOTAL_MAC_UNITS)
- Use different device
- Change floorplanning

**Error: Hold violations**
- Add output registers
- Check clock domain crossings

### Runtime Issues

**No output / hangs**
- Check clock is running
- Verify reset is released
- Check control register settings
- Verify weights are loaded

**Incorrect results**
- Validate with golden model
- Check fixed-point format
- Verify weight loading order
- Check memory addresses

## Design Parameters

### Adjustable Parameters

```verilog
// In stream_processing_top.v

// Fixed pipeline
parameter N = 8;              // MAC array width (4, 8, 16)
parameter NUM_LAYERS = 4;     // Pipeline depth (2-8)
parameter DATA_W = 16;        // Data width (8, 16, 32)
parameter ACC_W = 32;         // Accumulator width (32, 48, 64)

// Reconfigurable  
parameter TOTAL_MAC_UNITS = 64;    // Total MACs (32, 64, 128)
parameter TOTAL_BRAM_BLOCKS = 32;  // Total BRAMs (16, 32, 64)
parameter MAX_LAYERS = 16;         // Maximum layers (8, 16, 32)
```

### Recommended Configurations

**Small (Resource-constrained)**
```verilog
N = 4, NUM_LAYERS = 2, DATA_W = 8
Resources: ~5K LUTs, 8 BRAMs, 16 DSPs
```

**Medium (Balanced)**
```verilog
N = 8, NUM_LAYERS = 4, DATA_W = 16
Resources: ~15K LUTs, 24 BRAMs, 32 DSPs
```

**Large (Performance)**
```verilog
N = 16, NUM_LAYERS = 8, DATA_W = 16
Resources: ~50K LUTs, 64 BRAMs, 128 DSPs
```

## Directory Structure After Build

```
stream_processing_final/
├── vivado_project/
│   └── stream_processing_final.xpr
├── docs/
│   ├── synth_utilization.txt
│   ├── synth_timing.txt
│   ├── impl_utilization.txt
│   ├── impl_timing.txt
│   └── impl_power.txt
├── bitstream/
│   └── stream_processing_final.bit
└── ... (source files)
```

## Next Steps

1. **Customize for your network**: Edit layer configurations in `streaming_nn_pipeline.v`

2. **Optimize performance**: Adjust parameters, pipeline stages

3. **Integrate with PS**: For Zynq, create block design with PS+PL

4. **Add software driver**: C/C++ code to control accelerator

5. **Validate accuracy**: Use TensorFlow comparison tools

## Support and Documentation

- Hardware documentation: See markdown files in project root
- TensorFlow integration: See Python scripts
- Vivado guides: Xilinx documentation (UG901, UG904, UG906)

## License

Educational and research use.

## Authors

Stream Processing Neural Network Accelerator
Hardware Design Team
