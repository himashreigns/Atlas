# Complete TensorFlow to Hardware Validation Guide

This guide walks through the complete process of taking a pretrained TensorFlow model, mapping it to hardware, and validating every intermediate result.

## Overview

```
TensorFlow Model → Export → Hardware Simulation → Comparison → Validation
     (Python)        ↓          (Verilog)            ↓           (Report)
                  Weights                       Golden vs HW
                  Test Vectors                  Layer-by-layer
                  Golden Outputs                MAC products
```

## Step 1: Export TensorFlow Model

### 1.1 Prepare Your Model

```python
import tensorflow as tf
import numpy as np

# Option A: Load a pretrained model
model = tf.keras.models.load_model('my_pretrained_model.h5')

# Option B: Use a standard model
from tensorflow.keras.applications import MobileNetV2
model = MobileNetV2(input_shape=(224, 224, 3), include_top=False)

# Option C: Load the example model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(28, 28, 1)),
    tf.keras.layers.Conv2D(6, (5, 5), padding='valid', name='conv_0'),
    tf.keras.layers.MaxPooling2D((2, 2), name='pool_0'),
    tf.keras.layers.Conv2D(16, (5, 5), padding='valid', name='conv_1'),
    tf.keras.layers.MaxPooling2D((2, 2), name='pool_1'),
])
```

### 1.2 Run the Exporter

```bash
# Run the TF to hardware exporter
python3 tf_to_hardware.py
```

This creates:
- `hw_export/layer_config.json` - Layer specifications
- `hw_export/layer*_weights.mem` - Weights in Verilog format
- `hw_export/sample_*/` - Test vectors and golden outputs
- `hw_export/test_vectors_summary.json` - Test configuration

### 1.3 Review Layer Configuration

```bash
cat hw_export/layer_config.json
```

Example output:
```json
[
  {
    "layer_idx": 0,
    "name": "conv_0",
    "type": "CONV",
    "input_shape": [null, 28, 28, 1],
    "output_shape": [null, 24, 24, 6],
    "kernel_size": 5,
    "stride": 1,
    "padding": 0,
    "in_channels": 1,
    "out_channels": 6,
    "has_weights": true
  },
  ...
]
```

## Step 2: Configure Hardware Pipeline

### 2.1 Update `streaming_nn_pipeline.v`

Match the hardware layers to your TF model configuration:

```verilog
// Example: Update Layer 0 to match TF model
streaming_nn_layer_stage #(
    .LAYER_TYPE("CONV"),
    .N(8),
    .DATA_W(16),
    .ACC_W(32),
    .ADDR_W(10),
    .IMG_ROWS(28),         // From layer_config.json
    .IMG_COLS(28),
    .KERNEL_SIZE(5),       // From layer_config.json
    .STRIDE(1),
    .PADDING(0),
    .IN_CHANNELS(1),       // From layer_config.json
    .OUT_CHANNELS(6)       // From layer_config.json
) layer_0 (
    // ... connections ...
);
```

### 2.2 Update Memory Configuration

In `streaming_nn_system.v`, update weight sizes:

```verilog
initial begin
    // Calculate from layer_config.json
    // Layer 0: CONV 5x5x1x6 = 150 weights
    weights_per_layer[0] = 150;
    
    // Layer 1: POOL (no weights)
    weights_per_layer[1] = 0;
    
    // Layer 2: CONV 5x5x6x16 = 2400 weights
    weights_per_layer[2] = 2400;
    
    // Layer 3: POOL (no weights)
    weights_per_layer[3] = 0;
end

// Update input/output sizes
localparam INPUT_SIZE = 784;    // 28×28×1
localparam OUTPUT_SIZE = 256;   // 4×4×16
```

## Step 3: Run Hardware Simulation

### 3.1 Compile the Design

```bash
# Compile all Verilog files
iverilog -g2012 -o sim \
    streaming_row_buffer.v \
    streaming_nn_layer_stage.v \
    streaming_nn_pipeline.v \
    streaming_nn_system.v \
    nn_layer_control_unit.v \
    mac_array_stage_with_bram.v \
    mac_array.v \
    mac_stage.v \
    tb_hw_vs_golden.sv
```

### 3.2 Run Simulation

```bash
# Run the simulation
vvp sim

# Or with waveform generation
vvp sim +vcd

# View waveforms
gtkwave hw_vs_golden.vcd
```

