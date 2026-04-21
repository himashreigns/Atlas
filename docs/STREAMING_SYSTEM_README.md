# Streaming Neural Network Pipeline System

## Overview

This is a complete hardware implementation of a multi-stage neural network accelerator using **streaming row buffers** instead of full feature map storage. The design minimizes memory requirements while maintaining high throughput for convolutional neural networks.

## Key Features

- ✅ **Streaming Architecture**: Processes data with minimal buffering (only kernel-sized row buffers)
- ✅ **Fixed Parameters**: Layer configurations set at design time, optimized for specific networks
- ✅ **Multi-Stage Pipeline**: Multiple NN layers operating concurrently
- ✅ **Three Layer Types**: Convolution, Pooling, Fully Connected
- ✅ **Systolic MAC Array**: Efficient multiply-accumulate operations
- ✅ **Automatic Address Generation**: Hardware control unit manages all BRAM accesses
- ✅ **Weight Preloading**: Weights loaded once at startup, stored locally

## Architecture

### System Hierarchy

```
streaming_nn_system (Top Level)
├── streaming_nn_pipeline (Multi-layer pipeline)
│   ├── streaming_nn_layer_stage (Layer 0: CONV)
│   │   ├── streaming_row_buffer
│   │   ├── nn_layer_control_unit
│   │   └── mac_array_stage_with_bram
│   │       └── mac_array
│   │           └── mac_stage [N instances]
│   ├── streaming_nn_layer_stage (Layer 1: POOL)
│   ├── streaming_nn_layer_stage (Layer 2: CONV)
│   └── streaming_nn_layer_stage (Layer 3: POOL)
├── Weight Loader FSM
├── Input Feeder FSM
└── Output Collector FSM
```

### Memory Hierarchy

```
External Memory (DRAM)
    ↓ (DMA during startup)
Local Weight BRAMs (one per layer)
    ↓ (streaming during inference)
Streaming Row Buffers (minimal size: kernel_rows × width)
    ↓ (systolic processing)
MAC Array Pipeline
    ↓ (streaming out)
Output Buffers → External Memory
```

## Module Descriptions

### 1. streaming_row_buffer.v

**Purpose**: Minimal buffering for convolution windows

**Key Features**:
- Circular buffer storing only `KERNEL_ROWS` rows
- Simultaneous window output for kernel access
- Streams data in, provides window view
- Configurable for multi-channel feature maps

**Parameters**:
```verilog
parameter DATA_W = 16;          // Data width
parameter IMG_COLS = 32;        // Feature map width
parameter KERNEL_ROWS = 3;      // Rows needed for kernel
parameter NUM_CHANNELS = 1;     // Input channels
```

**Memory Usage**: `KERNEL_ROWS × IMG_COLS × NUM_CHANNELS × DATA_W` bits

Example: 3×32×1×16 = 1,536 bits (vs. full 32×32×16 = 16,384 bits)

### 2. streaming_nn_layer_stage.v

**Purpose**: Single layer with fixed configuration

**Key Features**:
- Fixed layer type and parameters (design-time constants)
- Integrates row buffer, control unit, and MAC array
- Streaming input/output interfaces
- Local weight storage (loaded at startup)
- Automatic processing when data available

**Layer Types**:
- `CONV`: 2D convolution with configurable kernel, stride, padding
- `POOL`: Max/average pooling
- `FC`: Fully connected (matrix-vector multiplication)

**Example Configuration**:
```verilog
streaming_nn_layer_stage #(
    .LAYER_TYPE("CONV"),
    .IMG_ROWS(28),
    .IMG_COLS(28),
    .KERNEL_SIZE(5),
    .STRIDE(1),
    .PADDING(0),
    .IN_CHANNELS(1),
    .OUT_CHANNELS(6)
) conv_layer_0 (...);
```

### 3. streaming_nn_pipeline.v

**Purpose**: Multi-stage pipeline connecting layers

**Key Features**:
- Configurable number of layers
- Inter-layer streaming connections
- Parallel weight loading for all layers
- Example: LeNet-5 style architecture

**Example Network**:
```
Input (28×28×1)
    ↓
CONV 5×5, stride=1 (24×24×6)
    ↓
POOL 2×2 (12×12×6)
    ↓
CONV 5×5, stride=1 (8×8×16)
    ↓
POOL 2×2 (4×4×16)
    ↓
Output (256 values)
```

### 4. streaming_nn_system.v

**Purpose**: Complete system with memory interface

