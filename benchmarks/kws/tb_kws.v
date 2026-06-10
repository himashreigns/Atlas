// =============================================================================
// tb_kws.v  —  KWS-CNN Benchmark Testbench
//
// Workload : Keyword Spotting CNN  (MLPerf Tiny KWS)
// Network  : CONV(3×3,1→8) → POOL(2×2) → POOL(2×2) → FC(80→10)
// Input    : 25×10 MFCC feature map
// Output   : 10 keyword logits
//
// Test suite  (TC1–TC9):
//   TC1  Reset & ready assertion
//   TC2  Weight load → weights_loaded
//   TC3  Single inference latency within ±LATENCY_TOL_PCT of estimate
//   TC4  Back-to-back throughput (4 inferences)
//   TC5  Per-layer activity edges (layer_busy rise per inference)
//   TC6  Output non-zero after deterministic input
//   TC7  Quiescence: system_ready re-asserts after done
//   TC8  Reset mid-stream & re-run
//   TC9  Bit-exact golden compare (hw output vs numpy fixed-point)
//
// Build (iverilog):
//   iverilog -g2005 -o sim_kws tb_kws.v <rtl_files> -I . -I ../../sim
//   vvp sim_kws
//
// Vivado:
//   Add all RTL sources + this TB; set tb_kws as top simulation module.
//   Include path: benchmarks/kws  and  sim/
// =============================================================================
`timescale 1ns/1ps
`include "dnn_config_kws.vh"

`ifndef GOLDEN_KWS_PATH
  `define GOLDEN_KWS_PATH "golden_kws_output.memh"