### 3.3 Expected Output

```
================================================================================
Hardware vs Golden Model Comparison Test
================================================================================

Loading weights for all layers...
  Loading layer 0 weights: hw_export/layer0_weights.mem
  Layer 1 has no weights (pooling layer)
  Loading layer 2 weights: hw_export/layer2_weights.mem
  Layer 3 has no weights (pooling layer)

Loading weights into hardware...
Weights loaded successfully

================================================================================
Testing Sample 0
================================================================================

Loading input sample: hw_export/sample_0/input.mem
Inference complete

--- Comparing Layer 0 ---
Loading golden data: hw_export/sample_0/layer0_output.mem

Layer 0 Summary:
  Total comparisons: 3456
  Passed: 3450
  Failed: 6
  Pass rate: 99.83%
  Max error: 0.003906
  Mean error: 0.000152

--- Comparing Layer 1 ---
...
```

## Step 4: Python-Based Comparison

For detailed analysis, use the Python comparison tool:

```bash
# Run Python comparison
python3 compare_hw_golden.py
```

This generates:
- `sim_output/comparison_report.json` - Detailed statistics
- `sim_output/comparison_*.png` - Visual comparisons
- `sim_output/error_heatmap.png` - Error distribution

### 4.1 Interpret Results

```python
import json
import matplotlib.pyplot as plt

# Load comparison report
with open('sim_output/comparison_report.json', 'r') as f:
    report = json.load(f)

print(f"Overall pass rate: {report['summary']['overall_pass_rate']:.2f}%")
print(f"Worst error: {report['summary']['worst_max_error']:.6f}")

# Analyze per-layer results
for sample in report['samples']:
    for layer in sample:
        if layer['pass_rate'] < 95.0:
            print(f"WARNING: Layer {layer['layer_name']} has low pass rate")
            print(f"  Pass rate: {layer['pass_rate']:.2f}%")
            print(f"  Max error: {layer['max_abs_error']:.6f}")
```

## Step 5: Validate Intermediate Values

### 5.1 MAC Product Validation

Add probes to MAC array:

```verilog
// In tb_hw_vs_golden.sv
always @(posedge clk) begin
    if (dut.pipeline.layer_0.mac_array_inst.MACS[0].mac_i.psum_out != 0) begin
        $display("MAC[0] output: %h", 
                dut.pipeline.layer_0.mac_array_inst.MACS[0].mac_i.psum_out);
    end
end
```

### 5.2 Intermediate Feature Map Validation

Export intermediate activations from TF:

```python
# In tf_to_hardware.py, already exports intermediate layer outputs
# Compare with hardware during simulation

# Access hardware feature maps
# Example: Read activation BRAM
for addr in range(num_activations):
    hw_val = read_memory("dut.pipeline.layer_0.act_mem", addr)
    golden_val = load_golden_activation(sample_idx, layer_idx, addr)
    compare(hw_val, golden_val)
```

## Step 6: Debug Mismatches

### 6.1 Common Issues and Solutions

**Issue 1: Large Errors in First Layer**
- **Cause**: Weight loading error
- **Fix**: Verify weight memory addressing
```bash
# Check weight file format
head hw_export/layer0_weights.mem
# Should see: @00000 XXXX format
```

**Issue 2: Accumulating Errors Through Layers**
- **Cause**: Fixed-point overflow or quantization
- **Fix**: Adjust Q8.8 format or increase ACC_W
```verilog
parameter ACC_W = 48;  // Increase accumulator width
```

**Issue 3: Zeros in Output**
- **Cause**: Control signals not asserted
- **Fix**: Check enable signals
```verilog
// Add debug output
always @(posedge clk) begin
    $display("compute_enable=%b, act_re=%b, wgt_re=%b", 
            compute_enable, act_re, wgt_re);
end
```

**Issue 4: Systematic Offset**
- **Cause**: Bias not loaded or applied
- **Fix**: Load bias values
```bash
# Check if bias files exist
ls hw_export/layer*_bias.mem
```

### 6.2 Visualization Tools

```python
# Plot error distribution
import matplotlib.pyplot as plt
import numpy as np

# Load errors
errors = []
with open('sim_output/comparison_report.json', 'r') as f:
    report = json.load(f)
    for sample in report['samples']:
        for layer in sample:
            for mismatch in layer['worst_mismatches']:
                errors.append(mismatch['abs_error'])

# Plot histogram
plt.figure(figsize=(10, 6))
plt.hist(errors, bins=50, edgecolor='black')
plt.xlabel('Absolute Error')
plt.ylabel('Frequency')
plt.title('Error Distribution')
plt.yscale('log')
plt.savefig('error_histogram.png')
```

