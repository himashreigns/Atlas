// tb_system_yolo.v — drive streaming_nn_system with a memory model that
// emulates the DRAM side (input + weights). Confirms the same golden L3
// output we get from the pipeline-only TB flows through the WL/IF/OC FSMs.
`timescale 1ns/1ps

module tb_system_yolo;
    reg clk = 0; always #5 clk = ~clk;
    reg rst = 1;

    localparam DATA_W     = 16;
    localparam ACC_W      = 32;
    localparam ADDR_W     = 10;
    localparam MEM_ADDR_W = 20;
    localparam MEM_DATA_W = 32;
    localparam NUM_LAYERS = 4;

    reg  start_inference = 0;
    wire inference_done;
    wire system_ready;
    reg  load_weights = 0;
    wire weights_loaded;

    wire [MEM_ADDR_W-1:0] mem_addr;
    wire                  mem_read;
    reg  [MEM_DATA_W-1:0] mem_rdata;
    reg                   mem_rdata_valid;
    wire                  mem_write;
    wire [MEM_DATA_W-1:0] mem_wdata;

    reg [MEM_ADDR_W-1:0]                input_base_addr = 0;
    reg [MEM_ADDR_W-1:0]                output_base_addr = 0;
    reg [MEM_ADDR_W*NUM_LAYERS-1:0]     weights_base_addr;
    reg [15:0]                          input_size_in  = 256;
    reg [15:0]                          output_size_in = 20;
    reg [ADDR_W*NUM_LAYERS-1:0]         weights_per_layer_in;

    wire [NUM_LAYERS-1:0] layer_busy;
    wire [NUM_LAYERS-1:0] layer_ready_dbg;
    wire                  pipeline_active;

    streaming_nn_system #(
        .N(8), .DATA_W(DATA_W), .ACC_W(ACC_W), .ADDR_W(ADDR_W),
        .NUM_LAYERS(NUM_LAYERS),
        .MEM_ADDR_W(MEM_ADDR_W), .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk(clk), .rst(rst),
        .start_inference(start_inference),
        .inference_done(inference_done),
        .system_ready(system_ready),
        .load_weights(load_weights),
        .weights_loaded(weights_loaded),
        .mem_addr(mem_addr),
        .mem_read(mem_read),
        .mem_rdata(mem_rdata),
        .mem_rdata_valid(mem_rdata_valid),
        .mem_write(mem_write),
        .mem_wdata(mem_wdata),
        .input_base_addr(input_base_addr),
        .output_base_addr(output_base_addr),
        .weights_base_addr(weights_base_addr),
        .input_size_in(input_size_in),
        .output_size_in(output_size_in),
        .weights_per_layer_in(weights_per_layer_in),
        .layer_busy(layer_busy),
        .layer_ready_dbg(layer_ready_dbg),
        .pipeline_active(pipeline_active)
    );

    // Simple memory model: 1M x 32-bit
    reg [31:0] mem [0:32'h100000];
    reg [31:0] out_mem [0:31];
    integer out_written = 0;

    always @(posedge clk) begin
        // 1-cycle read latency
        mem_rdata_valid <= 1'b0;
        if (mem_read) begin
            mem_rdata <= mem[mem_addr];
            mem_rdata_valid <= 1'b1;
        end
        if (mem_write) begin
            mem[mem_addr] <= mem_wdata;
            out_mem[out_written] <= mem_wdata;
            out_written <= out_written + 1;
        end
    end

    reg [31:0] in_words [0:255];
    reg [31:0] wgt_l0   [0:35];
    reg [31:0] wgt_l3   [0:719];

    integer i;
    initial begin
        $readmemh("tb_input.memh",  in_words);
        $readmemh("tb_wgt_l0.memh", wgt_l0);
        $readmemh("tb_wgt_l3.memh", wgt_l3);
    end

    initial begin
        for (i = 0; i < 32'h100000; i = i + 1) mem[i] = 32'h0;

        // Populate DRAM model exactly like the C app.
        // input at 0x00000 (byte 0x00000..)
        for (i = 0; i < 256; i = i + 1) mem[i] = in_words[i];
        // wgt_l0 at accel word idx 0x20000
        for (i = 0; i < 36; i = i + 1) mem[20'h20000 + i] = wgt_l0[i];
        // wgt_l3 at accel word idx 0x20024 (contiguous with l0)
        for (i = 0; i < 720; i = i + 1) mem[20'h20024 + i] = wgt_l3[i];

        // BASE addrs: input=0, output=0x4000 (byte 0x10000), wgt L0=0x20000
        input_base_addr  = 20'h00000;
        output_base_addr = 20'h04000;
        weights_base_addr = 0;
        weights_base_addr[MEM_ADDR_W*0 +: MEM_ADDR_W] = 20'h20000;

        // sizes
        weights_per_layer_in = 0;
        weights_per_layer_in[ADDR_W*0 +: ADDR_W] = 36;
        weights_per_layer_in[ADDR_W*3 +: ADDR_W] = 720;

        input_size_in  = 256;
        output_size_in = 20;

        mem_rdata = 0;
        mem_rdata_valid = 0;

        #100 rst = 0;
        #50;

        // Load weights
        $display("[%0t] load_weights pulse", $time);
        @(negedge clk); load_weights = 1;
        @(negedge clk); load_weights = 0;

        // Wait for weights_loaded
        i = 0;
        while (!weights_loaded && i < 500000) begin
            @(posedge clk);
            i = i + 1;
        end
        $display("[%0t] weights_loaded after %0d cycles", $time, i);

        #100;

        // Start inference
        $display("[%0t] start_inference pulse", $time);
        @(negedge clk); start_inference = 1;
        @(negedge clk); start_inference = 0;

        // Wait for inference to finish (network_done = inference_done from OC)
        i = 0;
        while (!(pipeline_active == 0 && out_written >= 20) && i < 5000000) begin
            @(posedge clk);
            i = i + 1;
        end

        if (out_written >= 20) begin
            $display("[%0t] DONE. Collected %0d outputs:", $time, out_written);
            for (i = 0; i < 20; i = i + 1)
                $display("  sys_out[%0d] = 0x%08x", i, out_mem[i]);
        end else begin
            $display("[%0t] STALLED. out_written=%0d pipeline_active=%b",
                     $time, out_written, pipeline_active);
        end

        #200 $finish;
    end

    initial begin
        #500000000;   // 500 ms sim
        $display("[%0t] *** SIM TIMEOUT ***", $time);
        $finish;
    end
endmodule
