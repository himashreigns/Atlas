// ===========================================================================
// tb_hw_output_dump.v
//
// Runs the DUT with the exact same input/weight patterns as tf_golden.py,
// then dumps the 256 output values to hw_output.txt — one hex value per line.
//
// The comparison against TensorFlow is done by compare_tf_vs_hw.py which
// reads BOTH hw_output.txt (hardware) and golden_output_tf.csv (TF floats).
//
// NO golden values are loaded here — this TB has zero knowledge of expected
// outputs.  It just runs the hardware and records what comes out.
// ===========================================================================
`timescale 1ns/1ps
`include "dnn_config.vh"

module tb_hw_output_dump;

    localparam CLK_PERIOD = 10;
    localparam NUM_LAYERS = `DNN_NUM_LAYERS;
    localparam MEM_ADDR_W = 20;
    localparam MEM_DATA_W = 32;
    localparam EST_CYCLES = `DNN_EST_LATENCY_CYCLES;

    // Memory layout — MUST match tf_golden.py gen_patterns() exactly
    localparam [MEM_ADDR_W-1:0] INPUT_BASE  = 20'h00000;
    localparam [MEM_ADDR_W-1:0] OUTPUT_BASE = 20'h10000;
    localparam [MEM_ADDR_W-1:0] W0_BASE     = 20'h20000;
    localparam [MEM_ADDR_W-1:0] W2_BASE     = 20'h30000;

    // Clock
    reg clk;
    initial begin clk = 0; forever #(CLK_PERIOD/2) clk = ~clk; end

    // DUT signals
    reg  rst, start_inference, load_weights;
    wire inference_done, system_ready, weights_loaded;
    wire [NUM_LAYERS-1:0] layer_busy;
    wire                  pipeline_active;
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire                  mem_read, mem_write;
    reg  [MEM_DATA_W-1:0] mem_rdata;
    reg                   mem_rdata_valid;
    wire [MEM_DATA_W-1:0] mem_wdata;

    // Memory (256K x 32b)
    reg [MEM_DATA_W-1:0] memory [0:(1<<18)-1];

    // 1-cycle latency memory model
    always @(posedge clk) begin
        mem_rdata_valid <= 1'b0;
        if (mem_read)  begin mem_rdata <= memory[mem_addr]; mem_rdata_valid <= 1'b1; end
        if (mem_write) memory[mem_addr] <= mem_wdata;
    end

    // Weight base addresses
    reg [MEM_ADDR_W*NUM_LAYERS-1:0] weights_base_addr;
    initial begin
        weights_base_addr = {(MEM_ADDR_W*NUM_LAYERS){1'b0}};
        weights_base_addr[MEM_ADDR_W*1-1 -: MEM_ADDR_W] = W0_BASE;
        weights_base_addr[MEM_ADDR_W*2-1 -: MEM_ADDR_W] = 20'h20100;
        weights_base_addr[MEM_ADDR_W*3-1 -: MEM_ADDR_W] = W2_BASE;
        weights_base_addr[MEM_ADDR_W*4-1 -: MEM_ADDR_W] = 20'h30A00;
    end

    // DUT
    streaming_nn_system #(
        .NUM_LAYERS(NUM_LAYERS),
        .MEM_ADDR_W(MEM_ADDR_W),
        .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk              (clk),
        .rst              (rst),
        .start_inference  (start_inference),
        .inference_done   (inference_done),
        .system_ready     (system_ready),
        .load_weights     (load_weights),
        .weights_loaded   (weights_loaded),
        .mem_addr         (mem_addr),
        .mem_read         (mem_read),
        .mem_rdata        (mem_rdata),
        .mem_rdata_valid  (mem_rdata_valid),
        .mem_write        (mem_write),
        .mem_wdata        (mem_wdata),
        .input_base_addr  (INPUT_BASE),
        .output_base_addr (OUTPUT_BASE),
        .weights_base_addr(weights_base_addr),
        .layer_busy       (layer_busy),
        .pipeline_active  (pipeline_active)
    );

    // Watchdog
    initial begin
        #(20 * EST_CYCLES * CLK_PERIOD + 500_000_000);
        $display("ERROR: TIMEOUT"); $finish;
    end

    // Negedge pulse helpers
    task automatic pulse_lw;
        begin @(negedge clk); load_weights=1'b1;
              @(negedge clk); load_weights=1'b0; end
    endtask
    task automatic pulse_si;
        begin @(negedge clk); start_inference=1'b1;
              @(negedge clk); start_inference=1'b0; end
    endtask

    // -----------------------------------------------------------------------
    // Main: init memory with the TF-identical patterns, run inference, dump
    // -----------------------------------------------------------------------
    integer i, guard;
    integer fp;

    initial begin
        rst=1; start_inference=0; load_weights=0;

        $display("[hw_dump] Initialising memory with TF-identical patterns...");

        // Clear all memory
        for (i = 0; i < (1<<18); i = i + 1) memory[i] = 32'h0;

        // Input: (i % 256) << 8  — exactly tf_golden.py gen_patterns()
        for (i = 0; i < 784; i = i + 1)
            memory[INPUT_BASE + i] = (i % 256) << 8;

        // Conv1 weights: ((i*7+3) & 0xFF) << 4
        for (i = 0; i < 150; i = i + 1)
            memory[W0_BASE + i] = ((i * 7 + 3) & 8'hFF) << 4;

        // Conv2 weights: ((i*13+5) & 0xFF) << 4
        for (i = 0; i < 2400; i = i + 1)
            memory[W2_BASE + i] = ((i * 13 + 5) & 8'hFF) << 4;

        $display("[hw_dump] Memory ready.");

        // Reset
        repeat (10) @(posedge clk);
        @(negedge clk); rst = 1'b0;
        repeat (5)  @(posedge clk);
        $display("[hw_dump] Reset complete, system_ready=%b", system_ready);

        // Load weights
        pulse_lw();
        guard = 200000;
        while (!weights_loaded && guard > 0) begin @(posedge clk); guard = guard - 1; end
        $display("[hw_dump] weights_loaded=%b", weights_loaded);

        // Run inference
        wait (system_ready); @(posedge clk);
        pulse_si();
        guard = 10 * EST_CYCLES;
        while (!inference_done && guard > 0) begin @(posedge clk); guard = guard - 1; end
        $display("[hw_dump] inference_done=%b", inference_done);

        // Wait for output writes to flush
        repeat(50) @(posedge clk);

        // Dump the 256 hardware output values to hw_output.txt
        // Format: one signed decimal integer per line (the raw int16 value)
        fp = $fopen("hw_output.txt", "w");
        $fwrite(fp, "# Hardware output dump: 256 x int16 values\n");
        $fwrite(fp, "# index,hw_int16\n");
        for (i = 0; i < 256; i = i + 1) begin
            $fwrite(fp, "%0d,%0d\n", i,
                    $signed(memory[OUTPUT_BASE + i][15:0]));
        end
        $fclose(fp);

        $display("[hw_dump] Wrote hw_output.txt (256 int16 values)");
        $display("[hw_dump] Run compare_tf_vs_hw.py to compare against TF.");
        $finish;
    end

endmodule
