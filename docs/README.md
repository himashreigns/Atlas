# Neural Network Layer Control Unit

## Overview

This control unit generates BRAM addresses for three types of neural network operations:
1. **Convolution (CONV)** - 2D convolution with configurable kernel size, stride, and padding
2. **Fully Connected (FC)** - Dense layer matrix multiplication
3. **Pooling (POOL)** - Max/average pooling with configurable window size

The control unit integrates with the MAC array datapath to form a complete neural network accelerator.

## Architecture

### Files Included

1. `nn_layer_control_unit.v` - Main control unit with FSM and address generation logic
2. `nn_layer_accelerator.v` - Top-level integration with MAC array datapath
3. `tb_nn_layer_control_unit.v` - Comprehensive testbench
4. `mac_array_stage_with_bram.v` - Your original MAC array datapath
5. `mac_array.v` - Systolic MAC array
6. `mac_stage.v` - Individual MAC stage

## Control Unit Features

### Mode Selection
- **2'b00**: Convolution mode
- **2'b01**: Fully Connected mode
- **2'b10**: Pooling mode

### FSM States
1. **IDLE**: Waiting for start signal
2. **LOAD_WGT**: Weight loading phase (skipped for pooling)
3. **COMPUTE**: Main computation with address generation
4. **WRITE_OUT**: Pipeline flush
5. **DONE_ST**: Signal completion

### Address Generation

#### Convolution Mode
Generates addresses for sliding window convolution:

```
Activation Address = (row×stride + kr - padding) × img_cols + 
                     (col×stride + kc - padding) + 
                     ch_in × img_rows × img_cols

Weight Address = ch_out × in_channels × K × K + 
                ch_in × K × K + 
                kr × K + kc

Output Address = ch_out × out_rows × out_cols + 
                row × out_cols + col
```

Where:
- `row, col`: Output position
- `kr, kc`: Kernel position
- `ch_in, ch_out`: Input/output channel indices
- `K`: Kernel size

#### Fully Connected Mode
Generates addresses for matrix-vector multiplication:

```
Activation Address = fc_in_cnt
Weight Address = fc_out_cnt × fc_input_size + fc_in_cnt
Output Address = fc_out_cnt
```

#### Pooling Mode
Generates addresses for pooling windows:

```
Activation Address = ch_in × img_rows × img_cols + 
                    (row×pool_size + pool_row) × img_cols + 
                    (col×pool_size + pool_col)

Output Address = ch_in × out_rows × out_cols + 
                row × out_cols + col
```

## Interface Specification

### Configuration Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `mode` | 2 | Operation mode selection |
| `start` | 1 | Start processing |
| `img_rows` | 8 | Input feature map height |
| `img_cols` | 8 | Input feature map width |
| `kernel_size` | 8 | Convolution kernel size (K×K) |
| `stride` | 8 | Convolution stride |
| `padding` | 8 | Zero padding amount |
| `in_channels` | 8 | Number of input channels |
| `out_channels` | 8 | Number of output channels/filters |
| `pool_size` | 8 | Pooling window size |
| `fc_input_size` | 16 | FC layer input dimension |
| `fc_output_size` | 16 | FC layer output dimension |

### Status Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| `done` | 1 | Operation complete flag |
| `busy` | 1 | Processing in progress |
| `in_rows_buffered` | 11 | Rows available for processing |
| `out_rows_produced` | 11 | Output rows generated |

### BRAM Control Outputs

For each BRAM (activation, weight, output):
- `*_we`: Write enable
- `*_waddr`: Write address
- `*_re`: Read enable
- `*_raddr`: Read address

## Usage Example

### Convolution Layer (3×3 kernel, stride=1, padding=0)

```verilog
// Configure layer
mode = 2'b00;           // Convolution
img_rows = 8'd28;       // 28×28 input
img_cols = 8'd28;
kernel_size = 8'd3;     // 3×3 kernel
stride = 8'd1;
padding = 8'd0;
in_channels = 8'd1;     // 1 input channel
out_channels = 8'd16;   // 16 filters

// Start processing
start = 1'b1;
#(CLK_PERIOD);
start = 1'b0;

// Wait for completion
wait(done);
// Output: 16 × 26 × 26 feature maps
```

### Fully Connected Layer (128 → 64)

```verilog
// Configure layer
mode = 2'b01;              // FC mode
fc_input_size = 16'd128;   // 128 inputs
fc_output_size = 16'd64;   // 64 outputs

// Start processing
start = 1'b1;
#(CLK_PERIOD);
start = 1'b0;

// Wait for completion
wait(done);
// Output: 64 neurons
```

