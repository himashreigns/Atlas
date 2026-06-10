// =============================================================================
// tb_gesture.v  —  GestureNet Benchmark Testbench
//
// Workload : IMU Gesture Recognizer  (smart-home / industrial IoT)
// Network  : CONV(3×3,1→4) → POOL(2×2) → POOL(2×2) → FC(28→5)
// Input    : 6×32 IMU sensor matrix
//              rows: acc_x, acc_y, acc_z, gyr_x, gyr_y, gyr_z
//              cols: 32 timesteps @50 Hz  (640 ms capture window)
// Output   : 5 gesture logits
//              [swipe-L, swipe-R, push, pull, rest]
//
// The 3×3 CONV kernel spans 3 consecutive axes × 3 consecutive timesteps,
// capturing cross-axis temporal correlation patterns.
//
// Layer shapes:
//   L0 CONV 3×3 1→4  : 6×32   → 4×30×4
//   L1 POOL 2×2       : 4×30×4 → 2×15×4  (floor(4/2)=2, floor(30/2)=15)
//   L2 POOL 2×2       : 2×15×4 → 1×7×4=28 (floor(2/2)=1, floor(15/2)=7)
//   L3 FC 28→5
//
// Test suite  TC1–TC9  with gesture-specific TC6 (argmax classification check).
// Build:
//   iverilog -g2005 -o sim_ges tb_gesture.v <rtl> -I . -I ../../sim
// =============================================================================
`timescale 1ns/1ps
`include "dnn_config_gesture.vh"

`ifndef GOLDEN_GESTURE_PATH
  `define GOLDEN_GESTURE_PATH "golden_gesture_output.memh"
