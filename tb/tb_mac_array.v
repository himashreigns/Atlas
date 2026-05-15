// =============================================================================
// Testbench : tb_mac_array.v
// DUT       : mac_array  (N=8, DATA_W=16, ACC_W=32)
// Matched to: mac_stage.v  —  UNSIGNED multiply  (assign mult = a_in * w_in)
//
// Architecture note
// -----------------
// This is a STREAMING ACCUMULATOR pipeline.
// A single beat (a,w) enters stage 0 and propagates through all N stages.
// Each stage computes:  psum_out[i] = psum_in[i] + (a * w)
// So a single beat accumulates once per stage:
//   psum_out (after full traversal) = N * (a * w)
//
// Pipeline latency: psum_out is valid N-1 cycles after the beat is cleared
// (i.e. N clock edges after the beat was driven).
//
// Test Cases
//  TC1  Zero inputs               → psum_out = 0
//  TC2  Single beat a=3, w=4      → psum_out = N*12 = 96
//  TC3  Constant N-beat stream    → psum_out = N*(a*w) during steady state
//  TC4  Larger unsigned values    → psum_out = N * (a * w)
//  TC5  Max 16-bit unsigned w=1   → psum_out = N * 65535  (no 32-bit overflow)
//  TC6  Reset mid-stream          → psum_out = 0 during & after reset
//  TC7  Back-to-back N+2 beats    → psum_out = N in steady-state window
// =============================================================================

