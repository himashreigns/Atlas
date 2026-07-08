// tb_pipeline_yolo.v — drive the 4-layer streaming_nn_pipeline at YOLO-Nano
// sizes with the same input & weights the on-board C app uses.
//
// Loads weights via the pipeline's wgt_load_en interface directly (bypasses
// the WL FSM). Streams 256 input pixels, captures 20 output words. Compares
// to Python golden model values passed in via +arg.
`timescale 1ns/1ps

module tb_pipeline_yolo;
    reg clk = 0; always #5 clk = ~clk;
    reg rst = 1;

    localparam DATA_W = 16;
    localparam ACC_W  = 32;
    localparam ADDR_W = 10;
    localparam N_IN   = 256;
    localparam N_OUT  = 20;

    reg  [DATA_W-1:0] pipeline_in_data;
    reg               pipeline_in_valid;
    wire              pipeline_in_ready;

    wire [ACC_W-1:0]  pipeline_out_data;
    wire              pipeline_out_valid;
    reg               pipeline_out_ready;

    reg  [3:0]        wgt_load_en;
    reg  [ADDR_W-1:0] wgt_load_addr;
    reg  [DATA_W-1:0] wgt_load_data;

    wire              pipeline_ready;
    wire [3:0]        layer_busy;
    wire [3:0]        layer_ready_out;

    streaming_nn_pipeline #(
        .N          (8),
        .DATA_W     (DATA_W),
        .ACC_W      (ACC_W),
        .ADDR_W     (ADDR_W),
        .NUM_LAYERS (4)
    ) dut (
        .clk(clk), .rst(rst),
        .pipeline_in_data (pipeline_in_data),
        .pipeline_in_valid(pipeline_in_valid),
        .pipeline_in_ready(pipeline_in_ready),
        .pipeline_out_data (pipeline_out_data),
        .pipeline_out_valid(pipeline_out_valid),
        .pipeline_out_ready(pipeline_out_ready),
        .wgt_load_en  (wgt_load_en),
        .wgt_load_addr(wgt_load_addr),
        .wgt_load_data(wgt_load_data),
        .pipeline_ready (pipeline_ready),
        .layer_busy     (layer_busy),
        .layer_ready_out(layer_ready_out)
    );

    // Golden inputs & weights loaded from memh (32-bit words per line, but
    // we only use the low 16 bits — matches the DRAM layout on-board).
    reg [31:0] in_words [0:N_IN-1];
    reg [31:0] wgt_l0   [0:35];
    reg [31:0] wgt_l3   [0:719];
    reg [31:0] out_words[0:N_OUT-1];
    integer out_cnt = 0;

    initial begin
        $readmemh("tb_input.memh",  in_words);
        $readmemh("tb_wgt_l0.memh", wgt_l0);
        $readmemh("tb_wgt_l3.memh", wgt_l3);
    end

    always @(posedge clk) begin
        if (pipeline_out_valid && pipeline_out_ready) begin
            out_words[out_cnt] <= pipeline_out_data;
            out_cnt <= out_cnt + 1;
        end
    end

    // Trace layer_busy transitions to see how far the pipeline gets
    reg [3:0] last_busy = 4'bx;
    always @(posedge clk) begin
        if (layer_busy !== last_busy) begin
            $display("[%0t] layer_busy=%b  layer_ready=%b", $time, layer_busy, layer_ready_out);
            last_busy <= layer_busy;
        end
    end

    integer i;
    initial begin
        pipeline_in_data  = 0;
        pipeline_in_valid = 0;
        pipeline_out_ready = 1;
        wgt_load_en    = 4'b0000;
        wgt_load_addr  = 0;
        wgt_load_data  = 0;

        #100 rst = 0;
        #50;

        // ---- Load Layer 0 weights ---------------------------------------
        $display("[%0t] loading L0 weights (36)...", $time);
        for (i = 0; i < 36; i = i + 1) begin
            @(negedge clk);
            wgt_load_en   = 4'b0001;
            wgt_load_addr = i;
            wgt_load_data = wgt_l0[i][15:0];
        end
        @(negedge clk);
        wgt_load_en = 0;

        // ---- Load Layer 3 weights ---------------------------------------
        $display("[%0t] loading L3 weights (720)...", $time);
        for (i = 0; i < 720; i = i + 1) begin
            @(negedge clk);
            wgt_load_en   = 4'b1000;
            wgt_load_addr = i;
            wgt_load_data = wgt_l3[i][15:0];
        end
        @(negedge clk);
        wgt_load_en = 0;

        #50;
        $display("[%0t] streaming %0d input pixels...", $time, N_IN);
        for (i = 0; i < N_IN; i = i + 1) begin
            @(negedge clk);
            pipeline_in_data  = in_words[i][15:0];
            pipeline_in_valid = 1;
            wait (pipeline_in_ready);
        end
        @(negedge clk);
        pipeline_in_valid = 0;

        // Wait for all 20 outputs or timeout
        i = 0;
        while (out_cnt < N_OUT && i < 1000000) begin
            @(posedge clk);
            i = i + 1;
        end

        if (out_cnt >= N_OUT) begin
            $display("[%0t] DONE: got %0d outputs", $time, out_cnt);
            for (i = 0; i < N_OUT; i = i + 1)
                $display("  out[%0d] = 0x%08x", i, out_words[i]);
        end else begin
            $display("[%0t] STALLED: only %0d/%0d outputs", $time, out_cnt, N_OUT);
        end

        $display("=== layer 0 out_mem[0..3]:");
        for (i = 0; i < 4; i = i + 1)
            $display("  L0.out_mem[%0d] = 0x%08x", i, dut.layer_0.out_mem[i]);
        $display("=== layer 1 out_mem[0..3]:");
        for (i = 0; i < 4; i = i + 1)
            $display("  L1.out_mem[%0d] = 0x%08x", i, dut.layer_1.out_mem[i]);
        $display("=== layer 2 out_mem[0..3]:");
        for (i = 0; i < 4; i = i + 1)
            $display("  L2.out_mem[%0d] = 0x%08x", i, dut.layer_2.out_mem[i]);
        $display("=== layer 3 act_mem[0..3] (should be layer 2 stream):");
        for (i = 0; i < 4; i = i + 1)
            $display("  L3.act_mem[%0d] = 0x%08x", i, dut.layer_3.act_mem[i]);
        $display("=== layer 3 wgt_mem[0..3] (should be yolo_wgt_l3 lo16 zero-ext):");
        for (i = 0; i < 4; i = i + 1)
            $display("  L3.wgt_mem[%0d] = 0x%08x", i, dut.layer_3.wgt_mem[i]);
        $display("=== layer 3 out_mem[0..3]:");
        for (i = 0; i < 4; i = i + 1)
            $display("  L3.out_mem[%0d] = 0x%08x", i, dut.layer_3.out_mem[i]);

        #200 $finish;
    end

    initial begin
        #100000000;   // 100 ms sim timeout
        $display("[%0t] *** SIM TIMEOUT ***", $time);
        $finish;
    end
endmodule
