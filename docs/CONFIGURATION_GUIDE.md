# Quick Configuration Guide

## How to Configure Your Network

### Step 1: Define Your Network Architecture

First, decide on your layer sequence. Example networks:

#### Example 1: Simple MNIST Classifier
```
Input: 28×28×1 (grayscale image)
Layer 0: CONV 3×3, 1→8 channels, stride=1, padding=1  → 28×28×8
Layer 1: POOL 2×2                                      → 14×14×8
Layer 2: CONV 3×3, 8→16 channels, stride=1, padding=1 → 14×14×16
Layer 3: POOL 2×2                                      → 7×7×16
Output: 7×7×16 = 784 features → FC layer (not shown)
```

#### Example 2: Tiny ImageNet
```
Input: 64×64×3 (RGB image)
Layer 0: CONV 5×5, 3→32 channels, stride=2, padding=2 → 32×32×32
Layer 1: POOL 2×2                                      → 16×16×32
Layer 2: CONV 3×3, 32→64 channels, stride=1, padding=1→ 16×16×64
Layer 3: POOL 2×2                                      → 8×8×64
Output: 8×8×64 = 4096 features
```

### Step 2: Calculate Memory Requirements

For each layer, calculate:

#### Activation Memory (Row Buffers)
```
Row Buffer Size = KERNEL_ROWS × IMG_COLS × IN_CHANNELS × DATA_W bits

Example (Layer 0 above):
3 rows × 28 cols × 1 channel × 16 bits = 1,344 bits
```

#### Weight Memory
```
Weight Size = KERNEL_SIZE² × IN_CHANNELS × OUT_CHANNELS × DATA_W bits

Example (Layer 0 above):
3×3 × 1 × 8 × 16 bits = 1,152 bits = 72 words (16-bit words)
```

#### Output Buffer
```
Output Size = OUT_ROWS × OUT_COLS × OUT_CHANNELS × ACC_W bits

Example (Layer 0 above):
28 × 28 × 8 × 32 bits = 200,704 bits
```

### Step 3: Edit streaming_nn_pipeline.v

Replace the layer instantiations with your configuration:

```verilog
module streaming_nn_pipeline #(
    parameter N        = 8,
    parameter DATA_W   = 16,
    parameter ACC_W    = 32,
    parameter ADDR_W   = 10,
    parameter NUM_LAYERS = 4  // Change based on your network
)(
    // ... ports ...
);

    // Declare inter-layer connections
    wire [ACC_W-1:0] layer_data [0:NUM_LAYERS];
    wire [NUM_LAYERS:0] layer_valid;
    wire [NUM_LAYERS:0] layer_ready_sig;
    
    // YOUR LAYER 0 CONFIGURATION HERE
    streaming_nn_layer_stage #(
        .LAYER_TYPE("CONV"),      // or "POOL" or "FC"
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        
        // CONVOLUTION PARAMETERS
        .IMG_ROWS(28),           // Input height
        .IMG_COLS(28),           // Input width
        .KERNEL_SIZE(3),         // Kernel size (3×3)
        .STRIDE(1),              // Stride
        .PADDING(1),             // Padding (0 for valid, 1 for same)
        .IN_CHANNELS(1),         // Input channels
        .OUT_CHANNELS(8),        // Output channels (filters)
        
        // POOLING PARAMETERS (unused for CONV)
        .POOL_SIZE(2),
        
        // FC PARAMETERS (unused for CONV)
        .FC_INPUT_SIZE(128),
        .FC_OUTPUT_SIZE(64)
    ) layer_0 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[0][DATA_W-1:0]),
        .stream_in_valid(layer_valid[0]),
        .stream_in_ready(layer_ready_sig[0]),
        .stream_out_data(layer_data[1]),
        .stream_out_valid(layer_valid[1]),
        .stream_out_ready(layer_ready_sig[1]),
        .wgt_load_en(wgt_load_en[0]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[0]),
        .layer_busy(layer_busy[0])
    );
    
    // YOUR LAYER 1 CONFIGURATION HERE
    streaming_nn_layer_stage #(
        .LAYER_TYPE("POOL"),      // Pooling layer
        .N(N),
        .DATA_W(ACC_W),          // Note: Input is ACC_W from previous layer
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .IMG_ROWS(28),           // Input from previous layer
        .IMG_COLS(28),
        .POOL_SIZE(2),           // 2×2 pooling window
        .IN_CHANNELS(8),         // Must match OUT_CHANNELS of previous layer
        .OUT_CHANNELS(8)         // Same as IN_CHANNELS for pooling
    ) layer_1 (
        .clk(clk),
        .rst(rst),
        .stream_in_data(layer_data[1]),
        .stream_in_valid(layer_valid[1]),
        .stream_in_ready(layer_ready_sig[1]),
        .stream_out_data(layer_data[2]),
        .stream_out_valid(layer_valid[2]),
        .stream_out_ready(layer_ready_sig[2]),
        .wgt_load_en(wgt_load_en[1]),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data(wgt_load_data),
        .layer_ready(layer_ready_status[1]),
        .layer_busy(layer_busy[1])
    );
    
    // Continue for all layers...

endmodule
```

### Step 4: Update streaming_nn_system.v

Update the memory size calculations and weight loading:

```verilog
// In streaming_nn_system.v, update weights_per_layer
initial begin
    weights_per_layer[0] = 72;    // CONV 3×3×1×8 = 72 weights
    weights_per_layer[1] = 0;     // POOL (no weights)
    weights_per_layer[2] = 1152;  // CONV 3×3×8×16 = 1152 weights
    weights_per_layer[3] = 0;     // POOL (no weights)
end

// Update input/output sizes
localparam INPUT_SIZE = 784;   // 28×28×1
localparam OUTPUT_SIZE = 784;  // 7×7×16
```