`endif

module tb_kws;

    // -------------------------------------------------------------------------
    // Compile-time parameters
    // -------------------------------------------------------------------------
    localparam CLK_PERIOD           = 10;          // 100 MHz
    localparam NUM_LAYERS           = `DNN_NUM_LAYERS;    // 4
    localparam N_DUT                = `DNN_STAGE0_N;      // 8
    localparam DATA_W               = 16;
    localparam ACC_W                = 32;
    localparam ADDR_W               = 10;
    localparam MEM_ADDR_W           = 20;
    localparam MEM_DATA_W           = 32;
    localparam EST_LATENCY          = `DNN_EST_LATENCY_CYCLES;  // 1820
    localparam real LATENCY_TOL_PCT = 30.0;
    localparam STRESS_INFERENCES    = 4;

    // Benchmark-specific geometry
    localparam INPUT_SIZE           = `KWS_INPUT_SIZE;   // 250
    localparam OUTPUT_SIZE          = `KWS_OUTPUT_SIZE;  // 10
    localparam L0_WGTS              = `KWS_L0_WGTS;      // 72
    localparam L3_WGTS              = `KWS_L3_WGTS;      // 800

    localparam [MEM_ADDR_W-1:0] INPUT_BASE  = 20'h00000;
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE = 20'h10000;
    localparam [MEM_ADDR_W-1:0] WGT_L0      = `KWS_WGT_BASE_L0;
    localparam [MEM_ADDR_W-1:0] WGT_L1      = `KWS_WGT_BASE_L1;
    localparam [MEM_ADDR_W-1:0] WGT_L2      = `KWS_WGT_BASE_L2;
    localparam [MEM_ADDR_W-1:0] WGT_L3      = `KWS_WGT_BASE_L3;

    // -------------------------------------------------------------------------
    // DUT signals
    // -------------------------------------------------------------------------
    reg                            clk;
    reg                            rst;
    reg                            start_inference;
    wire                           inference_done;
    wire                           system_ready;
    reg                            load_weights;
    wire                           weights_loaded;

    wire [MEM_ADDR_W-1:0]          mem_addr;
    wire                           mem_read;
    reg  [MEM_DATA_W-1:0]          mem_rdata;
    reg                            mem_rdata_valid;
    wire                           mem_write;
    wire [MEM_DATA_W-1:0]          mem_wdata;

    reg  [MEM_ADDR_W-1:0]          input_base_addr;
    reg  [MEM_ADDR_W-1:0]          output_base_addr;
    reg  [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;

    wire [NUM_LAYERS-1:0]          layer_busy;
    wire                           pipeline_active;

    // Simulated DRAM  (256K × 32b)
    reg  [MEM_DATA_W-1:0]          memory [0:(1<<18)-1];

    // -------------------------------------------------------------------------
    // DUT
    // -------------------------------------------------------------------------
    streaming_nn_system #(
        .N          (N_DUT),
        .DATA_W     (DATA_W),
        .ACC_W      (ACC_W),
        .ADDR_W     (ADDR_W),
        .NUM_LAYERS (NUM_LAYERS),
        .MEM_ADDR_W (MEM_ADDR_W),
        .MEM_DATA_W (MEM_DATA_W)
    ) dut (
        .clk               (clk),
        .rst               (rst),
        .start_inference   (start_inference),
        .inference_done    (inference_done),
        .system_ready      (system_ready),
        .load_weights      (load_weights),
        .weights_loaded    (weights_loaded),
        .mem_addr          (mem_addr),
        .mem_read          (mem_read),
        .mem_rdata         (mem_rdata),
        .mem_rdata_valid   (mem_rdata_valid),
        .mem_write         (mem_write),
        .mem_wdata         (mem_wdata),
        .input_base_addr   (input_base_addr),
        .output_base_addr  (output_base_addr),
        .weights_base_addr (weights_base_addr),
        .layer_busy        (layer_busy),
        .pipeline_active   (pipeline_active)
    );

    // -------------------------------------------------------------------------
    // Clock & 1-cycle SRAM model
    // -------------------------------------------------------------------------
    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    always @(posedge clk) begin
        mem_rdata_valid <= 1'b0;
        if (mem_read)  begin mem_rdata <= memory[mem_addr]; mem_rdata_valid <= 1'b1; end
        if (mem_write) memory[mem_addr] <= mem_wdata;
    end

    // -------------------------------------------------------------------------
    // Pass/fail accounting
    // -------------------------------------------------------------------------
    integer pass_cnt, fail_cnt, check_cnt;

    task automatic chk_eq;
        input [255:0] name; input [63:0] got; input [63:0] exp;
        begin
            check_cnt = check_cnt + 1;
            if (got !== exp) begin
                $display("  FAIL  [%0s]  got=%0d  exp=%0d", name, got, exp);
                fail_cnt = fail_cnt + 1;
            end else begin
                $display("  PASS  [%0s]  (=%0d)", name, got);
                pass_cnt = pass_cnt + 1;
            end
        end
    endtask

    task automatic chk_range;
        input [255:0] name; input integer got; input integer lo; input integer hi;
        begin
            check_cnt = check_cnt + 1;
            if (got < lo || got > hi) begin
                $display("  FAIL  [%0s]  got=%0d  expected=[%0d,%0d]", name, got, lo, hi);
                fail_cnt = fail_cnt + 1;
            end else begin
                $display("  PASS  [%0s]  got=%0d in [%0d,%0d]", name, got, lo, hi);
                pass_cnt = pass_cnt + 1;
            end
        end
    endtask

    task automatic chk_true;
        input [255:0] name; input cond;
        begin
            check_cnt = check_cnt + 1;
            if (!cond) begin $display("  FAIL  [%0s]", name); fail_cnt = fail_cnt + 1; end
            else       begin $display("  PASS  [%0s]", name); pass_cnt = pass_cnt + 1; end
        end
    endtask

    // -------------------------------------------------------------------------
    // Per-layer activity tracking
    // -------------------------------------------------------------------------
    integer    layer_edges [0:NUM_LAYERS-1];
    reg [NUM_LAYERS-1:0] lb_prev;
    integer    li;
    always @(posedge clk) begin
        if (rst) lb_prev <= 0;
        else begin
            for (li = 0; li < NUM_LAYERS; li = li+1)
                if (layer_busy[li] && !lb_prev[li]) layer_edges[li] <= layer_edges[li] + 1;
            lb_prev <= layer_busy;
        end
    end

    // -------------------------------------------------------------------------
    // Golden reference for TC9
    // -------------------------------------------------------------------------
    reg [15:0] golden [0:255];

    // -------------------------------------------------------------------------
    // Setup helpers
    // -------------------------------------------------------------------------
    task automatic init_dram;
        integer i;
        begin
            for (i = 0; i < (1<<18); i = i+1) memory[i] = 0;

            // MFCC input: same pattern as tf_golden_kws.py
            for (i = 0; i < INPUT_SIZE; i = i+1)
                memory[INPUT_BASE + i] = (i % 256) << 8;

            // L0 CONV weights  (pattern: ((i*7+3)&0xFF)<<4)
            for (i = 0; i < L0_WGTS; i = i+1)
                memory[WGT_L0 + i] = ((i * 7 + 3) & 32'hFF) << 4;

            // L1, L2 are POOL — no weights

            // L3 FC weights  (pattern: ((i*11+7)&0xFF)<<4)
            for (i = 0; i < L3_WGTS; i = i+1)
                memory[WGT_L3 + i] = ((i * 11 + 7) & 32'hFF) << 4;
        end
    endtask

    task automatic do_reset;
        integer li_r;
        begin
            rst             = 1'b1;
            start_inference = 1'b0;
            load_weights    = 1'b0;
            lb_prev         = 0;
            for (li_r = 0; li_r < NUM_LAYERS; li_r = li_r+1) layer_edges[li_r] = 0;
            input_base_addr   = INPUT_BASE;
            output_base_addr  = OUTPUT_BASE;
            weights_base_addr = {WGT_L3, WGT_L2, WGT_L1, WGT_L0};
            repeat(4) @(posedge clk);
            rst = 1'b0;
            @(posedge clk);
        end
    endtask

    task automatic do_load_weights;
        integer timeout;
        begin
            @(posedge clk); load_weights = 1'b1;
            @(posedge clk); load_weights = 1'b0;
            timeout = 0;
            while (!weights_loaded && timeout < 5000) begin
                @(posedge clk); timeout = timeout + 1;
            end
        end
    endtask

    task automatic do_inference;
        output integer cycles;
        integer wdog;
        begin
            @(posedge clk); start_inference = 1'b1;
            @(posedge clk); start_inference = 1'b0;
            cycles = 0; wdog = 0;
            while (!inference_done && wdog < EST_LATENCY * 10) begin
                @(posedge clk); cycles = cycles + 1; wdog = wdog + 1;
            end
        end
    endtask

    // -------------------------------------------------------------------------
    // Main test
    // -------------------------------------------------------------------------
    integer infer_cycles, it;
    integer tc9_matches, tc9_mismatches, tc9_max_diff;
    integer hw_val, gold_val, diff;
    reg [255:0] lname;

    localparam integer LAT_LO = $rtoi(EST_LATENCY * (1.0 - LATENCY_TOL_PCT/100.0));
    localparam integer LAT_HI = $rtoi(EST_LATENCY * (1.0 + LATENCY_TOL_PCT/100.0));

    integer watchdog_cnt;

    initial begin
        $display("");
        $display("╔══════════════════════════════════════════════════════╗");
        $display("║   KWS-CNN Benchmark  —  Keyword Spotting (25×10)    ║");
        $display("║   CONV(3×3,1→8) → POOL → POOL → FC(80→10)          ║");
        $display("║   Target: ZedBoard XC7Z020  @100MHz                 ║");
        $display("╚══════════════════════════════════════════════════════╝");
        $display("   EST_LATENCY = %0d cycles", EST_LATENCY);
        $display("   N_DUT       = %0d", N_DUT);
        $display("");

        pass_cnt = 0; fail_cnt = 0; check_cnt = 0;
        $readmemh(`GOLDEN_KWS_PATH, golden);
        init_dram();
        do_reset();

        // ── TC1: Reset & ready ──────────────────────────────────────────────
        $display("TC1: Reset & ready");
        repeat(2) @(posedge clk);
        chk_true("system_ready_after_reset", system_ready);
        chk_true("not_done_after_reset",    !inference_done);

        // ── TC2: Weight loading ─────────────────────────────────────────────
        $display("TC2: Weight loading");
        do_load_weights();
        chk_true("weights_loaded_asserts", weights_loaded);
        chk_true("system_ready_after_load", system_ready);

        // ── TC3: Inference latency ──────────────────────────────────────────
        $display("TC3: Inference latency");
        do_inference(infer_cycles);
        chk_true("inference_completes",      inference_done);
        chk_range("latency_within_estimate", infer_cycles, LAT_LO, LAT_HI);
        $display("     actual=%0d cycles  estimate=%0d  tol=±%0d%%",
                 infer_cycles, EST_LATENCY, $rtoi(LATENCY_TOL_PCT));

        // ── TC4: Back-to-back throughput ────────────────────────────────────
        $display("TC4: Back-to-back throughput (%0d inferences)", STRESS_INFERENCES);
        for (it = 0; it < STRESS_INFERENCES; it = it+1) begin
            @(posedge system_ready or posedge rst);
            @(posedge clk); start_inference = 1'b1;
            @(posedge clk); start_inference = 1'b0;
            @(posedge inference_done);
        end
        chk_true("stress_all_complete", inference_done);

        // ── TC5: Per-layer activity ─────────────────────────────────────────
        $display("TC5: Per-layer activity edges");
        // Reset edge counters and run one fresh inference
        do_reset();
        do_load_weights();
        for (li = 0; li < NUM_LAYERS; li = li+1) layer_edges[li] = 0;
        do_inference(infer_cycles);
        for (li = 0; li < NUM_LAYERS; li = li+1) begin
            $sformat(lname, "layer_busy_edges[%0d]", li);
            chk_range(lname, layer_edges[li], 1, 1);
        end

        // ── TC6: Output non-zero ────────────────────────────────────────────
        $display("TC6: Output non-zero check");
        begin
            integer nz; nz = 0;
            for (it = 0; it < OUTPUT_SIZE; it = it+1)
                if (memory[OUTPUT_BASE + it] !== 0) nz = nz + 1;
            chk_true("at_least_one_nonzero_output", nz > 0);
            $display("     nonzero outputs: %0d / %0d", nz, OUTPUT_SIZE);
        end

        // ── TC7: Quiescence ─────────────────────────────────────────────────
        $display("TC7: Quiescence after inference");
        repeat(5) @(posedge clk);
        chk_true("system_ready_reasserts", system_ready);
        chk_true("pipeline_idle",         !pipeline_active);

        // ── TC8: Reset + rerun ──────────────────────────────────────────────
        $display("TC8: Reset and rerun");
        do_reset();
        do_load_weights();
        do_inference(infer_cycles);
        chk_true("rerun_completes", inference_done);
        chk_range("rerun_latency",  infer_cycles, LAT_LO, LAT_HI);

        // ── TC9: Bit-exact golden compare ───────────────────────────────────
        $display("TC9: Golden comparison (hw vs numpy fixed-point)");
        tc9_matches = 0; tc9_mismatches = 0; tc9_max_diff = 0;
        for (it = 0; it < OUTPUT_SIZE; it = it+1) begin
            hw_val   = memory[OUTPUT_BASE + it][15:0];
            gold_val = golden[it];
            diff     = (hw_val >= gold_val) ? (hw_val - gold_val) : (gold_val - hw_val);
            if (diff == 0) tc9_matches = tc9_matches + 1;
            else           tc9_mismatches = tc9_mismatches + 1;
            if (diff > tc9_max_diff) tc9_max_diff = diff;
            if (diff > 1)
                $display("     MISMATCH [%0d]  hw=%0d  golden=%0d  diff=%0d",
                         it, hw_val, gold_val, diff);
        end
        chk_eq   ("golden_matches",      tc9_matches, OUTPUT_SIZE);
        chk_true ("max_diff_le_1_lsb",   tc9_max_diff <= 1);
        $display("     matches=%0d/%0d  max_diff=%0d LSBs",
                 tc9_matches, OUTPUT_SIZE, tc9_max_diff);

        // ── Summary ─────────────────────────────────────────────────────────
        $display("");
        $display("══════════════════════════════════════════════════════");
        $display("  KWS-CNN BENCHMARK RESULT:");
        $display("  %0d/%0d checks PASS  (%0d FAIL)",
                 pass_cnt, check_cnt, fail_cnt);
        $display("  Latency     : %0d cycles  (est. %0d, ±%0d%%)",
                 infer_cycles, EST_LATENCY, $rtoi(LATENCY_TOL_PCT));
        $display("  MAC width N : %0d", N_DUT);
        $display("  Est. area   : %0d.%0d AU", `DNN_EST_AREA_INTx10/10, `DNN_EST_AREA_INTx10%10);
        $display("  Est. power  : %0d mW", `DNN_EST_POWER_MWx10/10);
        $display("══════════════════════════════════════════════════════");
        if (fail_cnt == 0)
            $display("  *** ALL CHECKS PASSED ***");
        else
            $display("  *** %0d CHECKS FAILED ***", fail_cnt);
        $display("");
        $finish;
    end

    // Global watchdog
    initial begin
        #(EST_LATENCY * CLK_PERIOD * 100);
        $display("TIMEOUT: simulation exceeded watchdog limit");
        $finish;
    end

endmodule