`endif

module tb_gesture;

    localparam CLK_PERIOD           = 10;
    localparam NUM_LAYERS           = `DNN_NUM_LAYERS;
    localparam N_DUT                = `DNN_STAGE0_N;      // 8
    localparam DATA_W               = 16;
    localparam ACC_W                = 32;
    localparam ADDR_W               = 10;
    localparam MEM_ADDR_W           = 20;
    localparam MEM_DATA_W           = 32;
    localparam EST_LATENCY          = `DNN_EST_LATENCY_CYCLES;  // 1135
    localparam real LATENCY_TOL_PCT = 30.0;
    localparam STRESS_INFERENCES    = 4;

    localparam INPUT_SIZE           = `GES_INPUT_SIZE;   // 192
    localparam OUTPUT_SIZE          = `GES_OUTPUT_SIZE;  // 5
    localparam L0_WGTS              = `GES_L0_WGTS;      // 36
    localparam L3_WGTS              = `GES_L3_WGTS;      // 140

    localparam [MEM_ADDR_W-1:0] INPUT_BASE  = 20'h00000;
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE = 20'h10000;
    localparam [MEM_ADDR_W-1:0] WGT_L0      = `GES_WGT_BASE_L0;
    localparam [MEM_ADDR_W-1:0] WGT_L1      = `GES_WGT_BASE_L1;
    localparam [MEM_ADDR_W-1:0] WGT_L2      = `GES_WGT_BASE_L2;
    localparam [MEM_ADDR_W-1:0] WGT_L3      = `GES_WGT_BASE_L3;

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
            // 6×32 = 192 IMU samples stored as Q8.8
            for (i=0; i<INPUT_SIZE; i=i+1) memory[INPUT_BASE+i] = (i%256)<<8;
            // L0 CONV weights  (3×3×1×4 = 36)
            for (i=0; i<L0_WGTS;   i=i+1) memory[WGT_L0+i]     = ((i*7+3)&32'hFF)<<4;
            // L1, L2 POOL — no weights
            // L3 FC weights  (28×5 = 140)
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

    // Helper: return name of gesture class i
    function [63:0] gesture_name;
        input integer idx;
        begin
            case (idx)
                0: gesture_name = "swipe-L ";
                1: gesture_name = "swipe-R ";
                2: gesture_name = "push    ";
                3: gesture_name = "pull    ";
                4: gesture_name = "rest    ";
                default: gesture_name = "unknown ";
            endcase
        end
    endfunction

    // argmax over 5 output logits
    function integer argmax5;
        input integer v0, v1, v2, v3, v4;
        integer best_idx, best_val, g;
        begin
            best_val = v0; best_idx = 0;
            if (v1 > best_val) begin best_val=v1; best_idx=1; end
            if (v2 > best_val) begin best_val=v2; best_idx=2; end
            if (v3 > best_val) begin best_val=v3; best_idx=3; end
            if (v4 > best_val) begin best_val=v4; best_idx=4; end
            argmax5 = best_idx;
        end
    endfunction

    integer infer_cycles, it, hw_val, gold_val, diff;
    reg [255:0] lname;
    integer tc9_matches, tc9_mismatches, tc9_max_diff;
    integer pred_class;

    localparam integer LAT_LO = $rtoi(EST_LATENCY*(1.0-LATENCY_TOL_PCT/100.0));
    localparam integer LAT_HI = $rtoi(EST_LATENCY*(1.0+LATENCY_TOL_PCT/100.0));

    initial begin
        $display("");
        $display("╔══════════════════════════════════════════════════════╗");
        $display("║   GestureNet Benchmark  —  IMU Gesture Recognition  ║");
        $display("║   CONV(3×3,1→4) → POOL → POOL → FC(28→5)           ║");
        $display("║   Input: 6 IMU axes × 32 timesteps (640 ms @50 Hz) ║");
        $display("╚══════════════════════════════════════════════════════╝");
        $display("   EST_LATENCY = %0d cycles", EST_LATENCY);

        pass_cnt=0; fail_cnt=0; check_cnt=0;
        $readmemh(`GOLDEN_GESTURE_PATH, golden);
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
        $display("     actual=%0d cycles = %.1f µs @100MHz",
                 infer_cycles, infer_cycles * 10.0 / 1000.0);

        $display("TC4: Back-to-back throughput (%0d)", STRESS_INFERENCES);
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
            $sformat(lname, "layer_busy[%0d]", li);
            chk_range(lname, layer_edges[li], 1, 1);
        end

        $display("TC6: Gesture classification output");
        begin
            integer l0,l1,l2,l3,l4;
            l0 = $signed(memory[OUTPUT_BASE+0][15:0]);
            l1 = $signed(memory[OUTPUT_BASE+1][15:0]);
            l2 = $signed(memory[OUTPUT_BASE+2][15:0]);
            l3 = $signed(memory[OUTPUT_BASE+3][15:0]);
            l4 = $signed(memory[OUTPUT_BASE+4][15:0]);
            pred_class = argmax5(l0,l1,l2,l3,l4);
            $display("     logits: swipe-L=%0d swipe-R=%0d push=%0d pull=%0d rest=%0d",
                     l0,l1,l2,l3,l4);
            $display("     HW predicted gesture: %0s (class %0d)", gesture_name(pred_class), pred_class);
            chk_true("logit_not_allzero", l0|l1|l2|l3|l4);
        end

        $display("TC7: Quiescence");
        repeat(5) @(posedge clk);
        chk_true("system_ready_after_done", system_ready);
        chk_true("pipeline_idle",           !pipeline_active);

        $display("TC8: Reset & rerun");
        do_reset(); do_load_weights(); do_inference(infer_cycles);
        chk_true("rerun_done", inference_done);
        // Verify classification is reproducible
        begin
            integer l0r, l1r, l2r, l3r, l4r, pred_r;
            l0r=$signed(memory[OUTPUT_BASE+0][15:0]);
            l1r=$signed(memory[OUTPUT_BASE+1][15:0]);
            l2r=$signed(memory[OUTPUT_BASE+2][15:0]);
            l3r=$signed(memory[OUTPUT_BASE+3][15:0]);
            l4r=$signed(memory[OUTPUT_BASE+4][15:0]);
            pred_r = argmax5(l0r,l1r,l2r,l3r,l4r);
            chk_eq("rerun_same_classification", pred_r, pred_class);
        end

        $display("TC9: Golden comparison [5 gesture logits]");
        tc9_matches=0; tc9_mismatches=0; tc9_max_diff=0;
        for (it=0; it<OUTPUT_SIZE; it=it+1) begin
            hw_val  = $signed(memory[OUTPUT_BASE+it][15:0]);
            gold_val= $signed(golden[it]);
            diff    = (hw_val>=gold_val)?(hw_val-gold_val):(gold_val-hw_val);
            if (diff==0) tc9_matches=tc9_matches+1;
            else         tc9_mismatches=tc9_mismatches+1;
            if (diff>tc9_max_diff) tc9_max_diff=diff;
            if (diff>1) $display("     MISMATCH [%0s] hw=%0d golden=%0d diff=%0d",
                                  gesture_name(it), hw_val, gold_val, diff);
        end
        $display("     HW     : [%0d, %0d, %0d, %0d, %0d]",
                 $signed(memory[OUTPUT_BASE+0][15:0]), $signed(memory[OUTPUT_BASE+1][15:0]),
                 $signed(memory[OUTPUT_BASE+2][15:0]), $signed(memory[OUTPUT_BASE+3][15:0]),
                 $signed(memory[OUTPUT_BASE+4][15:0]));
        $display("     Golden : [%0d, %0d, %0d, %0d, %0d]",
                 $signed(golden[0]), $signed(golden[1]), $signed(golden[2]),
                 $signed(golden[3]), $signed(golden[4]));
        chk_eq  ("all_5_logits_match", tc9_matches, OUTPUT_SIZE);
        chk_true ("max_diff_le_1_lsb", tc9_max_diff<=1);

        $display("");
        $display("══════════════════════════════════════════════════════");
        $display("  GestureNet BENCHMARK RESULT:");
        $display("  %0d/%0d PASS  (%0d FAIL)", pass_cnt, check_cnt, fail_cnt);
        $display("  Latency  : %0d cycles = %.1f µs  (real-time: %.0f fps)",
                 infer_cycles, infer_cycles*10.0/1000.0,
                 1e9/(infer_cycles*10.0));
        $display("  Area     : %0d.%0d AU", `DNN_EST_AREA_INTx10/10, `DNN_EST_AREA_INTx10%10);
        $display("  Power    : %0d mW", `DNN_EST_POWER_MWx10/10);
        $display("══════════════════════════════════════════════════════");
        if (fail_cnt==0) $display("  *** ALL PASSED ***");
        else             $display("  *** %0d FAILED ***", fail_cnt);
        $display("");
        $finish;
    end

    initial begin #(EST_LATENCY*CLK_PERIOD*100); $display("TIMEOUT"); $finish; end

endmodule