**Key Features**:
- External memory interface (DMA)
- Weight loading FSM
- Input feeding FSM
- Output collection FSM
- Control and status management

**Interfaces**:
- Memory: Read/write to external DRAM
- Control: Start inference, load weights
- Status: Ready, done, busy signals

## Design-Time vs Runtime Configuration

### Fixed at Design Time (Parameters)

✅ **These are optimized during synthesis**:
- Layer types (CONV/POOL/FC)
- Input/output dimensions
- Kernel sizes
- Number of channels
- Stride and padding
- Network topology

### Variable at Runtime

✅ **These can change per inference**:
- Input data values
- Weight values (but loaded once at startup)
- Number of inferences to run

## Memory Optimization

### Traditional Approach (Full Buffering)
```
Layer 0: 28×28×1 = 784 values
Layer 1: 24×24×6 = 3,456 values
Layer 2: 12×12×6 = 864 values
Layer 3: 8×8×16 = 1,024 values
Layer 4: 4×4×16 = 256 values
Total: 6,384 values × 32 bits = 204 KB
```

### Streaming Approach (Row Buffers)
```
Layer 0: 5 rows × 28 × 1 = 140 values
Layer 1: 2 rows × 24 × 6 = 288 values
Layer 2: 5 rows × 12 × 6 = 360 values
Layer 3: 2 rows × 8 × 16 = 256 values
Total: 1,044 values × 32 bits = 33 KB
```

**Savings: ~6× reduction in activation memory**

## Timing and Performance

### Latency Components

1. **Weight Loading** (one-time startup):
   - Layer 0: 150 weights → ~150 cycles
   - Layer 2: 2,400 weights → ~2,400 cycles
   - Total: ~2,550 cycles

2. **Pipeline Fill** (per inference):
   - Time for first pixel to reach output
   - Depends on layer latencies
   - Example: ~100-200 cycles

3. **Steady-State Processing** (per inference):
   - Limited by slowest stage
   - Example: ~1,000-2,000 cycles for 28×28 input

4. **Pipeline Drain** (per inference):
   - Flush final outputs
   - Example: ~50-100 cycles

### Throughput

**Single Inference**: ~1,500-2,500 cycles (example)

**Continuous Stream**: Pipeline processes multiple frames concurrently
- New frame can start every ~1,000 cycles
- Effective throughput: ~1 frame per 1,000 cycles

### Resource Utilization (Example FPGA)

**Per Layer Stage**:
- MAC Array: N multipliers + N adders
- BRAMs: 3 blocks (activation, weight, output)
- Row Buffer: ~1 BRAM equivalent
- Control Logic: ~500 LUTs, ~300 FFs

**4-Layer Pipeline** (N=8):
- Multipliers: 32 DSPs
- BRAMs: ~16 blocks
- Logic: ~2,000 LUTs, ~1,200 FFs

## Usage Guide

### 1. Network Configuration

Edit `streaming_nn_pipeline.v` to define your network:

```verilog
// Add a new convolutional layer
streaming_nn_layer_stage #(
    .LAYER_TYPE("CONV"),
    .N(8),
    .DATA_W(16),
    .ACC_W(32),
    .ADDR_W(10),
    .IMG_ROWS(32),      // Input height
    .IMG_COLS(32),      // Input width
    .KERNEL_SIZE(3),    // 3×3 kernel
    .STRIDE(1),
    .PADDING(1),        // Same padding
    .IN_CHANNELS(16),   // 16 input channels
    .OUT_CHANNELS(32)   // 32 output channels
) my_conv_layer (...);
```

### 2. Weight Preparation

Organize weights in external memory:

```
Memory Layout:
├── Weights Base Addresses
│   ├── Layer 0: 0x20000 (CONV weights)
│   ├── Layer 1: 0x20100 (no weights - POOL)
│   ├── Layer 2: 0x30000 (CONV weights)
│   └── Layer 3: 0x30A00 (no weights - POOL)
├── Input: 0x00000
└── Output: 0x10000
```

Weight ordering: `[out_ch][in_ch][kernel_row][kernel_col]`

### 3. Running Inference

```verilog
// 1. Configure memory addresses
input_base_addr = 20'h00000;
output_base_addr = 20'h10000;
weights_base_addr[0] = 20'h20000;
// ... configure all layers

// 2. Load weights (one time)
load_weights = 1;
@(posedge clk);
load_weights = 0;
wait(weights_loaded);

// 3. Run inference
wait(system_ready);
start_inference = 1;
@(posedge clk);
start_inference = 0;

// 4. Wait for completion
wait(inference_done);
// Results now in output memory region
```

