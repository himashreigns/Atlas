// ===========================================================================
// streaming_nn_system_stub.sv
//
// Behavioral stub with three operating modes (set at compile time):
//
//   (default)       Write a counting pattern to output memory.
//                   Fails the TF comparison — honest "not yet implemented".
//
//   GOLDEN_REPLAY   Load golden_output_tf.memh and replay those values.
//                   Used to validate TB infrastructure without real RTL.
//
//   COMPUTE_MODE    Perform the FULL LeNet-5 forward pass in integer
//                   arithmetic matching the hardware Q-format, then write
//                   the computed activations to output memory.
//                   This mode makes the TF comparison pass, proving the
//                   Q-format arithmetic is correct.
//
// Q-format: activations Q8.8, weights Q4.12, accumulator shift >>20.
// ===========================================================================
`timescale 1ns/1ps
`include "dnn_config.vh"

`ifndef GOLDEN_OUTPUT_PATH
  `define GOLDEN_OUTPUT_PATH "../golden/golden_output_tf.memh"
`endif
`ifndef GOLDEN_INPUT_PATH
  `define GOLDEN_INPUT_PATH "../golden/golden_input.memh"
`endif
`ifndef GOLDEN_W0_PATH
  `define GOLDEN_W0_PATH "../golden/golden_weights_l0.memh"
`endif
`ifndef GOLDEN_W2_PATH
  `define GOLDEN_W2_PATH "../golden/golden_weights_l2.memh"
`endif

module streaming_nn_system #(
    parameter N           = 8,
    parameter DATA_W      = 16,
    parameter ACC_W       = 32,
    parameter ADDR_W      = 10,
    parameter NUM_LAYERS  = `DNN_NUM_LAYERS,
    parameter MEM_ADDR_W  = 20,
    parameter MEM_DATA_W  = 32
) (
    input  wire                          clk,
    input  wire                          rst,
    input  wire                          start_inference,
    output reg                           inference_done,
    output reg                           system_ready,
    input  wire                          load_weights,
    output reg                           weights_loaded,
    output reg  [MEM_ADDR_W-1:0]         mem_addr,
    output reg                           mem_read,
    input  wire [MEM_DATA_W-1:0]         mem_rdata,
    input  wire                          mem_rdata_valid,
    output reg                           mem_write,
    output reg  [MEM_DATA_W-1:0]         mem_wdata,
    input  wire [MEM_ADDR_W-1:0]         input_base_addr,
    input  wire [MEM_ADDR_W-1:0]         output_base_addr,
    input  wire [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr,
    output reg  [NUM_LAYERS-1:0]         layer_busy,
    output reg                           pipeline_active
);

    // -----------------------------------------------------------------------
    // FSM
    // -----------------------------------------------------------------------
    localparam S_RST       = 4'd0;
    localparam S_IDLE      = 4'd1;
    localparam S_LOAD_WGT  = 4'd2;
    localparam S_RUN_LAYER = 4'd3;
    localparam S_NEXT_LAYER= 4'd4;
    localparam S_WRITE_OUT = 4'd5;
    localparam S_DONE      = 4'd6;

    localparam CYCLES_PER_LAYER = `DNN_EST_LATENCY_CYCLES / NUM_LAYERS;

    reg [3:0] state;
    integer   cycle_counter;
    integer   current_layer;
    integer   out_addr_off;

    // -----------------------------------------------------------------------
    // COMPUTE_MODE: LeNet-5 forward pass arrays (module scope for iverilog)
    // -----------------------------------------------------------------------
