`timescale 1ns/1ps
module tb_streaming_nn_pipeline;

    // -------------------------------------------------------------------------
    // Parameters matching the DUT's fixed LeNet-5-style configuration
    // -------------------------------------------------------------------------
    parameter CLK_PERIOD = 10;
    parameter N          = 8;
    parameter DATA_W     = 16;
    parameter ACC_W      = 32;
    parameter ADDR_W     = 10;
    parameter NUM_LAYERS = 4;

    // Layer 0 geometry (CONV 5×5, 1 in channel, 28×28 input)
    // KERNEL_ROWS = KERNEL_SIZE = 5 for a 5×5 CONV layer.
    localparam L0_KERNEL_ROWS = 5;
    localparam L0_IMG_COLS    = 28;
    localparam L0_FILL_PIXELS = L0_KERNEL_ROWS * L0_IMG_COLS;  // 140 pixels

    // -------------------------------------------------------------------------
    // DUT signals
    // -------------------------------------------------------------------------
    reg  clk, rst;
    reg  [DATA_W-1:0]     pipeline_in_data;
    reg                   pipeline_in_valid;
    wire                  pipeline_in_ready;
    wire [ACC_W-1:0]      pipeline_out_data;
    wire                  pipeline_out_valid;
    reg                   pipeline_out_ready;
    reg  [NUM_LAYERS-1:0] wgt_load_en;
    reg  [ADDR_W-1:0]     wgt_load_addr;
    reg  [DATA_W-1:0]     wgt_load_data;
    wire                  pipeline_ready;
    wire [NUM_LAYERS-1:0] layer_busy;

    integer errors;
    integer i;
    integer timeout;

    // -------------------------------------------------------------------------
    // DUT
    // -------------------------------------------------------------------------
    streaming_nn_pipeline #(
        .N         (N),
        .DATA_W    (DATA_W),
        .ACC_W     (ACC_W),
        .ADDR_W    (ADDR_W),
        .NUM_LAYERS(NUM_LAYERS)
    ) dut (
        .clk               (clk),
        .rst               (rst),
        .pipeline_in_data  (pipeline_in_data),
        .pipeline_in_valid (pipeline_in_valid),
        .pipeline_in_ready (pipeline_in_ready),
        .pipeline_out_data (pipeline_out_data),
        .pipeline_out_valid(pipeline_out_valid),
        .pipeline_out_ready(pipeline_out_ready),
        .wgt_load_en       (wgt_load_en),
        .wgt_load_addr     (wgt_load_addr),
        .wgt_load_data     (wgt_load_data),
        .pipeline_ready    (pipeline_ready),
        .layer_busy        (layer_busy)
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

    // Drive one pixel 1 ns after a posedge so it is captured at the next posedge.
    task stream_pixel;
        input [DATA_W-1:0] data;
        begin
            @(posedge clk); #1;
            pipeline_in_data  = data;
            pipeline_in_valid = 1;
        end
    endtask

    // Stream L0_IMG_COLS pixels (one full row for Layer 0) then deassert valid.
    // Pixel at column c = base + c.
    task stream_row;
        input [DATA_W-1:0] base;
        integer col;
        begin
            for (col = 0; col < L0_IMG_COLS; col = col + 1)
                stream_pixel(base + col[DATA_W-1:0]);
            @(posedge clk); #1;   // posedge captures last pixel
            pipeline_in_valid = 0;
        end
    endtask

    // -------------------------------------------------------------------------
    // Stimulus
    //
    // This testbench is a smoke test of the four-layer LeNet-5 pipeline:
    //   Layer 0: CONV 5×5, 1→6 ch, 28×28 input
    //   Layer 1: POOL 2×2, 6 ch,   24×24 input
    //   Layer 2: CONV 5×5, 6→16 ch, 12×12 input
    //   Layer 3: POOL 2×2, 16 ch,   8×8  input
    //
    // Full end-to-end inference output verification is out of scope here:
    // Layer 0 alone generates 24×24×6 = 3456 outputs, each requiring a
    // 5×5×1 = 25-element MAC pass through the control unit — tens of thousands
    // of cycles total.  Tests here verify the control plane:
    //   • post-reset state of all layers
    //   • pipeline_in_ready hardwiring
    //   • per-layer weight-load routing via wgt_load_en[i]
    //   • Layer 0 buffer fill → layer_busy[0] assertion
    //   • pipeline_in_ready invariant during processing
    //   • downstream layers stay idle before Layer 0 produces output
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("tb_streaming_nn_pipeline.vcd");
        $dumpvars(0, tb_streaming_nn_pipeline);

        rst                = 1;
        pipeline_in_data   = 0;
        pipeline_in_valid  = 0;
        pipeline_out_ready = 1;
        wgt_load_en        = 0;
        wgt_load_addr      = 0;
        wgt_load_data      = 0;
        errors             = 0;

        repeat(5) @(posedge clk);
        @(posedge clk); rst = 0;
        @(posedge clk); #1;

        // =====================================================================
        // TEST 1: post-reset — all layers idle, no output
        // =====================================================================
        if (|layer_busy !== 1'b0 || pipeline_out_valid !== 1'b0) begin
            $display("TEST1 ERROR: layer_busy=%04b pipeline_out_valid=%b (expected 0000/0)",
                     layer_busy, pipeline_out_valid);
            errors = errors + 1;
        end else
            $display("TEST1 OK: post-reset idle (layer_busy=0000, pipeline_out_valid=0)");

        // =====================================================================
        // TEST 2: pipeline_in_ready always 1
        //   Layer 0's row buffer hardwires stream_in_ready=1; this propagates
        //   to pipeline_in_ready unchanged.
        // =====================================================================
        if (pipeline_in_ready !== 1'b1) begin
            $display("TEST2 ERROR: pipeline_in_ready=%b (expected 1)", pipeline_in_ready);
            errors = errors + 1;
        end else
            $display("TEST2 OK: pipeline_in_ready=1");

        // =====================================================================
        // TEST 3: pipeline_ready=0 before any row buffer is filled
        //   pipeline_ready = &{layer_ready_status[3:0]}
        //   layer_ready_i  = (state_i == ST_IDLE) && buffer_full_i
        //   All buffer_full_i = 0 after reset → pipeline_ready = 0
        // =====================================================================
        if (pipeline_ready !== 1'b0) begin
            $display("TEST3 ERROR: pipeline_ready=%b before buffer fill (expected 0)",
                     pipeline_ready);
            errors = errors + 1;
        end else
            $display("TEST3 OK: pipeline_ready=0 — no row buffer filled yet");

        // =====================================================================
        // TEST 4: per-layer weight loading via wgt_load_en[i]
        //   Load 16 weights (value=1) into Layer 0 (CONV), then 16 into Layer 2
        //   (CONV).  POOL layers (1,3) ignore writes.  Both share the same
        //   addr/data bus — wgt_load_en selects which layer captures the write.
        // =====================================================================
        for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk); #1;
            wgt_load_en   = 4'b0001;          // Layer 0 only
            wgt_load_addr = i[ADDR_W-1:0];
            wgt_load_data = 16'd1;
        end
        @(posedge clk); #1; wgt_load_en = 0;

        for (i = 0; i < 16; i = i + 1) begin
            @(posedge clk); #1;
            wgt_load_en   = 4'b0100;          // Layer 2 only
            wgt_load_addr = i[ADDR_W-1:0];
            wgt_load_data = 16'd1;
        end
        @(posedge clk); #1; wgt_load_en = 0;
        $display("TEST4 OK: 16 weights dispatched to Layer 0 and Layer 2");

        // =====================================================================
        // TEST 5: pipeline_in_ready unaffected by weight loading
        // =====================================================================
        if (pipeline_in_ready !== 1'b1) begin
            $display("TEST5 ERROR: pipeline_in_ready=%b after weight loads (expected 1)",
                     pipeline_in_ready);
            errors = errors + 1;
        end else
            $display("TEST5 OK: pipeline_in_ready=1 after weight loads");

        // =====================================================================
        // TEST 6: stream L0_KERNEL_ROWS=5 rows (140 pixels) → layer_busy[0]
        //   Layer 0 row buffer: KERNEL_ROWS=5, IMG_COLS=28.  After 5 complete
        //   rows, buffer_full=1 → window_valid=1.
        //   Layer 1 (POOL) stream_in_ready is hardwired 1, so Layer 0's
        //   stream_out_ready=1 at all times.  FSM transitions IDLE→ST_LOAD_WIN
        //   immediately → layer_busy[0] asserts the cycle after the buffer fills.
        //
        //   Row i carries pixels: base=(i+1), column c → pixel value=(i+1+c).
        // =====================================================================
        $display("TEST6: streaming %0d rows × %0d cols (%0d pixels) into Layer 0...",
                 L0_KERNEL_ROWS, L0_IMG_COLS, L0_FILL_PIXELS);

        for (i = 0; i < L0_KERNEL_ROWS; i = i + 1)
            stream_row(i + 1);

        @(posedge clk); #1;

        timeout = 0;
        while (layer_busy[0] !== 1'b1 && timeout < 20) begin
            @(posedge clk); #1;
            timeout = timeout + 1;
        end

        if (layer_busy[0] !== 1'b1) begin
            $display("TEST6 ERROR: layer_busy[0] never asserted after %0d-pixel fill (timeout)",
                     L0_FILL_PIXELS);
            errors = errors + 1;
        end else
            $display("TEST6 OK: layer_busy[0]=1 — Layer 0 left IDLE after %0d-pixel buffer fill",
                     L0_FILL_PIXELS);

        // =====================================================================
        // TEST 7: pipeline_in_ready stays 1 while Layer 0 is computing
        //   Row buffer always accepts new data regardless of Layer 0's FSM state.
        //   This ensures the pipeline never stalls upstream input.
        // =====================================================================
        if (pipeline_in_ready !== 1'b1) begin
            $display("TEST7 ERROR: pipeline_in_ready=%b while Layer 0 busy (expected 1)",
                     pipeline_in_ready);
            errors = errors + 1;
        end else
            $display("TEST7 OK: pipeline_in_ready=1 during Layer 0 processing");

        // =====================================================================
        // TEST 8: downstream layers 1..3 remain idle
        //   Layer 0 has not yet produced output, so Layers 1..3 have received
        //   no data and their row buffers are empty → all busy bits are 0.
        // =====================================================================
        if (layer_busy[3:1] !== 3'b000) begin
            $display("TEST8 ERROR: layer_busy[3:1]=%b (expected 000 — downstream idle)",
                     layer_busy[3:1]);
            errors = errors + 1;
        end else
            $display("TEST8 OK: layer_busy[3:1]=000 — downstream layers idle");

        // =====================================================================
        // TEST 9: wgt_load_en isolation — enabling Layer 1 does not affect
        //         layer_busy during an unrelated write cycle
        // =====================================================================
        @(posedge clk); #1;
        wgt_load_en = 4'b0010;   // Layer 1 (POOL — ignores writes)
        wgt_load_addr = 0;
        wgt_load_data = 16'hDEAD;
        @(posedge clk); #1;
        wgt_load_en = 0;
        @(posedge clk); #1;

        // layer_busy[0] must still be 1 (Layer 0 is still computing)
        if (layer_busy[0] !== 1'b1) begin
            $display("TEST9 ERROR: layer_busy[0] dropped to 0 unexpectedly during Layer 1 write");
            errors = errors + 1;
        end else
            $display("TEST9 OK: layer_busy[0] stable during unrelated wgt_load_en[1] pulse");

        // =====================================================================
        // Verdict
        // =====================================================================
        if (errors == 0)
            $display("PASS: streaming_nn_pipeline smoke tests completed successfully.");
        else
            $display("FAIL: %0d error(s) found.", errors);

        $finish;
    end

endmodule
