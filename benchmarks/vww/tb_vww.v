// =============================================================================
// tb_vww.v  —  VWW-Tiny Benchmark Testbench
//
// Workload : Visual Wake Words  (person / no-person detection)
// Network  : CONV(3×3,1→8) → POOL(2×2) → CONV(3×3,8→16) → POOL(2×2)
// Input    : 24×24 grayscale image  (576 pixels)
// Output   : 4×4×16 = 256 spatial features  (fed to off-chip softmax)
//
// This is the HEAVIEST benchmark in the suite (2 CONV layers).
// It exercises the VWW data path used in smart doorbell / camera IoT devices.
//
// Layer shapes:
//   L0 CONV 3×3 1→8  valid : 24×24→22×22×8
//   L1 POOL 2×2             : 22×22×8→11×11×8
//   L2 CONV 3×3 8→16 valid : 11×11→9×9×16
//   L3 POOL 2×2             : 9×9×16→4×4×16=256
//
// Test suite  TC1–TC9  (same structure as tb_kws.v).
//
// Build:
//   iverilog -g2005 -o sim_vww tb_vww.v <rtl> -I . -I ../../sim
// =============================================================================
`timescale 1ns/1ps
`include "dnn_config_vww.vh"

`ifndef GOLDEN_VWW_PATH
  `define GOLDEN_VWW_PATH "golden_vww_output.memh"