`ifdef COMPUTE_MODE
    // Network dims
    localparam HIN  = 28;
    localparam WIN  = 28;
    localparam C1K  = 5;   localparam C1OUT = 6;
    localparam H1   = HIN - C1K + 1;   // 24
    localparam W1   = WIN - C1K + 1;   // 24
    localparam H1P  = H1 / 2;          // 12
    localparam W1P  = W1 / 2;          // 12
    localparam C2K  = 5;   localparam C2OUT = 16;
    localparam H2   = H1P - C2K + 1;   // 8
    localparam W2S  = W1P - C2K + 1;   // 8
    localparam H2P  = H2 / 2;          // 4
    localparam W2P  = W2S / 2;         // 4
    localparam Q_SHIFT = 20;

    // Input / weight / activation storage
    reg signed [15:0] cm_inp [0:783];   // 28*28*1
    reg signed [15:0] cm_w0  [0:149];   // 5*5*1*6
    reg signed [15:0] cm_w2  [0:2399];  // 5*5*6*16
    reg signed [15:0] cm_a1  [0:3455];  // 24*24*6
    reg signed [15:0] cm_a2  [0:863];   // 12*12*6
    reg signed [15:0] cm_a3  [0:1023];  // 8*8*16
    reg signed [15:0] cm_out [0:255];   // 4*4*16

    reg cm_done;  // set when computation is complete

    // --- helper: saturate int64 to int16 ---
    function automatic signed [15:0] sat16;
        input signed [63:0] x;
        begin
            if      (x >  32767) sat16 = 16'sd32767;
            else if (x < -32768) sat16 = -16'sd32768;
            else                 sat16 = x[15:0];
        end
    endfunction

    // --- forward pass in a single initial block ---
    initial begin : compute_block
        integer h, w, co, ci, ky, kx;
        reg signed [63:0] acc;
        reg signed [15:0] mx;
        integer ph, pw;

        cm_done = 0;

        // Load inputs and weights from the same files tf_golden.py generated
        // (these encode the identical bit patterns the TB writes to memory)
        $readmemh(`GOLDEN_INPUT_PATH, cm_inp);
        $readmemh(`GOLDEN_W0_PATH,    cm_w0);
        $readmemh(`GOLDEN_W2_PATH,    cm_w2);

        // ---- Conv1: (28,28,1) -> (24,24,6) + ReLU ----
        for (h = 0; h < H1; h = h + 1) begin
            for (w = 0; w < W1; w = w + 1) begin
                for (co = 0; co < C1OUT; co = co + 1) begin
                    acc = 64'sd0;
                    for (ky = 0; ky < C1K; ky = ky + 1)
                        for (kx = 0; kx < C1K; kx = kx + 1)
                            // C_IN=1, so ci loop elided; HWIO weight layout
                            acc = acc + ($signed(cm_inp[(h+ky)*WIN + (w+kx)]) *
                                         $signed(cm_w0[(ky*C1K + kx)*C1OUT + co]));
                    acc = acc >>> Q_SHIFT;      // arithmetic right shift
                    if (acc < 0) acc = 64'sd0;  // ReLU
                    cm_a1[(h*W1 + w)*C1OUT + co] = sat16(acc);
                end
            end
        end

        // ---- MaxPool1: (24,24,6) -> (12,12,6) ----
        for (h = 0; h < H1P; h = h + 1) begin
            for (w = 0; w < W1P; w = w + 1) begin
                for (co = 0; co < C1OUT; co = co + 1) begin
                    mx = cm_a1[( h*2   *W1 +  w*2   )*C1OUT + co];
                    if (cm_a1[( h*2   *W1 + (w*2+1))*C1OUT + co] > mx)
                        mx = cm_a1[( h*2   *W1 + (w*2+1))*C1OUT + co];
                    if (cm_a1[((h*2+1)*W1 +  w*2   )*C1OUT + co] > mx)
                        mx = cm_a1[((h*2+1)*W1 +  w*2   )*C1OUT + co];
                    if (cm_a1[((h*2+1)*W1 + (w*2+1))*C1OUT + co] > mx)
                        mx = cm_a1[((h*2+1)*W1 + (w*2+1))*C1OUT + co];
                    cm_a2[(h*W1P + w)*C1OUT + co] = mx;
                end
            end
        end

        // ---- Conv2: (12,12,6) -> (8,8,16) + ReLU ----
        for (h = 0; h < H2; h = h + 1) begin
            for (w = 0; w < W2S; w = w + 1) begin
                for (co = 0; co < C2OUT; co = co + 1) begin
                    acc = 64'sd0;
                    for (ky = 0; ky < C2K; ky = ky + 1)
                        for (kx = 0; kx < C2K; kx = kx + 1)
                            for (ci = 0; ci < C1OUT; ci = ci + 1)
                                // HWIO layout: w2[ky*C2K*C1OUT*C2OUT + kx*C1OUT*C2OUT + ci*C2OUT + co]
                                acc = acc + ($signed(cm_a2[((h+ky)*W1P + (w+kx))*C1OUT + ci]) *
                                             $signed(cm_w2[((ky*C2K + kx)*C1OUT + ci)*C2OUT + co]));
                    acc = acc >>> Q_SHIFT;
                    if (acc < 0) acc = 64'sd0;  // ReLU
                    cm_a3[(h*W2S + w)*C2OUT + co] = sat16(acc);
                end
            end
        end

        // ---- MaxPool2: (8,8,16) -> (4,4,16) ----
        for (h = 0; h < H2P; h = h + 1) begin
            for (w = 0; w < W2P; w = w + 1) begin
                for (co = 0; co < C2OUT; co = co + 1) begin
                    mx = cm_a3[( h*2   *W2S +  w*2   )*C2OUT + co];
                    if (cm_a3[( h*2   *W2S + (w*2+1))*C2OUT + co] > mx)
                        mx = cm_a3[( h*2   *W2S + (w*2+1))*C2OUT + co];
                    if (cm_a3[((h*2+1)*W2S +  w*2   )*C2OUT + co] > mx)
                        mx = cm_a3[((h*2+1)*W2S +  w*2   )*C2OUT + co];
                    if (cm_a3[((h*2+1)*W2S + (w*2+1))*C2OUT + co] > mx)
                        mx = cm_a3[((h*2+1)*W2S + (w*2+1))*C2OUT + co];
                    cm_out[(h*W2P + w)*C2OUT + co] = mx;
                end
            end
        end

        cm_done = 1;
        $display("[compute] LeNet-5 forward pass done. out[0..3]=%0d %0d %0d %0d",
                 cm_out[0], cm_out[1], cm_out[2], cm_out[3]);
    end // compute_block
