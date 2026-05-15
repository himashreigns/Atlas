`timescale 1ns/1ps

module tb_nn_layer_control_unit;

    // DUT parameters
    parameter ADDR_W       = 10;
    parameter DATA_W       = 16;
    parameter ACC_W        = 32;
    parameter MAX_IMG_SIZE = 32;
    parameter MAX_KERNEL   = 5;
    parameter MAX_CHANNELS = 16;
    parameter MAX_FILTERS  = 16;

    // Clock and reset
    reg clk, rst;

    // DUT inputs
    reg [1:0]  mode;
    reg        start;
    reg [7:0]  img_rows, img_cols;
    reg [7:0]  kernel_size, stride, padding;
    reg [7:0]  in_channels, out_channels;
    reg [7:0]  pool_size;
    reg [15:0] fc_input_size, fc_output_size;

    // DUT outputs
    wire        done, busy;
    wire        act_we, act_re;
    wire [ADDR_W-1:0] act_waddr, act_raddr;
    wire        wgt_we, wgt_re;
    wire [ADDR_W-1:0] wgt_waddr, wgt_raddr;
    wire        out_we, out_re;
    wire [ADDR_W-1:0] out_waddr, out_raddr;
    wire [10:0] in_rows_buffered;
    wire [10:0] out_rows_produced;

    // Instantiate DUT
    nn_layer_control_unit #(
        .ADDR_W      (ADDR_W),
        .DATA_W      (DATA_W),
        .ACC_W       (ACC_W),
        .MAX_IMG_SIZE(MAX_IMG_SIZE),
        .MAX_KERNEL  (MAX_KERNEL),
        .MAX_CHANNELS(MAX_CHANNELS),
        .MAX_FILTERS (MAX_FILTERS)
    ) dut (
        .clk            (clk),
        .rst            (rst),
        .mode           (mode),
        .start          (start),
        .done           (done),
        .busy           (busy),
        .img_rows       (img_rows),
        .img_cols       (img_cols),
        .kernel_size    (kernel_size),
        .stride         (stride),
        .padding        (padding),
        .in_channels    (in_channels),
        .out_channels   (out_channels),
        .pool_size      (pool_size),
        .fc_input_size  (fc_input_size),
        .fc_output_size (fc_output_size),
        .act_we         (act_we),
        .act_waddr      (act_waddr),
        .act_re         (act_re),
        .act_raddr      (act_raddr),
        .wgt_we         (wgt_we),
        .wgt_waddr      (wgt_waddr),
        .wgt_re         (wgt_re),
        .wgt_raddr      (wgt_raddr),
        .out_we         (out_we),
        .out_waddr      (out_waddr),
        .out_re         (out_re),
        .out_raddr      (out_raddr),
        .in_rows_buffered(in_rows_buffered),
        .out_rows_produced(out_rows_produced)
    );

    // 10 ns period clock
    initial clk = 0;
    always #5 clk = ~clk;

    // Test tracking
    integer pass_count, fail_count;

    task check;
        input [127:0] name;
        input [31:0]  got;
        input [31:0]  expected;
        begin
            if (got === expected) begin
                $display("PASS  %0s  got=%0d", name, got);
                pass_count = pass_count + 1;
            end else begin
                $display("FAIL  %0s  got=%0d  expected=%0d", name, got, expected);
                fail_count = fail_count + 1;
            end
        end
    endtask

    // Apply reset, deassert, wait idle
    task do_reset;
        begin
            rst   = 1;
            start = 0;
            @(negedge clk); @(negedge clk);
            rst = 0;
            @(negedge clk);
        end
    endtask

    // Pulse start for one cycle (negedge-aligned), then wait for done
    task run_and_wait;
        integer timeout;
        begin
            @(negedge clk); start = 1;
            @(negedge clk); start = 0;
            // wait for done pulse
            timeout = 0;
            @(posedge clk); #1;
            while (!done && timeout < 5000) begin
                @(posedge clk); #1;
                timeout = timeout + 1;
            end
            if (timeout >= 5000)
                $display("TIMEOUT waiting for done");
        end
    endtask

    // =========================================================================
    // MAIN TEST SEQUENCE
    // =========================================================================
    integer i;

    initial begin
        pass_count = 0;
        fail_count = 0;

        // Default inputs
        mode         = 2'b00;
        start        = 0;
        img_rows     = 0; img_cols = 0;
        kernel_size  = 0; stride = 1; padding = 0;
        in_channels  = 0; out_channels = 0;
        pool_size    = 0;
        fc_input_size  = 0;
        fc_output_size = 0;

        // -----------------------------------------------------------------
        // TC1: Reset check
        // -----------------------------------------------------------------
        rst = 1;
        @(negedge clk); @(negedge clk);
        #1;
        check("TC1_busy",             busy,             0);
        check("TC1_done",             done,             0);
        check("TC1_act_re",           act_re,           0);
        check("TC1_wgt_re",           wgt_re,           0);
        check("TC1_out_we",           out_we,           0);
        check("TC1_in_rows_buffered", in_rows_buffered, 0);
        check("TC1_out_rows_produced",out_rows_produced,0);
        rst = 0;
        @(negedge clk);

        // -----------------------------------------------------------------
        // TC2-TC8: CONV 3×3 input, 1×1 kernel, stride=1, pad=0,
        //          1 input channel, 1 output channel  -> out=3×3=9 cycles
        // -----------------------------------------------------------------
        mode        = 2'b00;
        img_rows    = 8'd3;  img_cols   = 8'd3;
        kernel_size = 8'd1;  stride     = 8'd1;
        padding     = 8'd0;
        in_channels = 8'd1;  out_channels = 8'd1;

        @(negedge clk); start = 1;
        @(negedge clk); start = 0;

        // After start: IDLE→LOAD_WGT at next posedge, then LOAD_WGT→COMPUTE
        // Check busy immediately after start posedge
        @(posedge clk); #1;
        check("TC2_busy_after_start", busy, 1);
        check("TC2_in_rows_buffered", in_rows_buffered, 1); // = kernel_size=1

        // LOAD_WGT takes 2 cycles for CONV/FC: cycle 1 sets wgt_loading_done=1,
        // cycle 2 detects it and transitions; COMPUTE runs on cycle 3.
        @(posedge clk); #1; // LOAD_WGT cycle 1
        @(posedge clk); #1; // LOAD_WGT cycle 2 -> COMPUTE; first COMPUTE cycle

        // COMPUTE clock 1: kc=0,kr=0,ch_in=0,col=0,row=0,ch_out=0
        // act_raddr = (0*1+0)*3 + (0*1+0) + 0*3*3 = 0
        // wgt_raddr = 0*1*1*1 + 0*1*1 + 0*1 + 0 = 0
        // out_waddr = 0*3*3 + 0*3 + 0 = 0
        check("TC3_act_re",    act_re,   1);
        check("TC3_wgt_re",    wgt_re,   1);
        check("TC3_out_we",    out_we,   1);
        check("TC3_act_raddr", act_raddr, 0);
        check("TC3_wgt_raddr", wgt_raddr, 0);
        check("TC3_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 2: col advanced to 1
        // act_raddr = 0*3 + 1 + 0 = 1
        // wgt_raddr = 0
        // out_waddr = 0*9 + 0*3 + 1 = 1
        check("TC4_act_raddr", act_raddr, 1);
        check("TC4_wgt_raddr", wgt_raddr, 0);
        check("TC4_out_waddr", out_waddr, 1);

        @(posedge clk); #1; // COMPUTE clock 3: col was 1 -> goes to 2
        // act_raddr = 0*3 + 2 + 0 = 2
        // out_waddr = 2
        check("TC5_act_raddr", act_raddr, 2);
        check("TC5_out_waddr", out_waddr, 2);

        // Wait for done
        @(posedge clk); #1;
        while (!done) begin
            @(posedge clk); #1;
        end
        check("TC6_out_rows_produced_nonzero", (out_rows_produced > 0), 1);
        check("TC7_done",  done, 1);
        check("TC8_busy",  busy, 0);

        // -----------------------------------------------------------------
        // TC9-TC13: FC  fc_input_size=2, fc_output_size=2
        // -----------------------------------------------------------------
        do_reset;
        mode           = 2'b01;
        fc_input_size  = 16'd2;
        fc_output_size = 16'd2;

        @(negedge clk); start = 1;
        @(negedge clk); start = 0;

        @(posedge clk); #1;
        check("TC9_fc_busy", busy, 1);

        // LOAD_WGT takes 2 cycles for FC mode (same as CONV)
        @(posedge clk); #1;
        @(posedge clk); #1;

        // COMPUTE clock 1: fc_in=0, fc_out=0
        // act_raddr = 0 & mask = 0
        // wgt_raddr = 0*2+0 = 0
        // out_waddr = 0
        check("TC10_fc_act_re",    act_re,   1);
        check("TC10_fc_wgt_re",    wgt_re,   1);
        check("TC10_fc_out_we",    out_we,   1);
        check("TC10_fc_act_raddr", act_raddr, 0);
        check("TC10_fc_wgt_raddr", wgt_raddr, 0);
        check("TC10_fc_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 2: fc_in advanced to 1
        // act_raddr = 1
        // wgt_raddr = 0*2+1 = 1
        // out_waddr = 0
        check("TC11_fc_act_raddr", act_raddr, 1);
        check("TC11_fc_wgt_raddr", wgt_raddr, 1);
        check("TC11_fc_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 3: fc_in->0, fc_out->1
        // act_raddr = 0
        // wgt_raddr = 1*2+0 = 2
        // out_waddr = 1
        check("TC12_fc_act_raddr", act_raddr, 0);
        check("TC12_fc_wgt_raddr", wgt_raddr, 2);
        check("TC12_fc_out_waddr", out_waddr, 1);

        // Wait for done
        @(posedge clk); #1;
        while (!done) begin
            @(posedge clk); #1;
        end
        check("TC13_fc_done", done, 1);

        // -----------------------------------------------------------------
        // TC14-TC18: POOL  4×4 input, pool_size=2, 1 channel -> out=2×2
        // -----------------------------------------------------------------
        do_reset;
        mode        = 2'b10;
        img_rows    = 8'd4; img_cols  = 8'd4;
        pool_size   = 8'd2;
        in_channels = 8'd1;

        @(negedge clk); start = 1;
        @(negedge clk); start = 0;

        @(posedge clk); #1;
        check("TC14_pool_busy", busy, 1);

        // POOL skips LOAD_WGT immediately -> COMPUTE after 1 cycle
        @(posedge clk); #1; // COMPUTE clock 1: all counters = 0
        // act_raddr = 0*4*4 + (0*2+0)*4 + (0*2+0) = 0
        // out_waddr = 0*2*2 + 0*2 + 0 = 0
        check("TC15_pool_act_re",    act_re,   1);
        check("TC15_pool_wgt_re",    wgt_re,   0); // pooling doesn't use weights
        check("TC15_pool_out_we",    out_we,   1);
        check("TC15_pool_act_raddr", act_raddr, 0);
        check("TC15_pool_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 2: pool_col advanced to 1
        // act_raddr = 0*16 + (0*2+0)*4 + (0*2+1) = 1
        check("TC16_pool_act_raddr", act_raddr, 1);
        check("TC16_pool_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 3: pool_col->0, pool_row->1
        // act_raddr = 0*16 + (0*2+1)*4 + (0*2+0) = 4
        check("TC17_pool_act_raddr", act_raddr, 4);
        check("TC17_pool_out_waddr", out_waddr, 0);

        // Wait for done
        @(posedge clk); #1;
        while (!done) begin
            @(posedge clk); #1;
        end
        check("TC18_pool_done", done, 1);

        // -----------------------------------------------------------------
        // TC19: CONV 5×5 input, 3×3 kernel, stride=1, pad=0,
        //        2 in_channels, 1 out_channel -> out_rows=3, out_cols=3
        //        first compute cycle addresses
        // -----------------------------------------------------------------
        do_reset;
        mode         = 2'b00;
        img_rows     = 8'd5;  img_cols    = 8'd5;
        kernel_size  = 8'd3;  stride      = 8'd1;
        padding      = 8'd0;
        in_channels  = 8'd2;  out_channels = 8'd1;

        @(negedge clk); start = 1;
        @(negedge clk); start = 0;

        @(posedge clk); #1;
        check("TC19_conv5_busy", busy, 1);
        check("TC19_conv5_in_rows_buffered", in_rows_buffered, 3); // = kernel_size

        // LOAD_WGT takes 2 cycles for CONV mode
        @(posedge clk); #1;
        @(posedge clk); #1;
        // COMPUTE clock 1: kc=0,kr=0,ch_in=0,col=0,row=0,ch_out=0
        // act_raddr = (0*1+0)*5 + (0*1+0) + 0*5*5 = 0
        // wgt_raddr = 0*2*3*3 + 0*3*3 + 0*3 + 0 = 0
        // out_waddr = 0*3*3 + 0*3 + 0 = 0
        check("TC19_conv5_act_raddr", act_raddr, 0);
        check("TC19_conv5_wgt_raddr", wgt_raddr, 0);
        check("TC19_conv5_out_waddr", out_waddr, 0);

        @(posedge clk); #1; // COMPUTE clock 2: kc advances to 1
        // act_raddr = (0)*5 + 1 + 0 = 1
        // wgt_raddr = 0 + 0 + 0 + 1 = 1
        // out_waddr = 0
        check("TC20_conv5_act_raddr", act_raddr, 1);
        check("TC20_conv5_wgt_raddr", wgt_raddr, 1);
        check("TC20_conv5_out_waddr", out_waddr, 0);

        // Wait for done
        @(posedge clk); #1;
        while (!done) begin
            @(posedge clk); #1;
        end
        check("TC21_conv5_done", done, 1);
        check("TC21_conv5_busy", busy, 0);

        // -----------------------------------------------------------------
        // Summary
        // -----------------------------------------------------------------
        $display("==============================");
        $display("Results: %0d passed, %0d failed", pass_count, fail_count);
        $display("==============================");
        $finish;
    end

endmodule
