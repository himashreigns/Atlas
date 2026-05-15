`timescale 1ns/1ps
module tb_mac_array_stage_with_bram;

    // -------------------------------------------------------------------------
    // Parameters
    // -------------------------------------------------------------------------
    parameter CLK_PERIOD       = 10;
    parameter N                = 4;
    parameter DATA_W           = 16;
    parameter ACC_W            = 32;
    parameter ADDR_W           = 10;
    parameter KERNEL_ROWS      = 3;
    parameter NEXT_KERNEL_ROWS = 3;

    // [$clog2(1024):0] = [10:0] = 11 bits
    localparam ROWS_W = 11;

    // -------------------------------------------------------------------------
    // DUT signals
    // -------------------------------------------------------------------------
    reg clk, rst;
    reg [ROWS_W-1:0] in_rows_buffered;
    reg [ROWS_W-1:0] out_rows_produced;

    reg              act_we;
    reg [ADDR_W-1:0] act_waddr;
    reg [DATA_W-1:0] act_wdata;
    reg              act_re;
    reg [ADDR_W-1:0] act_raddr;
    wire[DATA_W-1:0] act_rdata;

    reg              wgt_we;
    reg [ADDR_W-1:0] wgt_waddr;
    reg [DATA_W-1:0] wgt_wdata;
    reg              wgt_re;
    reg [ADDR_W-1:0] wgt_raddr;
    wire[DATA_W-1:0] wgt_rdata;

    reg              out_we;
    reg [ADDR_W-1:0] out_waddr;
    reg              out_re;
    reg [ADDR_W-1:0] out_raddr;
    wire[ACC_W-1:0]  out_rdata;

    integer errors;
    integer i;

    // -------------------------------------------------------------------------
    // DUT instantiation
    // -------------------------------------------------------------------------
    mac_array_stage_with_bram #(
        .N               (N),
        .DATA_W          (DATA_W),
        .ACC_W           (ACC_W),
        .ADDR_W          (ADDR_W),
        .KERNEL_ROWS     (KERNEL_ROWS),
        .NEXT_KERNEL_ROWS(NEXT_KERNEL_ROWS)
    ) dut (
        .clk               (clk),
        .rst               (rst),
        .in_rows_buffered  (in_rows_buffered),
        .out_rows_produced (out_rows_produced),
        .act_we            (act_we),   .act_waddr (act_waddr), .act_wdata (act_wdata),
        .act_re            (act_re),   .act_raddr (act_raddr), .act_rdata (act_rdata),
        .wgt_we            (wgt_we),   .wgt_waddr (wgt_waddr), .wgt_wdata (wgt_wdata),
        .wgt_re            (wgt_re),   .wgt_raddr (wgt_raddr), .wgt_rdata (wgt_rdata),
        .out_we            (out_we),   .out_waddr (out_waddr),
        .out_re            (out_re),   .out_raddr (out_raddr), .out_rdata (out_rdata)
    );

    // -------------------------------------------------------------------------
    // Clock
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // -------------------------------------------------------------------------
    // Stimulus
    //
    // Pipeline depth (addr driven → mac_psum valid):
    //
    //   +1 cycle: BRAM read register  (act_rdata_r <= act_mem[raddr])
    //   +1 cycle: activation register (act_reg     <= act_rdata_r)
    //   +1 cycle: MAC product stage   (prod[0]     <= act_reg * wgt_reg)
    //
    //   Total: 3 cycles per element.  For N=4 elements driven at C0..C3,
    //   the last product lands in prod[0] at C6, so psum_out is the correct
    //   N-element dot product at C6 (combinational output of the prod[]
    //   shift register).  Asserting out_we between C6 and C7 causes the
    //   posedge C7 to write that value into out_mem.
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("tb_mac_array_stage_with_bram.vcd");
        $dumpvars(0, tb_mac_array_stage_with_bram);

        rst              = 1;
        in_rows_buffered = 0;
        out_rows_produced= 0;
        act_we = 0; act_re = 0; act_waddr = 0; act_raddr = 0; act_wdata = 0;
        wgt_we = 0; wgt_re = 0; wgt_waddr = 0; wgt_raddr = 0; wgt_wdata = 0;
        out_we = 0; out_re = 0; out_waddr = 0; out_raddr = 0;
        errors = 0;

        repeat(5) @(posedge clk);
        @(posedge clk); rst = 0;
        @(posedge clk); #1;

        // =================================================================
        // TEST 1: N-element dot product
        //   a = [1, 2, 3, 4]   w = [5, 6, 7, 8]
        //   products = [5, 12, 21, 32]   expected sum = 70
        // =================================================================

        // --- Phase 1: load BRAMs ---
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1;
            act_we = 1; act_waddr = i; act_wdata = i + 1;  // 1,2,3,4
            wgt_we = 1; wgt_waddr = i; wgt_wdata = i + 5;  // 5,6,7,8
        end
        @(posedge clk); #1;
        act_we = 0; wgt_we = 0;

        // --- Phase 2: enable compute and output ---
        in_rows_buffered  = KERNEL_ROWS;       // compute_enable = 1
        out_rows_produced = NEXT_KERNEL_ROWS;  // output_enable  = 1

        // --- Phase 3: stream N read addresses (one per cycle) ---
        act_re = 1; wgt_re = 1;
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1;
            act_raddr = i;
            wgt_raddr = i;
        end

        // Flush the 3-stage pipeline (BRAM reg → act_reg → MAC prod[0])
        repeat(3) @(posedge clk);

        // --- Phase 4: capture mac_psum into output BRAM ---
        // psum_out is now 70 (combinational). The next posedge will write it.
        #1;
        act_re = 0; wgt_re = 0;
        out_we = 1; out_waddr = 0;
        @(posedge clk); #1;   // writes out_mem[0] = 70
        out_we = 0;

        // --- Phase 5: read back and check ---
        out_re = 1; out_raddr = 0;
        @(posedge clk); #1;   // out_rdata_r = out_mem[0]
        out_re = 0;
        @(posedge clk); #1;   // stable

        if (out_rdata !== 32'd70) begin
            $display("TEST1 ERROR: expected=70  got=%0d  (0x%08h)", out_rdata, out_rdata);
            errors = errors + 1;
        end else begin
            $display("TEST1 OK: dot product = %0d", out_rdata);
        end

        // =================================================================
        // TEST 2: compute_enable = 0 blocks BRAM write
        //   Disable compute, re-run the same pipeline, attempt to overwrite
        //   out_mem[0].  The value must remain 70 because the write guard
        //   is (out_we && compute_enable).
        // =================================================================
        in_rows_buffered = 0;  // compute_enable = 0
        @(posedge clk); #1;

        act_re = 1; wgt_re = 1;
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1;
            act_raddr = i;
            wgt_raddr = i;
        end
        repeat(3) @(posedge clk);
        #1;
        act_re = 0; wgt_re = 0;
        out_we = 1; out_waddr = 0;   // attempt overwrite — should be blocked
        @(posedge clk); #1;
        out_we = 0;

        out_re = 1; out_raddr = 0;
        @(posedge clk); #1;
        out_re = 0;
        @(posedge clk); #1;

        if (out_rdata !== 32'd70) begin
            $display("TEST2 ERROR: write should be blocked, expected=70  got=%0d", out_rdata);
            errors = errors + 1;
        end else begin
            $display("TEST2 OK: compute_enable=0 correctly blocked write, value still 70");
        end

        // =================================================================
        // TEST 3: second dot product at a different output address
        //   Re-enable compute, change weights to [1,1,1,1],
        //   activations stay [1,2,3,4] → expected sum = 1+2+3+4 = 10
        // =================================================================
        in_rows_buffered = KERNEL_ROWS;
        @(posedge clk); #1;

        // Overwrite weights to [1,1,1,1]
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1;
            wgt_we = 1; wgt_waddr = i; wgt_wdata = 1;
        end
        @(posedge clk); #1;
        wgt_we = 0;

        // Reset mac_array product history by toggling rst for 1 cycle
        rst = 1;
        @(posedge clk); #1;
        rst = 0;

        act_re = 1; wgt_re = 1;
        for (i = 0; i < N; i = i + 1) begin
            @(posedge clk); #1;
            act_raddr = i;
            wgt_raddr = i;
        end
        repeat(3) @(posedge clk);
        #1;
        act_re = 0; wgt_re = 0;
        out_we = 1; out_waddr = 1;   // write to address 1
        @(posedge clk); #1;
        out_we = 0;

        out_re = 1; out_raddr = 1;
        @(posedge clk); #1;
        out_re = 0;
        @(posedge clk); #1;

        if (out_rdata !== 32'd10) begin
            $display("TEST3 ERROR: expected=10  got=%0d  (0x%08h)", out_rdata, out_rdata);
            errors = errors + 1;
        end else begin
            $display("TEST3 OK: second dot product = %0d", out_rdata);
        end

        // =================================================================
        // Verdict
        // =================================================================
        if (errors == 0)
            $display("PASS: mac_array_stage_with_bram tests completed successfully.");
        else
            $display("FAIL: %0d error(s) found.", errors);

        $finish;
    end

endmodule