### Step 5: Prepare Weight Files

Organize your trained weights in the correct format:

```python
# Python example for weight preparation
import numpy as np

# Assume you have trained weights: weights[out_ch, in_ch, kh, kw]
def export_weights_to_mem(weights, filename, base_addr):
    """Export weights in memory file format"""
    out_ch, in_ch, kh, kw = weights.shape
    
    with open(filename, 'w') as f:
        addr = base_addr
        for oc in range(out_ch):
            for ic in range(in_ch):
                for kr in range(kh):
                    for kc in range(kw):
                        # Convert to 16-bit fixed point (Q8.8 format)
                        val = weights[oc, ic, kr, kc]
                        fixed_val = int(val * 256) & 0xFFFF
                        f.write(f"@{addr:05X} {fixed_val:04X}\n")
                        addr += 1

# Example usage
layer0_weights = np.random.randn(8, 1, 3, 3) * 0.1
export_weights_to_mem(layer0_weights, "layer0_weights.mem", 0x20000)

layer2_weights = np.random.randn(16, 8, 3, 3) * 0.1
export_weights_to_mem(layer2_weights, "layer2_weights.mem", 0x30000)
```

### Step 6: Initialize Memory in Testbench

```verilog
// In testbench, load memory files
initial begin
    $readmemh("layer0_weights.mem", memory);
    $readmemh("layer2_weights.mem", memory);
    
    // Load input image
    $readmemh("input_image.mem", memory);
end
```

## Common Configurations

### Configuration 1: Edge Detection
```verilog
// Single 3×3 conv layer for edge detection
.LAYER_TYPE("CONV")
.IMG_ROWS(256)
.IMG_COLS(256)
.KERNEL_SIZE(3)
.STRIDE(1)
.PADDING(0)  // Valid convolution
.IN_CHANNELS(1)
.OUT_CHANNELS(1)
```

### Configuration 2: Feature Extraction
```verilog
// Multiple filters for feature extraction
.LAYER_TYPE("CONV")
.IMG_ROWS(128)
.IMG_COLS(128)
.KERNEL_SIZE(5)
.STRIDE(1)
.PADDING(2)  // Same convolution
.IN_CHANNELS(3)   // RGB input
.OUT_CHANNELS(32) // 32 feature maps
```

### Configuration 3: Downsampling
```verilog
// Aggressive downsampling with large stride
.LAYER_TYPE("CONV")
.IMG_ROWS(224)
.IMG_COLS(224)
.KERNEL_SIZE(7)
.STRIDE(4)
.PADDING(3)
.IN_CHANNELS(3)
.OUT_CHANNELS(64)
```

## Validation Checklist

Before synthesis, verify:

- [ ] All layer dimensions match (out of layer N = in of layer N+1)
- [ ] Weight memory sizes calculated correctly
- [ ] `NUM_LAYERS` parameter matches actual instantiations
- [ ] Memory addresses don't overlap
- [ ] ADDR_W is sufficient for largest memory
- [ ] Data widths are consistent

## Memory Budget Calculator

Use this spreadsheet format:

| Layer | Type | Input Size | Output Size | Weights | Row Buffer | Total |
|-------|------|------------|-------------|---------|------------|-------|
| 0 | CONV 3×3 | 28×28×1 | 28×28×8 | 72 words | 84 words | 156 |
| 1 | POOL 2×2 | 28×28×8 | 14×14×8 | 0 words | 56 words | 56 |
| 2 | CONV 3×3 | 14×14×8 | 14×14×16 | 1152 words | 336 words | 1488 |
| 3 | POOL 2×2 | 14×14×16 | 7×7×16 | 0 words | 224 words | 224 |

**Total**: 1,924 words = ~31 KB (for 16-bit words)

## Performance Estimation

### Latency Formula

```
Cycles_per_inference ≈ 
    Weight_Loading (one-time) +
    Pipeline_Fill +
    (Output_Height × Output_Width × Channels × Kernel_Size² / N) +
    Pipeline_Drain

Where N = MAC array width
```

### Example Calculation

Layer 0: CONV 3×3, 28×28×1→8, N=8

```
Operations = 28 × 28 × 8 × (3×3×1) = 56,448 MACs
Cycles = 56,448 / 8 = 7,056 cycles
Plus overhead ≈ 7,500 cycles
```

## Troubleshooting

### Issue: Synthesis fails with memory overflow

**Solution**: Reduce ADDR_W or split into multiple smaller BRAMs

### Issue: Timing violations

**Solution**: 
- Add pipeline stages in MAC array
- Reduce clock frequency
- Optimize critical paths

### Issue: Incorrect output values

**Solution**:
- Verify weight loading order (out_ch, in_ch, kr, kc)
- Check data format (fixed vs. floating point)
- Validate address generation in control unit

### Issue: Pipeline stalls

**Solution**:
- Check ready/valid handshaking
- Ensure row buffers are sized correctly
- Verify FIFO depths

## Next Steps

1. Configure your network in `streaming_nn_pipeline.v`
2. Update memory parameters in `streaming_nn_system.v`
3. Run simulation with `tb_streaming_nn_system.v`
4. Synthesize and analyze resource usage
5. Test on FPGA with real data

For detailed architecture information, see `STREAMING_SYSTEM_README.md`