### Max Pooling (2×2 window)

```verilog
// Configure layer
mode = 2'b10;           // Pooling
img_rows = 8'd28;       // 28×28 input
img_cols = 8'd28;
pool_size = 8'd2;       // 2×2 pooling
in_channels = 8'd16;    // 16 channels

// Start processing
start = 1'b1;
#(CLK_PERIOD);
start = 1'b0;

// Wait for completion
wait(done);
// Output: 16 × 14 × 14 feature maps
```

## Integration with MAC Array

The `nn_layer_accelerator` module combines the control unit with your MAC array datapath:

```verilog
nn_layer_accelerator #(
    .N(8),              // 8-stage MAC array
    .DATA_W(16),        // 16-bit data
    .ACC_W(32),         // 32-bit accumulator
    .ADDR_W(10)         // 10-bit address (1024 words)
) accelerator (
    .clk(clk),
    .rst(rst),
    .mode(mode),
    .start(start),
    .done(done),
    .busy(busy),
    // ... configuration signals
    // ... external BRAM interface
);
```

### External Interface

When `busy=0`, external signals control BRAMs for:
- Loading input activations
- Loading weights
- Reading output results

When `busy=1`, control unit manages all BRAM accesses.

## Simulation

### Running the Testbench

```bash
# Compile with Icarus Verilog
iverilog -o sim \
    nn_layer_control_unit.v \
    tb_nn_layer_control_unit.v

# Run simulation
vvp sim

# View waveforms
gtkwave nn_control_tb.vcd
```

### Output Files

The testbench generates address trace logs:
- `conv_addresses.log` - Convolution address sequences
- `fc_addresses.log` - FC layer address sequences
- `pool_addresses.log` - Pooling address sequences

## Design Considerations

### Address Space
- Maximum addressable memory: 2^ADDR_W words
- Default ADDR_W=10 supports 1024 words per BRAM
- Addresses wrap using modulo: `addr & ((1 << ADDR_W) - 1)`

### Pipeline Latency
- MAC array has N-stage pipeline depth
- Control unit includes 10-cycle flush period in WRITE_OUT state
- Adjust `pipe_delay_cnt` threshold based on actual pipeline depth

### Boundary Conditions
- Padding is handled in address calculation
- Out-of-bounds addresses are masked by address width
- For production, add explicit boundary checks

### Memory Layout

#### Convolution
- **Activations**: Channel-major order `[C][H][W]`
- **Weights**: `[out_ch][in_ch][K][K]`
- **Outputs**: `[out_ch][out_H][out_W]`

#### Fully Connected
- **Activations**: Linear array `[input_size]`
- **Weights**: Row-major `[output_size][input_size]`
- **Outputs**: `[output_size]`

#### Pooling
- **Activations**: Same as convolution
- **Outputs**: Downsampled version

## Future Enhancements

1. **Depthwise Separable Convolution**: Add mode for efficient mobile architectures
2. **Dilated Convolution**: Support for dilated/atrous convolution
3. **Batch Processing**: Support batch dimension
4. **Dynamic Configuration**: Runtime reconfigurable parameters
5. **Optimized Addressing**: Banking and interleaving for conflict-free access
6. **Bias Addition**: Separate bias BRAM and accumulation
7. **Activation Functions**: Integrated ReLU/sigmoid/tanh
8. **Quantization Support**: INT8/INT4 operations

## Parameter Tuning

Adjust these parameters based on your application:

```verilog
parameter MAX_IMG_SIZE   = 32;    // Maximum image dimension
parameter MAX_KERNEL     = 5;     // Maximum kernel size
parameter MAX_CHANNELS   = 16;    // Maximum channels
parameter MAX_FILTERS    = 16;    // Maximum filters
```

## Performance Metrics

For a 3×3 convolution on 8×8 input with 2 input and 4 output channels:
- Total MACs: 4 × 2 × 6 × 6 × 9 = 2,592
- Cycles (with 8-wide MAC): ~324 cycles
- With overhead: ~350 cycles

## Timing Constraints

All outputs are registered. Suggested timing constraints:
- Setup/hold margin: 10% of clock period
- Clock-to-output delay: < 50% of clock period
- BRAM read latency: 1 cycle (registered output)

## License

This design is provided as-is for educational and research purposes.