`endif

module tb_vww;

    localparam CLK_PERIOD           = 10;
    localparam NUM_LAYERS           = `DNN_NUM_LAYERS;
    localparam N_DUT                = `DNN_STAGE0_N;       // 16
    localparam DATA_W               = 16;
    localparam ACC_W                = 32;
    localparam ADDR_W               = 10;
    localparam MEM_ADDR_W           = 20;
    localparam MEM_DATA_W           = 32;
    localparam EST_LATENCY          = `DNN_EST_LATENCY_CYCLES;  // 10325
    localparam real LATENCY_TOL_PCT = 30.0;
    localparam STRESS_INFERENCES    = 4;

    localparam INPUT_SIZE           = `VWW_INPUT_SIZE;    // 576
    localparam OUTPUT_SIZE          = `VWW_OUTPUT_SIZE;   // 256
    localparam L0_WGTS              = `VWW_L0_WGTS;       // 72
    localparam L2_WGTS              = `VWW_L2_WGTS;       // 1152

    localparam [MEM_ADDR_W-1:0] INPUT_BASE  = 20'h00000;
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE = 20'h10000;
    localparam [MEM_ADDR_W-1:0] WGT_L0      = `VWW_WGT_BASE_L0;
    localparam [MEM_ADDR_W-1:0] WGT_L1      = `VWW_WGT_BASE_L1;
    localparam [MEM_ADDR_W-1:0] WGT_L2      = `VWW_WGT_BASE_L2;
    localparam [MEM_ADDR_W-1:0] WGT_L3      = `VWW_WGT_BASE_L3;

    // ── DUT signals ──────────────────────────────────────────────────────────
    reg                            clk, rst;
    reg                            start_inference;
    wire                           inference_done, system_ready;
    reg                            load_weights;
    wire                           weights_loaded;
    wire [MEM_ADDR_W-1:0]          mem_addr;
    wire                           mem_read;
    reg  [MEM_DATA_W-1:0]          mem_rdata;
    reg                            mem_rdata_valid;
    wire                           mem_write;
    wire [MEM_DATA_W-1:0]          mem_wdata;
    reg  [MEM_ADDR_W-1:0]          input_base_addr, output_base_addr;
    reg  [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;
    wire [NUM_LAYERS-1:0]          layer_busy;
    wire                           pipeline_active;

    reg  [MEM_DATA_W-1:0]          memory [0:(1<<18)-1];
    reg  [15:0]                    golden [0:255];

    // ── DUT ──────────────────────────────────────────────────────────────────
    streaming_nn_system #(
        .N(N_DUT), .DATA_W(DATA_W), .ACC_W(ACC_W), .ADDR_W(ADDR_W),
        .NUM_LAYERS(NUM_LAYERS), .MEM_ADDR_W(MEM_ADDR_W), .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk(clk), .rst(rst),
        .start_inference(start_inference), .inference_done(inference_done),
        .system_ready(system_ready),
        .load_weights(load_weights), .weights_loaded(weights_loaded),
        .mem_addr(mem_addr), .mem_read(mem_read),
        .mem_rdata(mem_rdata), .mem_rdata_valid(mem_rdata_valid),
        .mem_write(mem_write), .mem_wdata(mem_wdata),
        .input_base_addr(input_base_addr), .output_base_addr(output_base_addr),
        .weights_base_addr(weights_base_addr),
        .layer_busy(layer_busy), .pipeline_active(pipeline_active)
    );

    initial clk = 0;
    always #(CLK_PERIOD/2) clk = ~clk;

    always @(posedge clk) begin
        mem_rdata_valid <= 1'b0;
        if (mem_read)  begin mem_rdata <= memory[mem_addr]; mem_rdata_valid <= 1'b1; end
        if (mem_write) memory[mem_addr] <= mem_wdata;
    end

    // ── Pass/fail helpers ────────────────────────────────────────────────────
    integer pass_cnt, fail_cnt, check_cnt;

    task automatic chk_eq;
        input [255:0] n; input [63:0] got; input [63:0] exp;
        begin check_cnt=check_cnt+1;
            if (got!==exp) begin $display("  FAIL [%0s] got=%0d exp=%0d",n,got,exp); fail_cnt=fail_cnt+1; end
            else           begin $display("  PASS [%0s] (=%0d)",n,got);               pass_cnt=pass_cnt+1; end
        end
    endtask
    task automatic chk_range;
        input [255:0] n; input integer got,lo,hi;
        begin check_cnt=check_cnt+1;
            if (got<lo||got>hi) begin $display("  FAIL [%0s] got=%0d [%0d,%0d]",n,got,lo,hi); fail_cnt=fail_cnt+1; end
            else                begin $display("  PASS [%0s] got=%0d in [%0d,%0d]",n,got,lo,hi); pass_cnt=pass_cnt+1; end
        end
    endtask
    task automatic chk_true;
        input [255:0] n; input cond;
        begin check_cnt=check_cnt+1;
            if (!cond) begin $display("  FAIL [%0s]",n); fail_cnt=fail_cnt+1; end
            else       begin $display("  PASS [%0s]",n); pass_cnt=pass_cnt+1; end
        end
    endtask

    // ── Layer activity ───────────────────────────────────────────────────────
    integer layer_edges [0:NUM_LAYERS-1];
    reg [NUM_LAYERS-1:0] lb_prev;
    integer li;
    always @(posedge clk) begin
        if (rst) lb_prev <= 0;
        else begin
            for (li=0; li<NUM_LAYERS; li=li+1)
                if (layer_busy[li] && !lb_prev[li]) layer_edges[li] <= layer_edges[li]+1;
            lb_prev <= layer_busy;
        end
    end

    // ── Setup tasks ──────────────────────────────────────────────────────────
    task automatic init_dram;
        integer i;
        begin
            for (i=0; i<(1<<18); i=i+1) memory[i]=0;
            // 24×24=576 pixel image
            for (i=0; i<INPUT_SIZE; i=i+1)
                memory[INPUT_BASE+i] = (i%256)<<8;
            // L0 CONV 3×3 1→8 weights (72)
            for (i=0; i<L0_WGTS; i=i+1)
                memory[WGT_L0+i] = ((i*7+3)&32'hFF)<<4;
            // L1 POOL — no weights
            // L2 CONV 3×3 8→16 weights (1152)
            for (i=0; i<L2_WGTS; i=i+1)
                memory[WGT_L2+i] = ((i*13+5)&32'hFF)<<4;
            // L3 POOL — no weights
        end
    endtask

    task automatic do_reset;
        integer li_r;
        begin
            rst=1; start_inference=0; load_weights=0; lb_prev=0;
            for (li_r=0; li_r<NUM_LAYERS; li_r=li_r+1) layer_edges[li_r]=0;
            input_base_addr  = INPUT_BASE;
            output_base_addr = OUTPUT_BASE;
            weights_base_addr= {WGT_L3, WGT_L2, WGT_L1, WGT_L0};
            repeat(4) @(posedge clk);
            rst=0; @(posedge clk);
        end
    endtask

    task automatic do_load_weights;
        integer t;
        begin
            @(posedge clk); load_weights=1;
            @(posedge clk); load_weights=0;
            t=0; while(!weights_loaded && t<10000) begin @(posedge clk); t=t+1; end
        end
    endtask

    task automatic do_inference;
        output integer cycles;
        integer wd;
        begin
            @(posedge clk); start_inference=1;
            @(posedge clk); start_inference=0;
            cycles=0; wd=0;
            while (!inference_done && wd<EST_LATENCY*10) begin @(posedge clk); cycles=cycles+1; wd=wd+1; end
        end
    endtask

    // ── Main ─────────────────────────────────────────────────────────────────
    integer infer_cycles, it;
    integer tc9_matches, tc9_mismatches, tc9_max_diff;
    integer hw_val, gold_val, diff;
    reg [255:0] lname;

    localparam integer LAT_LO = $rtoi(EST_LATENCY*(1.0-LATENCY_TOL_PCT/100.0));
    localparam integer LAT_HI = $rtoi(EST_LATENCY*(1.0+LATENCY_TOL_PCT/100.0));

    initial begin
        $display("");
        $display("╔══════════════════════════════════════════════════════╗");
        $display("║   VWW-Tiny Benchmark  —  Visual Wake Words (24×24)  ║");
        $display("║   CONV(3×3,1→8)→POOL→CONV(3×3,8→16)→POOL           ║");
        $display("╚══════════════════════════════════════════════════════╝");
        $display("   EST_LATENCY = %0d cycles", EST_LATENCY);

        pass_cnt=0; fail_cnt=0; check_cnt=0;
        $readmemh(`GOLDEN_VWW_PATH, golden);
        init_dram();
        do_reset();

        $display("TC1: Reset & ready");
        repeat(2) @(posedge clk);
        chk_true("system_ready", system_ready);
        chk_true("not_done",    !inference_done);

        $display("TC2: Weight loading");
        do_load_weights();
        chk_true("weights_loaded_asserts", weights_loaded);

        $display("TC3: Inference latency");
        do_inference(infer_cycles);
        chk_true ("inference_completes", inference_done);
        chk_range("latency_estimate",    infer_cycles, LAT_LO, LAT_HI);
        $display("     actual=%0d  est=%0d  tol=±%0d%%",
                 infer_cycles, EST_LATENCY, $rtoi(LATENCY_TOL_PCT));

        $display("TC4: Back-to-back throughput");
        for (it=0; it<STRESS_INFERENCES; it=it+1) begin
            @(posedge system_ready or posedge rst);
            @(posedge clk); start_inference=1;
            @(posedge clk); start_inference=0;
            @(posedge inference_done);
        end
        chk_true("stress_complete", inference_done);

        $display("TC5: Per-layer activity");
        do_reset(); do_load_weights();
        for (li=0; li<NUM_LAYERS; li=li+1) layer_edges[li]=0;
        do_inference(infer_cycles);
        for (li=0; li<NUM_LAYERS; li=li+1) begin
            $sformat(lname, "layer_busy_edges[%0d]", li);
            chk_range(lname, layer_edges[li], 1, 1);
        end

        $display("TC6: Output non-zero");
        begin
            integer nz; nz=0;
            for (it=0; it<OUTPUT_SIZE; it=it+1)
                if (memory[OUTPUT_BASE+it]!==0) nz=nz+1;
            chk_true("some_nonzero", nz>0);
            $display("     nonzero: %0d / %0d", nz, OUTPUT_SIZE);
        end

        $display("TC7: Quiescence");
        repeat(5) @(posedge clk);
        chk_true("system_ready_reasserts", system_ready);
        chk_true("pipeline_idle",         !pipeline_active);

        $display("TC8: Reset & rerun");
        do_reset(); do_load_weights();
        do_inference(infer_cycles);
        chk_true("rerun_complete", inference_done);

        $display("TC9: Golden comparison (256 outputs)");
        tc9_matches=0; tc9_mismatches=0; tc9_max_diff=0;
        for (it=0; it<OUTPUT_SIZE; it=it+1) begin
            hw_val  = memory[OUTPUT_BASE+it][15:0];
            gold_val= golden[it];
            diff    = (hw_val>=gold_val)?(hw_val-gold_val):(gold_val-hw_val);
            if (diff==0) tc9_matches=tc9_matches+1;
            else         tc9_mismatches=tc9_mismatches+1;
            if (diff>tc9_max_diff) tc9_max_diff=diff;
            if (diff>1) $display("     MISMATCH[%0d] hw=%0d golden=%0d diff=%0d",
                                  it, hw_val, gold_val, diff);
        end
        chk_eq  ("golden_all_match",  tc9_matches, OUTPUT_SIZE);
        chk_true("max_diff_le_1_lsb", tc9_max_diff<=1);
        $display("     matches=%0d/%0d  max_diff=%0d LSBs",
                 tc9_matches, OUTPUT_SIZE, tc9_max_diff);

        $display("");
        $display("══════════════════════════════════════════════════════");
        $display("  VWW-Tiny BENCHMARK RESULT:");
        $display("  %0d/%0d PASS  (%0d FAIL)", pass_cnt, check_cnt, fail_cnt);
        $display("  Latency  : %0d cycles  (heaviest benchmark — 2 CONVs)", infer_cycles);
        $display("  Area     : %0d.%0d AU", `DNN_EST_AREA_INTx10/10, `DNN_EST_AREA_INTx10%10);
        $display("  Power    : %0d mW", `DNN_EST_POWER_MWx10/10);
        $display("══════════════════════════════════════════════════════");
        if (fail_cnt==0) $display("  *** ALL PASSED ***");
        else             $display("  *** %0d FAILED ***", fail_cnt);
        $display("");
        $finish;
    end

    initial begin
        #(EST_LATENCY * CLK_PERIOD * 100);
        $display("TIMEOUT"); $finish;
    end

endmodule