`timescale 1ns/1ps

module tb_mac_array;

    // ------------------------------------------------------------------ params
    localparam N      = 8;
    localparam DATA_W = 16;
    localparam ACC_W  = 32;
    localparam CLK_P  = 10;   // 10 ns → 100 MHz

    // ------------------------------------------------------------------ DUT I/O
    reg                  clk;
    reg                  rst;
    reg  [DATA_W-1:0]    a_in;
    reg  [DATA_W-1:0]    w_in;
    wire [ACC_W-1:0]     psum_out;

    // ------------------------------------------------------------------ DUT
    mac_array #(
        .N      (N),
        .DATA_W (DATA_W),
        .ACC_W  (ACC_W)
    ) dut (
        .clk      (clk),
        .rst      (rst),
        .a_in     (a_in),
        .w_in     (w_in),
        .psum_out (psum_out)
    );

    // ------------------------------------------------------------------ clock
    initial clk = 0;
    always #(CLK_P/2) clk = ~clk;

    // ------------------------------------------------------------------ counters
    integer pass_cnt = 0;
    integer fail_cnt = 0;

    // ------------------------------------------------------------------ tasks

    // Assert reset for 4 cycles then release
    task apply_reset;
        begin
            rst  = 1;
            a_in = 0;
            w_in = 0;
            repeat (4) @(posedge clk);
            #1;
            rst = 0;
        end
    endtask

    // Drive one beat, zero inputs, then wait N-1 more cycles.
    // Sample point: the beat has traversed all N stages.
    // Expected after call: psum_out = N * (a_val * w_val)
    task drive_single_beat;
        input [DATA_W-1:0] a_val;
        input [DATA_W-1:0] w_val;
        begin
            @(posedge clk); #1;
            a_in = a_val;
            w_in = w_val;
            @(posedge clk); #1;          // beat registered into stage 0
            a_in = 0;
            w_in = 0;
            repeat (N-1) @(posedge clk); // N-1 more edges to reach stage N output
            #1;
            // psum_out is valid here
        end
    endtask

    // Drive cnt identical beats; sample during steady-state (pipeline full).
    // Expected at sample: psum_out = N * (a_val * w_val)
    task drive_stream_sample;
        input [DATA_W-1:0] a_val;
        input [DATA_W-1:0] w_val;
        input integer       cnt;
        integer k;
        begin
            for (k = 0; k < cnt; k = k + 1) begin
                @(posedge clk); #1;
                a_in = a_val;
                w_in = w_val;
            end
            // Keep driving one extra beat then sample before zeroing inputs
            @(posedge clk); #1;
            // psum_out is at steady-state here (pipeline fully loaded)
        end
    endtask

    // Compare and report
    task check;
        input [ACC_W-1:0]  got;
        input [ACC_W-1:0]  expected;
        input [8*26-1:0]   test_name;
        begin
            if (got === expected) begin
                $display("  PASS | %-26s | got=0x%08X (%0d)",
                         test_name, got, got);
                pass_cnt = pass_cnt + 1;
            end else begin
                $display("  FAIL | %-26s | got=0x%08X (%0d)  expected=0x%08X (%0d)",
                         test_name, got, got, expected, expected);
                fail_cnt = fail_cnt + 1;
            end
        end
    endtask

    // ================================================================== tests
    initial begin
        $dumpfile("tb_mac_array.vcd");
        $dumpvars(0, tb_mac_array);

        $display("=================================================");
        $display("  mac_array Unit Test");
        $display("  N=%0d  DATA_W=%0d  ACC_W=%0d  multiply=UNSIGNED",
                 N, DATA_W, ACC_W);
        $display("  Single beat: psum_out = N * (a * w) = %0d * (a*w)", N);
        $display("=================================================");

        // ------------------------------------------------------------------
        // TC1 : Zero inputs
        // 0 * 0 = 0 at every stage; psum_out must be 0
        // ------------------------------------------------------------------
        $display("\n--- TC1 : Zero inputs ---");
        apply_reset;
        drive_single_beat(16'd0, 16'd0);
        check(psum_out, 32'd0, "TC1_zero_inputs");

        // ------------------------------------------------------------------
        // TC2 : Single beat small values
        //   a=3, w=4 → product=12 per stage × N stages = 96
        // ------------------------------------------------------------------
        $display("\n--- TC2 : Single beat a=3 w=4 ---");
        apply_reset;
        drive_single_beat(16'd3, 16'd4);
        check(psum_out, N * 32'd12, "TC2_single_beat");          // 96

        // ------------------------------------------------------------------
        // TC3 : Constant N-beat stream, sampled during steady state
        //   a=2, w=5 → product=10; all N pipeline stages hold 10
        //   psum_out during stream = N * 10 = 80
        // ------------------------------------------------------------------
        $display("\n--- TC3 : N-beat stream a=2 w=5 ---");
        apply_reset;
        drive_stream_sample(16'd2, 16'd5, N);
        check(psum_out, N * 32'd10, "TC3_steady_state");         // 80
        // drain pipeline before next test
        a_in = 0; w_in = 0;
        repeat (N+2) @(posedge clk); #1;

        // ------------------------------------------------------------------
        // TC4 : Larger unsigned values
        //   a=100, w=7 → product=700; single beat → N*700 = 5600
        // ------------------------------------------------------------------
        $display("\n--- TC4 : Single beat a=100 w=7 ---");
        apply_reset;
        drive_single_beat(16'd100, 16'd7);
        check(psum_out, N * 32'd700, "TC4_larger_values");       // 5600

        // ------------------------------------------------------------------
        // TC5 : Max 16-bit unsigned input, w=1 to avoid 32-bit overflow
        //   a=0xFFFF (65535), w=1 → product=65535; single beat → N*65535=524280
        //   0x0007_FFF8 — checks full accumulator width
        // ------------------------------------------------------------------
        $display("\n--- TC5 : Max 16-bit a=0xFFFF w=1 ---");
        apply_reset;
        drive_single_beat(16'hFFFF, 16'h0001);
        check(psum_out, N * 32'd65535, "TC5_max_16bit_unsigned"); // 524280

        // ------------------------------------------------------------------
        // TC6 : Reset mid-stream
        //   Feed data for 3 cycles, then assert rst.
        //   During reset: psum_out must be 0.
        //   After reset + idle: psum_out must stay 0.
        // ------------------------------------------------------------------
        $display("\n--- TC6 : Reset mid-stream ---");
        rst = 0; a_in = 16'd10; w_in = 16'd10;
        repeat (3) @(posedge clk);
        rst = 1;                         // assert reset with data in pipeline
        repeat (2) @(posedge clk); #1;
        check(psum_out, 32'd0, "TC6_during_reset");
        rst = 0; a_in = 0; w_in = 0;    // release reset, idle inputs
        repeat (N+2) @(posedge clk); #1;
        check(psum_out, 32'd0, "TC6_after_reset_idle");

        // ------------------------------------------------------------------
        // TC7 : Back-to-back beats, steady-state check
        //   N+2 consecutive beats of (a=1, w=1).
        //   Once the pipeline is full (after N beats), all N stages hold
        //   product=1, so psum_out = N = 8. Sampled while stream is active.
        // ------------------------------------------------------------------
        $display("\n--- TC7 : Back-to-back beats steady state ---");
        apply_reset;
        begin : TC7
            integer j;
            for (j = 0; j < N+2; j = j + 1) begin
                @(posedge clk); #1;
                a_in = 16'd1;
                w_in = 16'd1;
            end
            // Pipeline is fully loaded: sample during active stream
            #1;
            check(psum_out, N, "TC7_steady_state");              // 8
            a_in = 0; w_in = 0;
            repeat (N+2) @(posedge clk); #1;
        end

        // ------------------------------------------------------------------
        // Summary
        // ------------------------------------------------------------------
        $display("\n=================================================");
        $display("  Results:  PASS=%0d  FAIL=%0d  TOTAL=%0d",
                 pass_cnt, fail_cnt, pass_cnt + fail_cnt);
        $display("=================================================\n");

        if (fail_cnt == 0)
            $display("  >> ALL TESTS PASSED <<\n");
        else
            $display("  >> %0d TEST(S) FAILED — open tb_mac_array.vcd <<\n",
                     fail_cnt);

        $finish;
    end

    // ------------------------------------------------------------------ guard
    initial begin
        #500000;
        $display("TIMEOUT: simulation exceeded time limit");
        $finish;
    end

endmodule
