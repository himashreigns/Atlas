// ===========================================================================
// tb_dnn_vs_golden.v
//
// OVERALL TESTBENCH: DUT output vs TensorFlow golden reference
//
// What this does
// --------------
// 1. Loads the exact same input image and conv weights the TF golden
//    generator used (from golden_input.memh / golden_weights_l0.memh /
//    golden_weights_l2.memh).
// 2. Resets the DUT, writes those values into hardware memory, runs one
//    full inference.
// 3. Reads every output activation from the DUT's output memory region.
// 4. Loads the TF-derived expected values (golden_output_tf.memh) — these
//    are round(TF_float_output / 256), where 256 = 2^(Q_ACC_SHIFT - Q_WGT)
//    is the scale factor between TF floats and hardware integers.
// 5. Compares each of the 256 output positions element-by-element and
//    reports exact matches, within-1-LSB matches, and mismatches.
//
// Pass condition
// --------------
// ALL 256 outputs must be within MAX_DIFF LSBs of the TF golden.
// With MAX_DIFF=1 this catches any arithmetic bug (wrong MAC, wrong shift,
// overflow, wrong ReLU, wrong pool) while tolerating the 1-LSB difference
// that arises between TF's float rounding and the hardware's integer
// truncation in the accumulator shift.
//
// Quick-reference for the scale relationship:
//   TF_float_output[i]  = HW_int_output[i] * 256
//   golden_int[i]       = round(TF_float / 256)
//   tolerance           = 1 LSB  (float round vs int truncate)
//
// How to use it with the real RTL
// --------------------------------
//   iverilog -g2005 -o tb_vs_golden.vvp \
//       tb_dnn_vs_golden.v <your_RTL_files> \
//       -I sim/
//   vvp tb_vs_golden.vvp
//
// With the behavioral stub (quick smoke test):
//   iverilog -g2005 -DGOLDEN_REPLAY -o tb_vs_golden.vvp \
//       tb_dnn_vs_golden.v rtl_stubs/streaming_nn_system_stub.sv \
//       -I sim/
//   vvp tb_vs_golden.vvp
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