### 4. Simulation

```bash
# Compile all modules
iverilog -o sim \
    streaming_row_buffer.v \
    streaming_nn_layer_stage.v \
    streaming_nn_pipeline.v \
    streaming_nn_system.v \
    nn_layer_control_unit.v \
    mac_array_stage_with_bram.v \
    mac_array.v \
    mac_stage.v \
    tb_streaming_nn_system.v

# Run simulation
vvp sim

# View waveforms
gtkwave streaming_nn_tb.vcd
```

## Design Patterns

### Row Buffer Pattern

**Problem**: Need full feature maps for convolution
**Solution**: Buffer only K rows where K = kernel height

```
Row Buffer (Circular):
[Row 0] ─┐
[Row 1]  ├─ Window View (for 3×3 kernel)
[Row 2] ─┘
```

As new rows arrive, oldest row is overwritten (circular buffer).

### Streaming Pattern

**Problem**: Large latency if waiting for complete feature map
**Solution**: Process as soon as enough rows available

```
Timeline:
T0: Input rows 0,1,2 → Buffer full → Start processing
T1: Compute output row 0
T2: Input row 3 → Replace row 0 in buffer → Compute output row 1
T3: Input row 4 → Replace row 1 in buffer → Compute output row 2
...
```

### Fixed Configuration Pattern

**Problem**: Runtime configuration complex and slow
**Solution**: Fix all layer parameters at design time

Benefits:
- Optimized addressing logic
- No configuration overhead
- Simplified control
- Better synthesis results

## Extensions and Modifications

### Adding New Layer Types

1. Add to `LAYER_TYPE` parameter options
2. Implement address generation in `nn_layer_control_unit.v`
3. Add mode case in `streaming_nn_layer_stage.v`

Example layer types to add:
- Depthwise Separable Convolution
- Batch Normalization
- Activation Functions (ReLU, etc.)
- Residual Connections

### Optimizing for Different Networks

**For Deeper Networks**:
- Increase `NUM_LAYERS` parameter
- Add more stages to pipeline
- Adjust BRAM allocation

**For Larger Feature Maps**:
- Increase `IMG_ROWS`, `IMG_COLS`
- May need more row buffer depth
- Adjust memory addresses

**For More Channels**:
- Increase `IN_CHANNELS`, `OUT_CHANNELS`
- More weight memory needed
- Consider channel parallelism

### Performance Tuning

**Increase Throughput**:
- Wider MAC array (increase N)
- Parallel channel processing
- Pipeline optimizations

**Reduce Latency**:
- Smaller row buffers (if possible)
- Overlapped operations
- Faster clock

**Reduce Area**:
- Smaller MAC array (N=4 instead of N=8)
- Shared resources between layers
- Reduced BRAM depth

## Testing and Verification

### Testbench Features

- Memory model simulation
- Weight initialization
- Input pattern generation
- Output validation
- Performance measurement
- Multiple inference runs

### Key Metrics to Monitor

- Cycles per inference
- Memory bandwidth utilization
- Pipeline efficiency
- Layer utilization
- Accuracy vs. software model

### Common Issues

1. **Pipeline Stalls**: Check ready/valid handshaking
2. **Incorrect Results**: Verify weight loading order
3. **Memory Conflicts**: Check address generation
4. **Timing Violations**: May need pipeline stages in MAC array

## Example Networks

### LeNet-5 (MNIST)
```
28×28×1 → CONV5×5 → 24×24×6 → POOL2×2 → 12×12×6
→ CONV5×5 → 8×8×16 → POOL2×2 → 4×4×16 → FC
```

### Simplified AlexNet
```
224×224×3 → CONV11×11/4 → 55×55×96 → POOL3×3/2 → 27×27×96
→ CONV5×5 → 27×27×256 → POOL3×3/2 → 13×13×256
→ CONV3×3 → 13×13×384 → CONV3×3 → 13×13×384
→ CONV3×3 → 13×13×256 → POOL3×3/2 → 6×6×256 → FC
```

### MobileNet Block
```
Depthwise: 3×3 → Pointwise: 1×1 → ReLU
```

## References

- Original MAC array with BRAM design
- Systolic array architectures
- Streaming neural network accelerators
- Row-stationary dataflow

## License

Educational and research use.

---

**Contact**: For questions or contributions, please create an issue.
