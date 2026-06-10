// =============================================================================
// tb_ecg.v  —  ECG-Net Benchmark Testbench
//
// Workload : ECG Anomaly Detector  (medical IoT wearable)
// Network  : CONV(3×3,1→8) → POOL(2×2) → POOL(2×2) → FC(24→2)
// Input    : 128-sample ECG window, reshaped to 16×8 2-D map
// Output   : 2 logits  [normal, anomaly]
//
// This is the LOWEST-LATENCY benchmark (~789 cycles).
// Suitable for continuous cardiac monitoring on ultra-low-power devices.
//
// Input reshaping:
//   Raw ECG samples s[0..127] stored row-major as a 16×8 image.
//   3×3 CONV captures temporal-amplitude patterns across 3 consecutive
//   samples in both the temporal and the "channel" layout axes.
//
// Layer shapes:
//   L0 CONV 3×3 1→8  : 16×8  → 14×6×8
//   L1 POOL 2×2       : 14×6×8 → 7×3×8
//   L2 POOL 2×2       : 7×3×8  → 3×1×8=24   (floor(7/2)=3, floor(3/2)=1)
//   L3 FC 24→2
//
// Test suite  TC1–TC9.
// Build:
//   iverilog -g2005 -o sim_ecg tb_ecg.v <rtl> -I . -I ../../sim
// =============================================================================
`timescale 1ns/1ps
`include "dnn_config_ecg.vh"

`ifndef GOLDEN_ECG_PATH
  `define GOLDEN_ECG_PATH "golden_ecg_output.memh"