module tb_dnn_vs_golden;

    // -----------------------------------------------------------------------
    // Parameters
    // -----------------------------------------------------------------------
    localparam CLK_PERIOD  = 10;   // ns (100 MHz)
    localparam NUM_LAYERS  = `DNN_NUM_LAYERS;
    localparam MEM_ADDR_W  = 20;
    localparam MEM_DATA_W  = 32;
    localparam EST_CYCLES  = `DNN_EST_LATENCY_CYCLES;

    // Maximum allowed per-element difference (LSBs) between DUT output
    // and the TF-derived golden.  1 LSB covers float-round vs int-truncate.
    localparam integer MAX_DIFF = 1;

    // -----------------------------------------------------------------------
    // Memory layout — must match tf_golden.py gen_patterns() exactly
    // -----------------------------------------------------------------------
    localparam [MEM_ADDR_W-1:0] INPUT_BASE   = 20'h00000;   // 784  words
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE  = 20'h10000;   // 256  words
    localparam [MEM_ADDR_W-1:0] W0_BASE      = 20'h20000;   // 150  words (conv1)
    localparam [MEM_ADDR_W-1:0] W2_BASE      = 20'h30000;   // 2400 words (conv2)

    // -----------------------------------------------------------------------
    // Clock
    // -----------------------------------------------------------------------
    reg clk;
    initial begin clk = 0; forever #(CLK_PERIOD/2) clk = ~clk; end

    // -----------------------------------------------------------------------
    // DUT signals
    // -----------------------------------------------------------------------
    reg  rst, start_inference, load_weights;
    wire inference_done, system_ready, weights_loaded;
    wire [NUM_LAYERS-1:0] layer_busy;
    wire                  pipeline_active;

    wire [MEM_ADDR_W-1:0] mem_addr;
    wire                  mem_read, mem_write;
    reg  [MEM_DATA_W-1:0] mem_rdata;
    reg                   mem_rdata_valid;
    wire [MEM_DATA_W-1:0] mem_wdata;

    // -----------------------------------------------------------------------
    // System memory (256K x 32b — large enough for all regions)
    // -----------------------------------------------------------------------
    reg [MEM_DATA_W-1:0] memory [0:(1<<18)-1];

    // Golden vectors loaded from files
    reg [15:0] golden_in    [0:783];
    reg [15:0] golden_w0    [0:149];
    reg [15:0] golden_w2    [0:2399];
    reg [15:0] golden_out   [0:255];

    // -----------------------------------------------------------------------
    // Memory model: 1-cycle read latency
    // -----------------------------------------------------------------------
    always @(posedge clk) begin
        mem_rdata_valid <= 1'b0;
        if (mem_read)  begin mem_rdata <= memory[mem_addr]; mem_rdata_valid <= 1'b1; end
        if (mem_write) memory[mem_addr] <= mem_wdata;
    end

    // -----------------------------------------------------------------------
    // DUT instantiation
    // -----------------------------------------------------------------------
    reg  [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;
    initial begin
        weights_base_addr = {(MEM_ADDR_W*NUM_LAYERS){1'b0}};
        weights_base_addr[MEM_ADDR_W*1-1 -: MEM_ADDR_W] = W0_BASE;
        weights_base_addr[MEM_ADDR_W*2-1 -: MEM_ADDR_W] = 20'h20100;
        weights_base_addr[MEM_ADDR_W*3-1 -: MEM_ADDR_W] = W2_BASE;
        weights_base_addr[MEM_ADDR_W*4-1 -: MEM_ADDR_W] = 20'h30A00;
    end

    streaming_nn_system #(
        .NUM_LAYERS(NUM_LAYERS), .MEM_ADDR_W(MEM_ADDR_W), .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk              (clk),
        .rst              (rst),
        .start_inference  (start_inference),
        .inference_done   (inference_done),
        .system_ready     (system_ready),
        .load_weights     (load_weights),
        .weights_loaded   (weights_loaded),
        .mem_addr         (mem_addr),
        .mem_read         (mem_read),
        .mem_rdata        (mem_rdata),
        .mem_rdata_valid  (mem_rdata_valid),
        .mem_write        (mem_write),
        .mem_wdata        (mem_wdata),
        .input_base_addr  (INPUT_BASE),
        .output_base_addr (OUTPUT_BASE),
        .weights_base_addr(weights_base_addr),
        .layer_busy       (layer_busy),
        .pipeline_active  (pipeline_active)
    );

    // -----------------------------------------------------------------------
    // Watchdog
    // -----------------------------------------------------------------------
    initial begin
        #(20 * EST_CYCLES * CLK_PERIOD + 500_000_000);
        $display("TIMEOUT"); $finish;
    end

    // -----------------------------------------------------------------------
    // VCD
    // -----------------------------------------------------------------------
    initial begin
        $dumpfile("tb_dnn_vs_golden.vcd");
        $dumpvars(0, tb_dnn_vs_golden);
    end

    // -----------------------------------------------------------------------
    // Scoreboard helpers
    // -----------------------------------------------------------------------
    integer pass_count, fail_count;

    task automatic report_pass;
        input [511:0] name;
        begin
            pass_count = pass_count + 1;
            $display("  PASS  [%0s]", name);
        end
    endtask

    task automatic report_fail;
        input [511:0] name;
        input [511:0] detail;
        begin
            fail_count = fail_count + 1;
            $display("  FAIL  [%0s] %0s", name, detail);
        end
    endtask

    // -----------------------------------------------------------------------
    // Negedge pulse helpers (no active-region race)
    // -----------------------------------------------------------------------
    task automatic pulse_lw;
        begin @(negedge clk); load_weights=1'b1;
              @(negedge clk); load_weights=1'b0; end
    endtask
    task automatic pulse_si;
        begin @(negedge clk); start_inference=1'b1;
              @(negedge clk); start_inference=1'b0; end
    endtask

    // -----------------------------------------------------------------------
    // Main sequence
    // -----------------------------------------------------------------------
    integer i;
    integer guard;
    integer exact_match, within1, mismatch;
    integer hw_val, gold_val, diff;
    integer max_diff_seen;
    real    mae;

    initial begin
        pass_count = 0; fail_count = 0;
        rst=1; start_inference=0; load_weights=0;

        $display("");
        $display("##########################################################");
        $display("#   tb_dnn_vs_golden: DUT vs TensorFlow golden reference  #");
        $display("##########################################################");
        $display("");
        $display("  TF float output    = HW int output * 256  (2^8)");
        $display("  golden_int[i]      = round(TF_float[i] / 256)");
        $display("  pass condition     : |DUT[i] - golden[i]| <= %0d LSB", MAX_DIFF);
        $display("");

        // ----------------------------------------------------------------
        // Load golden vectors from files
        // ----------------------------------------------------------------
        $display("[load] Reading TF golden files ...");
        $readmemh(`GOLDEN_INPUT_PATH,  golden_in);
        $readmemh(`GOLDEN_W0_PATH,     golden_w0);
        $readmemh(`GOLDEN_W2_PATH,     golden_w2);
        $readmemh(`GOLDEN_OUTPUT_PATH, golden_out);
        $display("  golden_in[0..3]  = %04h %04h %04h %04h",
                 golden_in[0], golden_in[1], golden_in[2], golden_in[3]);
        $display("  golden_out[0..3] = %04h %04h %04h %04h",
                 golden_out[0], golden_out[1], golden_out[2], golden_out[3]);

        // ----------------------------------------------------------------
        // Initialise memory with golden input + weights
        // ----------------------------------------------------------------
        $display("[init] Writing golden inputs and weights to DUT memory ...");
        for (i = 0; i < (1<<18); i = i + 1) memory[i] = 32'h0;
        for (i = 0; i < 784;   i = i + 1) memory[INPUT_BASE + i] = {16'h0, golden_in[i]};
        for (i = 0; i < 150;   i = i + 1) memory[W0_BASE    + i] = {16'h0, golden_w0[i]};
        for (i = 0; i < 2400;  i = i + 1) memory[W2_BASE    + i] = {16'h0, golden_w2[i]};
        $display("  done.");

        // ----------------------------------------------------------------
        // Reset
        // ----------------------------------------------------------------
        repeat (10) @(posedge clk);
        @(negedge clk); rst = 1'b0;
        repeat (5)  @(posedge clk);
        if (system_ready !== 1'b1) begin
            $display("ERROR: system_ready not asserted after reset"); $finish;
        end
        $display("[reset] system_ready = 1");

        // ----------------------------------------------------------------
        // Load weights
        // ----------------------------------------------------------------
        $display("[weights] Pulsing load_weights ...");
        pulse_lw();
        guard = 100000;
        while (!weights_loaded && guard > 0) begin @(posedge clk); guard = guard - 1; end
        if (!weights_loaded) begin $display("ERROR: weights_loaded never asserted"); $finish; end
        $display("[weights] weights_loaded = 1");

        // ----------------------------------------------------------------
        // Run inference
        // ----------------------------------------------------------------
        wait (system_ready);
        @(posedge clk);
        $display("[infer] Pulsing start_inference ...");
        pulse_si();

        guard = 10 * EST_CYCLES;
        while (!inference_done && guard > 0) begin @(posedge clk); guard = guard - 1; end
        if (!inference_done) begin $display("ERROR: inference_done never asserted"); $finish; end
        $display("[infer] inference_done = 1");

        // Wait for any final output writes to flush
        repeat(50) @(posedge clk);

        // ----------------------------------------------------------------
        // Compare DUT output against TF golden
        // ----------------------------------------------------------------
        $display("");
        $display("----------------------------------------------------------");
        $display(" Comparing DUT outputs against TensorFlow golden reference");
        $display("----------------------------------------------------------");

        exact_match  = 0;
        within1      = 0;
        mismatch     = 0;
        max_diff_seen = 0;
        mae          = 0.0;

        for (i = 0; i < 256; i = i + 1) begin
            hw_val   = $signed(memory[OUTPUT_BASE + i][15:0]);
            gold_val = $signed(golden_out[i]);
            diff     = hw_val - gold_val;
            if (diff < 0) diff = -diff;

            mae = mae + diff;
            if (diff > max_diff_seen) max_diff_seen = diff;

            if (diff == 0)          exact_match = exact_match + 1;
            if (diff <= 1)          within1     = within1     + 1;
            if (diff >  MAX_DIFF) begin
                mismatch = mismatch + 1;
                if (mismatch <= 8)
                    $display("  MISMATCH [%3d]: hw=%0d  golden=%0d  diff=%0d  (TF_float=%.3f)",
                             i, hw_val, gold_val, diff, gold_val * 256.0);
            end
        end
        mae = mae / 256.0;

        $display("");
        $display("  Total outputs       : 256");
        $display("  Exact match (diff=0): %0d / 256", exact_match);
        $display("  Within 1 LSB        : %0d / 256", within1);
        $display("  Mismatch (>%0d LSB) : %0d / 256", MAX_DIFF, mismatch);
        $display("  Max |diff|          : %0d LSB",   max_diff_seen);
        $display("  Mean |diff|  (MAE)  : %.3f LSB",  mae);
        $display("");

        // ----------------------------------------------------------------
        // Verdict
        // ----------------------------------------------------------------
        if (mismatch == 0) begin
            pass_count = pass_count + 1;
            $display("  PASS  [golden_comparison]  all outputs within %0d LSB of TF reference",
                     MAX_DIFF);
        end else begin
            fail_count = fail_count + 1;
            $display("  FAIL  [golden_comparison]  %0d outputs differ by > %0d LSB",
                     mismatch, MAX_DIFF);
        end

        $display("");
        $display("##########################################################");
        $display("  Tests: %0d   Pass: %0d   Fail: %0d",
                 pass_count+fail_count, pass_count, fail_count);
        if (fail_count == 0)
            $display("  >>> DUT MATCHES TF GOLDEN REFERENCE <<<");
        else
            $display("  >>> MISMATCH vs TF GOLDEN — hardware arithmetic error <<<");
        $display("##########################################################");
        $display("");
        $finish;
    end

endmodule