`endif // COMPUTE_MODE

    // -----------------------------------------------------------------------
    // GOLDEN_REPLAY mode: pre-load TF golden values
    // -----------------------------------------------------------------------
`ifdef GOLDEN_REPLAY
    reg [15:0] golden_out [0:255];
    initial begin
        $readmemh(`GOLDEN_OUTPUT_PATH, golden_out);
        $display("[stub] GOLDEN_REPLAY loaded out[0..3]=%04h %04h %04h %04h",
                 golden_out[0], golden_out[1], golden_out[2], golden_out[3]);
    end
`endif

    // -----------------------------------------------------------------------
    // Synchronous FSM
    // -----------------------------------------------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state          <= S_RST;
            system_ready   <= 1'b0;
            inference_done <= 1'b0;
            weights_loaded <= 1'b0;
            layer_busy     <= '0;
            pipeline_active<= 1'b0;
            mem_write      <= 1'b0;
            mem_read       <= 1'b0;
            mem_addr       <= '0;
            mem_wdata      <= '0;
            cycle_counter  <= 0;
            current_layer  <= 0;
            out_addr_off   <= 0;
        end else begin
            inference_done <= 1'b0;
            mem_write      <= 1'b0;
            mem_read       <= 1'b0;

            case (state)
                S_RST: begin
                    state        <= S_IDLE;
                    system_ready <= 1'b1;
                end

                S_IDLE: begin
                    weights_loaded  <= 1'b0;
                    layer_busy      <= '0;
                    pipeline_active <= 1'b0;
                    if (load_weights) begin
                        state         <= S_LOAD_WGT;
                        cycle_counter <= 0;
                    end else if (start_inference) begin
                        state           <= S_RUN_LAYER;
                        cycle_counter   <= 0;
                        current_layer   <= 0;
                        out_addr_off    <= 0;
                        layer_busy[0]   <= 1'b1;
                        pipeline_active <= 1'b1;
                        system_ready    <= 1'b0;
                    end
                end

                S_LOAD_WGT: begin
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter >= 50) begin
                        weights_loaded <= 1'b1;
                        state          <= S_IDLE;
                    end
                end

                S_RUN_LAYER: begin
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter >= CYCLES_PER_LAYER) begin
                        cycle_counter <= 0;
                        state         <= S_WRITE_OUT;
                    end
                end

                S_WRITE_OUT: begin
                    if (cycle_counter < 64) begin
                        mem_write    <= 1'b1;
                        mem_addr     <= output_base_addr + out_addr_off;

`ifdef COMPUTE_MODE
                        // Write the real computed activation value
                        mem_wdata <= {{16{cm_out[out_addr_off[7:0]][15]}},
                                       cm_out[out_addr_off[7:0]]};
`elsif GOLDEN_REPLAY
                        mem_wdata <= {16'h0000, golden_out[out_addr_off[7:0]]};
`else
                        // Default: counting pattern (fails TF comparison)
                        mem_wdata <= {16'h0,8'h0,8'h01}
                                     + (current_layer << 8) + out_addr_off;
`endif
                        out_addr_off  <= out_addr_off + 1;
                        cycle_counter <= cycle_counter + 1;
                    end else begin
                        mem_write <= 1'b0;
                        state     <= S_NEXT_LAYER;
                    end
                end

                S_NEXT_LAYER: begin
                    layer_busy[current_layer] <= 1'b0;
                    if (current_layer < NUM_LAYERS - 1) begin
                        current_layer               <= current_layer + 1;
                        layer_busy[current_layer+1] <= 1'b1;
                        cycle_counter               <= 0;
                        state                       <= S_RUN_LAYER;
                    end else begin
                        pipeline_active <= 1'b0;
                        layer_busy      <= '0;
                        state           <= S_DONE;
                    end
                end

                S_DONE: begin
                    inference_done <= 1'b1;
                    system_ready   <= 1'b1;
                    state          <= S_IDLE;
                end

                default: state <= S_IDLE;
            endcase
        end
    end

`ifdef DUT_HAS_RRM
    // Optional: resource manager phase counter for TC9
    reg [3:0] rrm_phase;
    always @(posedge clk) begin
        if (rst) rrm_phase <= 0;
        else if (pipeline_active) rrm_phase <= current_layer[3:0];
    end
`endif

endmodule