`endif

module tb_ecg;

    localparam CLK_PERIOD           = 10;
    localparam NUM_LAYERS           = `DNN_NUM_LAYERS;
    localparam N_DUT                = `DNN_STAGE0_N;      // 8
    localparam DATA_W               = 16;
    localparam ACC_W                = 32;
    localparam ADDR_W               = 10;
    localparam MEM_ADDR_W           = 20;
    localparam MEM_DATA_W           = 32;
    localparam EST_LATENCY          = `DNN_EST_LATENCY_CYCLES;  // 789
    localparam real LATENCY_TOL_PCT = 30.0;
    localparam STRESS_INFERENCES    = 8;   // Low latency → more stress iterations

    localparam INPUT_SIZE           = `ECG_INPUT_SIZE;  // 128
    localparam OUTPUT_SIZE          = `ECG_OUTPUT_SIZE; // 2
    localparam L0_WGTS              = `ECG_L0_WGTS;     // 72
    localparam L3_WGTS              = `ECG_L3_WGTS;     // 48

    localparam [MEM_ADDR_W-1:0] INPUT_BASE  = 20'h00000;
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE = 20'h10000;
    localparam [MEM_ADDR_W-1:0] WGT_L0      = `ECG_WGT_BASE_L0;
    localparam [MEM_ADDR_W-1:0] WGT_L1      = `ECG_WGT_BASE_L1;
    localparam [MEM_ADDR_W-1:0] WGT_L2      = `ECG_WGT_BASE_L2;
    localparam [MEM_ADDR_W-1:0] WGT_L3      = `ECG_WGT_BASE_L3;

    reg clk, rst, start_inference, load_weights;
    wire inference_done, system_ready, weights_loaded;
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire mem_read, mem_write;
    reg  [MEM_DATA_W-1:0] mem_rdata;
    reg  mem_rdata_valid;
    wire [MEM_DATA_W-1:0] mem_wdata;
    reg  [MEM_ADDR_W-1:0] input_base_addr, output_base_addr;
    reg  [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;
    wire [NUM_LAYERS-1:0] layer_busy;
    wire pipeline_active;

    reg  [MEM_DATA_W-1:0] memory [0:(1<<18)-1];
    reg  [15:0]           golden [0:255];

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

    integer pass_cnt, fail_cnt, check_cnt;
    task automatic chk_eq;
        input [255:0] n; input [63:0] got; input [63:0] exp;
        begin check_cnt=check_cnt+1;
            if (got!==exp) begin $display("  FAIL [%0s] got=%0d exp=%0d",n,got,exp); fail_cnt=fail_cnt+1; end
            else           begin $display("  PASS [%0s] (=%0d)",n,got); pass_cnt=pass_cnt+1; end end
    endtask
    task automatic chk_range;
        input [255:0] n; input integer got,lo,hi;
        begin check_cnt=check_cnt+1;
            if (got<lo||got>hi) begin $display("  FAIL [%0s] got=%0d [%0d,%0d]",n,got,lo,hi); fail_cnt=fail_cnt+1; end
            else                begin $display("  PASS [%0s] got=%0d",n,got); pass_cnt=pass_cnt+1; end end
    endtask
    task automatic chk_true;
        input [255:0] n; input cond;
        begin check_cnt=check_cnt+1;
            if (!cond) begin $display("  FAIL [%0s]",n); fail_cnt=fail_cnt+1; end
            else       begin $display("  PASS [%0s]",n); pass_cnt=pass_cnt+1; end end
    endtask

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

    task automatic init_dram;
        integer i;
        begin
            for (i=0; i<(1<<18); i=i+1) memory[i]=0;
            for (i=0; i<INPUT_SIZE; i=i+1) memory[INPUT_BASE+i] = (i%256)<<8;
            for (i=0; i<L0_WGTS;   i=i+1) memory[WGT_L0+i]     = ((i*7+3)&32'hFF)<<4;
            // L1, L2 POOL — no weights
            for (i=0; i<L3_WGTS;   i=i+1) memory[WGT_L3+i]     = ((i*11+7)&32'hFF)<<4;
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
            repeat(4) @(posedge clk); rst=0; @(posedge clk);
        end
    endtask

    task automatic do_load_weights;
        integer t;
        begin
            @(posedge clk); load_weights=1;
            @(posedge clk); load_weights=0;
            t=0; while(!weights_loaded && t<2000) begin @(posedge clk); t=t+1; end
        end
    endtask

    task automatic do_inference;
        output integer cycles; integer wd;
        begin
            @(posedge clk); start_inference=1;
            @(posedge clk); start_inference=0;
            cycles=0; wd=0;
            while (!inference_done && wd<EST_LATENCY*10) begin @(posedge clk); cycles=cycles+1; wd=wd+1; end
        end
    endtask

    integer infer_cycles, it, hw_val, gold_val, diff;
    reg [255:0] lname;
    integer tc9_matches, tc9_mismatches, tc9_max_diff;

    localparam integer LAT_LO = $rtoi(EST_LATENCY*(1.0-LATENCY_TOL_PCT/100.0));
    localparam integer LAT_HI = $rtoi(EST_LATENCY*(1.0+LATENCY_TOL_PCT/100.0));

    initial begin
        $display("");
        $display("╔══════════════════════════════════════════════════════╗");
        $display("║   ECG-Net Benchmark  —  Cardiac Anomaly Detection   ║");
        $display("║   CONV(3×3,1→8) → POOL → POOL → FC(24→2)           ║");
        $display("║   Input: 128-sample ECG window → 16×8 reshape       ║");
        $display("╚══════════════════════════════════════════════════════╝");
        $display("   EST_LATENCY = %0d cycles  (fastest benchmark)", EST_LATENCY);

        pass_cnt=0; fail_cnt=0; check_cnt=0;
        $readmemh(`GOLDEN_ECG_PATH, golden);
        init_dram(); do_reset();

        $display("TC1: Reset & ready");
        repeat(2) @(posedge clk);
        chk_true("system_ready", system_ready);
        chk_true("not_done",    !inference_done);

        $display("TC2: Weight loading");
        do_load_weights();
        chk_true("weights_loaded", weights_loaded);

        $display("TC3: Inference latency");
        do_inference(infer_cycles);
        chk_true ("inference_done",   inference_done);
        chk_range("latency_estimate", infer_cycles, LAT_LO, LAT_HI);
        $display("     actual=%0d cycles  (ECG window = %.2f ms @50Hz)",
                 infer_cycles, infer_cycles * 10.0 / 1e6 * 1000);

        $display("TC4: High-throughput stress (%0d inferences)", STRESS_INFERENCES);
        for (it=0; it<STRESS_INFERENCES; it=it+1) begin
            @(posedge system_ready or posedge rst);
            @(posedge clk); start_inference=1;
            @(posedge clk); start_inference=0;
            @(posedge inference_done);
        end
        chk_true("stress_all_complete", inference_done);

        $display("TC5: Per-layer activity");
        do_reset(); do_load_weights();
        for (li=0; li<NUM_LAYERS; li=li+1) layer_edges[li]=0;
        do_inference(infer_cycles);
        for (li=0; li<NUM_LAYERS; li=li+1) begin
            $sformat(lname, "layer_busy[%0d]", li);
            chk_range(lname, layer_edges[li], 1, 1);
        end

        $display("TC6: Classification output check");
        begin
            integer logit_normal, logit_anomaly;
            logit_normal  = $signed(memory[OUTPUT_BASE + 0][15:0]);
            logit_anomaly = $signed(memory[OUTPUT_BASE + 1][15:0]);
            $display("     logit_normal  = %0d", logit_normal);
            $display("     logit_anomaly = %0d", logit_anomaly);
            $display("     HW decision   = %s", (logit_anomaly > logit_normal) ? "ANOMALY" : "NORMAL");
            chk_true("output_valid", logit_normal !== 16'hx && logit_anomaly !== 16'hx);
        end

        $display("TC7: Quiescence");
        repeat(5) @(posedge clk);
        chk_true("system_ready_after_done", system_ready);
        chk_true("pipeline_idle",           !pipeline_active);

        $display("TC8: Reset & rerun");
        do_reset(); do_load_weights(); do_inference(infer_cycles);
        chk_true("rerun_done", inference_done);

        $display("TC9: Golden comparison [normal, anomaly]");
        tc9_matches=0; tc9_mismatches=0; tc9_max_diff=0;
        for (it=0; it<OUTPUT_SIZE; it=it+1) begin
            hw_val  = $signed(memory[OUTPUT_BASE+it][15:0]);
            gold_val= $signed(golden[it]);
            diff    = (hw_val>=gold_val)?(hw_val-gold_val):(gold_val-hw_val);
            if (diff==0) tc9_matches=tc9_matches+1;
            else         tc9_mismatches=tc9_mismatches+1;
            if (diff>tc9_max_diff) tc9_max_diff=diff;
            if (diff>1) $display("     MISMATCH [%s] hw=%0d golden=%0d diff=%0d",
                                  it==0?"normal ":"anomaly", hw_val, gold_val, diff);
        end
        $display("     [normal=%0d, anomaly=%0d]  golden=[%0d, %0d]",
                 $signed(memory[OUTPUT_BASE+0][15:0]),
                 $signed(memory[OUTPUT_BASE+1][15:0]),
                 $signed(golden[0]), $signed(golden[1]));
        chk_eq  ("both_outputs_match", tc9_matches, OUTPUT_SIZE);
        chk_true("max_diff_le_1_lsb",  tc9_max_diff<=1);

        $display("");
        $display("══════════════════════════════════════════════════════");
        $display("  ECG-Net BENCHMARK RESULT:");
        $display("  %0d/%0d PASS  (%0d FAIL)", pass_cnt, check_cnt, fail_cnt);
        $display("  Latency  : %0d cycles = %.1f µs @100MHz",
                 infer_cycles, infer_cycles * 10.0 / 1000.0);
        $display("  Area     : %0d.%0d AU  (smallest footprint)", `DNN_EST_AREA_INTx10/10, `DNN_EST_AREA_INTx10%10);
        $display("  Power    : %0d mW", `DNN_EST_POWER_MWx10/10);
        $display("══════════════════════════════════════════════════════");
        if (fail_cnt==0) $display("  *** ALL PASSED ***");
        else             $display("  *** %0d FAILED ***", fail_cnt);
        $display("");
        $finish;
    end

    initial begin #(EST_LATENCY*CLK_PERIOD*100); $display("TIMEOUT"); $finish; end

endmodule
