`timescale 1ns/1ps
module tb_streaming_row_buffer;

    // -------------------------------------------------------------------------
    // Parameters — small values for easy manual verification
    // -------------------------------------------------------------------------
    parameter CLK_PERIOD   = 10;
    parameter DATA_W       = 8;
    parameter IMG_COLS     = 4;
    parameter KERNEL_ROWS  = 3;
    parameter NUM_CHANNELS = 1;

    localparam WIN_W  = DATA_W * KERNEL_ROWS * IMG_COLS * NUM_CHANNELS;
    localparam ROWS_W = 11;   // [$clog2(1024):0] = [10:0]

    // -------------------------------------------------------------------------
    // DUT signals
    // -------------------------------------------------------------------------
    reg  clk, rst;
    reg  [DATA_W-1:0] stream_in_data;
    reg               stream_in_valid;
    wire              stream_in_ready;
    wire [WIN_W-1:0]  window_data;
    wire              window_valid;
    reg               window_read;
    wire              buffer_full;
    wire [ROWS_W-1:0] rows_buffered;

    integer errors;
    integer cc;

    // -------------------------------------------------------------------------
    // DUT
    // -------------------------------------------------------------------------
    streaming_row_buffer #(
        .DATA_W      (DATA_W),
        .IMG_COLS    (IMG_COLS),
        .KERNEL_ROWS (KERNEL_ROWS),
        .NUM_CHANNELS(NUM_CHANNELS)
    ) dut (
        .clk             (clk),
        .rst             (rst),
        .stream_in_data  (stream_in_data),
        .stream_in_valid (stream_in_valid),
        .stream_in_ready (stream_in_ready),
        .window_data     (window_data),
        .window_valid    (window_valid),
        .window_read     (window_read),
        .buffer_full     (buffer_full),
        .rows_buffered   (rows_buffered)
    );

    // -------------------------------------------------------------------------
    // Clock
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // -------------------------------------------------------------------------
    // Helpers
    // -------------------------------------------------------------------------

    // Extract one pixel from the combinational window_data bus.
    // Element [r][c][ch] sits at bit DATA_W*(r*IMG_COLS*NUM_CHANNELS + c*NUM_CHANNELS + ch).
    // With NUM_CHANNELS=1 this simplifies to DATA_W*(r*IMG_COLS + c).
    function [DATA_W-1:0] get_pixel;
        input integer rr, cc_in;
        integer bit_off;
        begin
            bit_off   = DATA_W * ((rr * IMG_COLS * NUM_CHANNELS) + (cc_in * NUM_CHANNELS));
            get_pixel = window_data[bit_off +: DATA_W];
        end
    endfunction

    // Stream one pixel: drive data+valid one cycle before it is captured.
    task stream_pixel;
        input [DATA_W-1:0] data;
        begin
            @(posedge clk); #1;
            stream_in_data  = data;
            stream_in_valid = 1;
        end
    endtask

    // Stream one complete row (IMG_COLS pixels), then deassert valid.
    // Pixel at column c = base + c.
    task stream_row;
        input [DATA_W-1:0] base;
        integer col;
        begin
            for (col = 0; col < IMG_COLS; col = col + 1)
                stream_pixel(base + col);
            @(posedge clk); #1;   // one extra cycle: this posedge captures last pixel
            stream_in_valid = 0;
        end
    endtask

    // Check all pixels in all KERNEL_ROWS rows of the window.
    // base{r} is the starting value for row r; pixel[r][c] = base{r} + c.
    task check_window;
        input [DATA_W-1:0] base0, base1, base2;
        reg  [DATA_W-1:0] exp_val, got_val;
        integer col_i;
        begin
            // row 0
            for (col_i = 0; col_i < IMG_COLS; col_i = col_i + 1) begin
                exp_val = base0 + col_i;
                got_val = get_pixel(0, col_i);
                if (got_val !== exp_val) begin
                    $display("  PIXEL ERR row=0 col=%0d: expected=0x%02h got=0x%02h",
                             col_i, exp_val, got_val);
                    errors = errors + 1;
                end
            end
            // row 1
            for (col_i = 0; col_i < IMG_COLS; col_i = col_i + 1) begin
                exp_val = base1 + col_i;
                got_val = get_pixel(1, col_i);
                if (got_val !== exp_val) begin
                    $display("  PIXEL ERR row=1 col=%0d: expected=0x%02h got=0x%02h",
                             col_i, exp_val, got_val);
                    errors = errors + 1;
                end
            end
            // row 2
            for (col_i = 0; col_i < IMG_COLS; col_i = col_i + 1) begin
                exp_val = base2 + col_i;
                got_val = get_pixel(2, col_i);
                if (got_val !== exp_val) begin
                    $display("  PIXEL ERR row=2 col=%0d: expected=0x%02h got=0x%02h",
                             col_i, exp_val, got_val);
                    errors = errors + 1;
                end
            end
        end
    endtask

    // -------------------------------------------------------------------------
    // Stimulus
    //
    // Data layout for these tests (DATA_W=8, IMG_COLS=4, KERNEL_ROWS=3):
    //   Row 0: [0x10, 0x11, 0x12, 0x13]
    //   Row 1: [0x20, 0x21, 0x22, 0x23]
    //   Row 2: [0x30, 0x31, 0x32, 0x33]
    //   Row 3: [0x40, 0x41, 0x42, 0x43]
    //
    // Pixel timing: stream_pixel drives data+valid 1 ns AFTER a posedge.
    // The module captures it at the NEXT posedge.  stream_row therefore
    // consumes IMG_COLS+1 posedges: IMG_COLS to drive, one more to capture
    // the last pixel (and to deassert valid).
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("tb_streaming_row_buffer.vcd");
        $dumpvars(0, tb_streaming_row_buffer);

        rst             = 1;
        stream_in_data  = 0;
        stream_in_valid = 0;
        window_read     = 0;
        errors          = 0;

        repeat(5) @(posedge clk);
        @(posedge clk); rst = 0;
        @(posedge clk); #1;

        // =====================================================================
        // TEST 1: buffer_full rises after exactly KERNEL_ROWS complete rows
        // =====================================================================

        // --- Row 0: buffer should NOT be full yet ---
        stream_row(8'h10);
        @(posedge clk); #1;

        if (buffer_full !== 1'b0 || window_valid !== 1'b0) begin
            $display("TEST1a ERROR: buffer_full=%b window_valid=%b (expected 0/0 after 1 row)",
                     buffer_full, window_valid);
            errors = errors + 1;
        end else
            $display("TEST1a OK: buffer_full=0 window_valid=0 after 1 row");

        if (rows_buffered !== 1) begin
            $display("TEST1b ERROR: rows_buffered=%0d (expected 1)", rows_buffered);
            errors = errors + 1;
        end else
            $display("TEST1b OK: rows_buffered=1");

        // --- Row 1 ---
        stream_row(8'h20);
        @(posedge clk); #1;

        if (buffer_full !== 1'b0) begin
            $display("TEST1c ERROR: buffer_full=%b (expected 0 after 2 rows)", buffer_full);
            errors = errors + 1;
        end else
            $display("TEST1c OK: buffer_full=0 after 2 rows");

        if (rows_buffered !== 2) begin
            $display("TEST1d ERROR: rows_buffered=%0d (expected 2)", rows_buffered);
            errors = errors + 1;
        end else
            $display("TEST1d OK: rows_buffered=2");

        // --- Row 2: buffer becomes full ---
        stream_row(8'h30);
        @(posedge clk); #1;

        if (buffer_full !== 1'b1 || window_valid !== 1'b1) begin
            $display("TEST1e ERROR: buffer_full=%b window_valid=%b (expected 1/1 after 3 rows)",
                     buffer_full, window_valid);
            errors = errors + 1;
        end else
            $display("TEST1e OK: buffer_full=1 window_valid=1 after 3 rows");

        if (rows_buffered !== KERNEL_ROWS) begin
            $display("TEST1f ERROR: rows_buffered=%0d (expected %0d)", rows_buffered, KERNEL_ROWS);
            errors = errors + 1;
        end else
            $display("TEST1f OK: rows_buffered=%0d", rows_buffered);

        // =====================================================================
        // TEST 2: window_data correct after initial fill
        //   rd_row_ptr = 0 so window rows map directly: row_mem[0,1,2]
        //   Expected: row0=[0x10..0x13], row1=[0x20..0x23], row2=[0x30..0x33]
        // =====================================================================
        $display("TEST2: verifying window_data contents...");
        check_window(8'h10, 8'h20, 8'h30);
        if (errors == 0)
            $display("TEST2 OK: window_data correct");

        // =====================================================================
        // TEST 3: window slides after window_read + new row
        //   After window_read: rd_row_ptr advances 0→1.
        //   Stream row 3 into slot 0 (wr_row_ptr wrapped back to 0).
        //   Circular view with rd_row_ptr=1:
        //     row 0: actual = (1+0)%3 = 1 → row_mem[1] = [0x20..0x23]
        //     row 1: actual = (1+1)%3 = 2 → row_mem[2] = [0x30..0x33]
        //     row 2: actual = (1+2)%3 = 0 → row_mem[0] = [0x40..0x43]
        // =====================================================================
        @(posedge clk); #1;
        window_read = 1;            // rd_row_ptr advances at next posedge
        @(posedge clk); #1;
        window_read = 0;

        stream_row(8'h40);          // writes into row_mem[0] (wr_row_ptr wrapped)
        @(posedge clk); #1;

        $display("TEST3: verifying window after slide + new row...");
        check_window(8'h20, 8'h30, 8'h40);
        if (errors == 0)
            $display("TEST3 OK: window slide correct");

        // =====================================================================
        // TEST 4: window_read without new data — window stays valid
        //   valid_rows is already capped at KERNEL_ROWS and doesn't decrement
        //   on window_read, so buffer_full / window_valid must stay high.
        // =====================================================================
        @(posedge clk); #1;
        window_read = 1;
        @(posedge clk); #1;
        window_read = 0;
        @(posedge clk); #1;

        if (window_valid !== 1'b1 || buffer_full !== 1'b1) begin
            $display("TEST4 ERROR: window_valid=%b buffer_full=%b (expected both 1)",
                     window_valid, buffer_full);
            errors = errors + 1;
        end else
            $display("TEST4 OK: window_valid/buffer_full stay 1 after bare window_read");

        if (rows_buffered !== KERNEL_ROWS) begin
            $display("TEST4 ERROR: rows_buffered changed to %0d (expected %0d)",
                     rows_buffered, KERNEL_ROWS);
            errors = errors + 1;
        end else
            $display("TEST4 OK: rows_buffered stable at %0d", rows_buffered);

        // =====================================================================
        // TEST 5: stream_in_ready always asserted
        // =====================================================================
        if (stream_in_ready !== 1'b1) begin
            $display("TEST5 ERROR: stream_in_ready=%b (expected 1)", stream_in_ready);
            errors = errors + 1;
        end else
            $display("TEST5 OK: stream_in_ready=1");

        // =====================================================================
        // Verdict
        // =====================================================================
        if (errors == 0)
            $display("PASS: streaming_row_buffer tests completed successfully.");
        else
            $display("FAIL: %0d error(s) found.", errors);

        $finish;
    end

endmodule
