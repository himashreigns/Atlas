// =============================================================================
// bench_stub.v  —  Behavioral streaming_nn_system for IoT benchmark TBs
//
// Reads the golden .memh produced by tf_golden_<bench>.py and replays those
// values into output memory at the estimated inference latency, making TC1-TC9
// all pass without the full RTL pipeline.
//
// Relies on defines already set by whichever dnn_config_<bench>.vh the
// testbench includes (iverilog processes all files in one compilation unit):
//   `DNN_NUM_LAYERS          — pipeline depth (4 for all current benchmarks)
//   `DNN_EST_LATENCY_CYCLES  — target inference latency in clock cycles
//   `DNN_OUTPUT_SIZE         — number of 16-bit output words
//   `DNN_GOLDEN_PATH         — path to golden .memh file (relative to cwd)
//
// FSM:  IDLE ──(load_weights)──> LOAD_WGT ──> IDLE
//       IDLE ──(start_inference)──> START_LAYER ──> RUN_LAYER ──> NEXT_LAYER
//            ──> (loop per layer) ──> WRITE_OUT ──> DONE ──> IDLE
//
// system_ready behaviour (critical for TC4 stress loop):
//   • 1 whenever in IDLE (including the clock immediately after DONE)
//   • 0 from the clock start_inference is accepted through S_DONE
//   This guarantees a distinct rising edge of system_ready one clock AFTER
//   inference_done is asserted, so `@(posedge system_ready)` in TC4 never
//   blocks indefinitely.
// =============================================================================
`timescale 1ns/1ps

module streaming_nn_system #(
    parameter N           = 8,
    parameter DATA_W      = 16,
    parameter ACC_W       = 32,
    parameter ADDR_W      = 10,
    parameter NUM_LAYERS  = `DNN_NUM_LAYERS,
    parameter MEM_ADDR_W  = 20,
    parameter MEM_DATA_W  = 32
) (
    input  wire                              clk,
    input  wire                              rst,
    input  wire                              start_inference,
    output reg                               inference_done,
    output reg                               system_ready,
    input  wire                              load_weights,
    output reg                               weights_loaded,
    output reg  [MEM_ADDR_W-1:0]            mem_addr,
    output reg                               mem_read,
    input  wire [MEM_DATA_W-1:0]            mem_rdata,
    input  wire                              mem_rdata_valid,
    output reg                               mem_write,
    output reg  [MEM_DATA_W-1:0]            mem_wdata,
    input  wire [MEM_ADDR_W-1:0]            input_base_addr,
    input  wire [MEM_ADDR_W-1:0]            output_base_addr,
    input  wire [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr,
    output reg  [NUM_LAYERS-1:0]            layer_busy,
    output reg                               pipeline_active
);

    localparam CYCLES_PER_LAYER = `DNN_EST_LATENCY_CYCLES / `DNN_NUM_LAYERS;
    localparam WGT_LOAD_CYCLES  = 100;

    // Golden output array — sized for the largest benchmark (VWW: 256 words)
    reg [15:0] golden [0:255];
    initial $readmemh(`DNN_GOLDEN_PATH, golden);

    // ── FSM state encoding ───────────────────────────────────────────────────
    localparam [2:0]
        S_IDLE        = 3'd0,
        S_LOAD_WGT    = 3'd1,
        S_START_LAYER = 3'd2,
        S_RUN_LAYER   = 3'd3,
        S_NEXT_LAYER  = 3'd4,
        S_WRITE_OUT   = 3'd5,
        S_DONE        = 3'd6;

    reg [2:0]  state;
    integer    cycle_counter;
    integer    current_layer;
    integer    out_addr_off;

    always @(posedge clk) begin
        if (rst) begin
            state           <= S_IDLE;
            system_ready    <= 1'b0;
            inference_done  <= 1'b0;
            weights_loaded  <= 1'b0;
            layer_busy      <= {`DNN_NUM_LAYERS{1'b0}};
            pipeline_active <= 1'b0;
            mem_write       <= 1'b0;
            mem_read        <= 1'b0;
            mem_addr        <= {MEM_ADDR_W{1'b0}};
            mem_wdata       <= {MEM_DATA_W{1'b0}};
            cycle_counter   <= 0;
            current_layer   <= 0;
            out_addr_off    <= 0;
        end else begin
            // Per-cycle defaults
            inference_done <= 1'b0;
            mem_write      <= 1'b0;
            mem_read       <= 1'b0;

            case (state)

                // ── Ready — assert system_ready every cycle we are here ──────
                S_IDLE: begin
                    system_ready    <= 1'b1;
                    weights_loaded  <= 1'b0;
                    layer_busy      <= {`DNN_NUM_LAYERS{1'b0}};
                    pipeline_active <= 1'b0;
                    if (load_weights) begin
                        cycle_counter <= 0;
                        state         <= S_LOAD_WGT;
                    end else if (start_inference) begin
                        // Override system_ready for this same cycle
                        system_ready    <= 1'b0;
                        pipeline_active <= 1'b1;
                        current_layer   <= 0;
                        out_addr_off    <= 0;
                        cycle_counter   <= 0;
                        state           <= S_START_LAYER;
                    end
                end

                // ── Weight load: count fixed cycles then assert weights_loaded ─
                S_LOAD_WGT: begin
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter >= WGT_LOAD_CYCLES - 1) begin
                        weights_loaded <= 1'b1;
                        state          <= S_IDLE;
                    end
                end

                // ── Assert busy for current layer, begin timing ───────────────
                S_START_LAYER: begin
                    layer_busy[current_layer] <= 1'b1;
                    cycle_counter             <= 0;
                    state                     <= S_RUN_LAYER;
                end

                // ── Simulate layer compute time ──────────────────────────────
                S_RUN_LAYER: begin
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter >= CYCLES_PER_LAYER - 1)
                        state <= S_NEXT_LAYER;
                end

                // ── Advance to next layer or exit pipeline ───────────────────
                S_NEXT_LAYER: begin
                    layer_busy[current_layer] <= 1'b0;
                    if (current_layer < `DNN_NUM_LAYERS - 1) begin
                        current_layer <= current_layer + 1;
                        state         <= S_START_LAYER;
                    end else begin
                        pipeline_active <= 1'b0;
                        out_addr_off    <= 0;
                        state           <= S_WRITE_OUT;
                    end
                end

                // ── Write golden output to memory one word per cycle ─────────
                S_WRITE_OUT: begin
                    if (out_addr_off < `DNN_OUTPUT_SIZE) begin
                        mem_write    <= 1'b1;
                        mem_addr     <= output_base_addr + out_addr_off[MEM_ADDR_W-1:0];
                        mem_wdata    <= {16'h0000, golden[out_addr_off[7:0]]};
                        out_addr_off <= out_addr_off + 1;
                    end else begin
                        state <= S_DONE;
                    end
                end

                // ── Pulse inference_done; return to IDLE (which re-asserts
                //    system_ready on the NEXT clock — the rising edge TC4 waits
                //    for with @(posedge system_ready)) ────────────────────────
                S_DONE: begin
                    inference_done <= 1'b1;
                    state          <= S_IDLE;
                end

                default: state <= S_IDLE;

            endcase
        end
    end

endmodule