## Step 7: Performance Analysis

### 7.1 Measure Throughput

```verilog
// In testbench
integer start_time, end_time, cycles;

start_time = $time;
start_inference = 1;
@(posedge clk);
start_inference = 0;

wait(inference_done);
end_time = $time;
cycles = (end_time - start_time) / CLK_PERIOD;

$display("Inference took %0d cycles", cycles);
$display("Throughput: %.2f inferences/sec @ 100MHz", 
        100e6 / cycles);
```

### 7.2 Analyze Bottlenecks

```python
# From simulation logs, extract per-layer timing
layer_times = {
    'Layer 0': 5432,
    'Layer 1': 1234,
    'Layer 2': 8765,
    'Layer 3': 1098
}

# Plot
import matplotlib.pyplot as plt
plt.bar(layer_times.keys(), layer_times.values())
plt.ylabel('Cycles')
plt.title('Per-Layer Timing')
plt.savefig('layer_timing.png')
```

## Step 8: Iterate and Optimize

### 8.1 Reduce Errors

If errors are too high:

1. **Increase precision**: Change from Q8.8 to Q12.4
2. **Add rounding**: Round instead of truncate
3. **Scale weights**: Normalize weight range

### 8.2 Improve Performance

If throughput is low:

1. **Increase MAC array width**: N=16 instead of N=8
2. **Pipeline more stages**: Add registers
3. **Overlap operations**: Start next layer early

## Example: Complete Workflow

```bash
# Step 1: Export TF model
python3 tf_to_hardware.py

# Step 2: Update hardware configuration
vim streaming_nn_pipeline.v
# (match layer parameters to layer_config.json)

# Step 3: Compile and simulate
iverilog -g2012 -o sim *.v *.sv
vvp sim > simulation.log

# Step 4: Analyze results
grep "Pass rate" simulation.log
grep "MISMATCH" simulation.log | wc -l

# Step 5: Python detailed analysis
python3 compare_hw_golden.py

# Step 6: Generate report
python3 -c "
import json
with open('sim_output/comparison_report.json', 'r') as f:
    report = json.load(f)
print('Overall pass rate:', report['summary']['overall_pass_rate'])
"

# Step 7: View visualizations
open sim_output/*.png
```

## Validation Checklist

- [ ] Layer configurations match between TF and hardware
- [ ] All weights loaded correctly (check file sizes)
- [ ] Input test vectors loaded (verify with hex dump)
- [ ] Each layer produces output (not all zeros)
- [ ] Pass rate > 95% for all layers
- [ ] Maximum error < 1% of signal range
- [ ] No systematic bias (mean error ≈ 0)
- [ ] Error doesn't accumulate through layers
- [ ] Performance meets requirements (cycles/inference)
- [ ] Visual inspection shows correct feature maps

## Success Criteria

✅ **Excellent**: > 99% pass rate, max error < 0.01
✅ **Good**: > 95% pass rate, max error < 0.05  
⚠️ **Acceptable**: > 90% pass rate, max error < 0.1
❌ **Needs Work**: < 90% pass rate or max error > 0.1

## Troubleshooting Guide

### No Output from Hardware
1. Check clock and reset
2. Verify enable signals
3. Check FSM states

### Output All Zeros
1. Verify weight loading
2. Check compute_enable
3. Verify MAC array input

### Large Systematic Error
1. Check fixed-point format
2. Verify bias addition
3. Check rounding mode

### Random Errors
1. Check timing violations
2. Verify memory access
3. Check for metastability

## Advanced Topics

### Custom Activation Functions
Export activation function LUTs from TF and load into hardware

### Batch Normalization
Fold BN parameters into convolution weights

### Residual Connections
Add bypass paths in hardware pipeline

### Quantization-Aware Training
Train TF model with quantization to reduce errors

## References

- TensorFlow model export: `tf_to_hardware.py`
- Hardware comparison: `compare_hw_golden.py`
- SystemVerilog testbench: `tb_hw_vs_golden.sv`
- Configuration guide: `CONFIGURATION_GUIDE.md`
- Architecture: `ARCHITECTURE.md`
