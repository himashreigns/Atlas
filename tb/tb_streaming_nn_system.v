`timescale 1ns/1ps

module tb_streaming_nn_system;

    parameter CLK_PERIOD = 10;
    parameter N = 8;
    parameter DATA_W = 16;
    parameter ACC_W = 32;
    parameter ADDR_W = 10;
    parameter NUM_LAYERS = 4;
    parameter MEM_ADDR_W = 20;
    parameter MEM_DATA_W = 32;
    
    // Clock and reset
    reg clk;
    reg rst;
    
    // Control signals
    reg start_inference;
    wire inference_done;
    wire system_ready;
    
    reg load_weights;
    wire weights_loaded;
    
    // Memory interface
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire mem_read;
    reg [MEM_DATA_W-1:0] mem_rdata;
    reg mem_rdata_valid;
    wire mem_write;
    wire [MEM_DATA_W-1:0] mem_wdata;
    
    // Configuration
    reg [MEM_ADDR_W-1:0] input_base_addr;
    reg [MEM_ADDR_W-1:0] output_base_addr;
    reg [MEM_ADDR_W-1:0] weights_base_addr [0:NUM_LAYERS-1];
    
    // Status
    wire [NUM_LAYERS-1:0] layer_busy;
    wire pipeline_active;
    
    // Simulated memory
    reg [MEM_DATA_W-1:0] memory [0:(1<<16)-1];
    
    // DUT
    streaming_nn_system #(
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W),
        .ADDR_W(ADDR_W),
        .NUM_LAYERS(NUM_LAYERS),
        .MEM_ADDR_W(MEM_ADDR_W),
        .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk(clk),
        .rst(rst),
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
        .layer_busy(layer_busy),
        .pipeline_active(pipeline_active)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Memory model - simple 1-cycle read latency
    reg [MEM_ADDR_W-1:0] mem_addr_d;
    always @(posedge clk) begin
        mem_rdata_valid <= 0;
        if (mem_read) begin
            mem_addr_d <= mem_addr;
            mem_rdata <= memory[mem_addr];
            mem_rdata_valid <= 1;
        end
        if (mem_write) begin
            memory[mem_addr] <= mem_wdata;
            $display("Time %0t: Writing output[%0d] = %h", $time, mem_addr - output_base_addr, mem_wdata);
        end
    end
    
    // Statistics
    integer inference_count;
    integer cycle_count;
    integer start_time, end_time;
    
    // Initialize memory with test data
    task init_memory;
        integer i;
        begin
            $display("Initializing memory...");
            
            // Initialize all memory to zero
            for (i = 0; i < (1<<16); i = i + 1) begin
                memory[i] = 0;
            end
            
            // Layer 0 weights: CONV 5x5x1x6 = 150 weights
            // Initialize with small random values
            for (i = 0; i < 150; i = i + 1) begin
                memory[weights_base_addr[0] + i] = $random & 16'hFFFF;
            end
            
            // Layer 2 weights: CONV 5x5x6x16 = 2400 weights
            for (i = 0; i < 2400; i = i + 1) begin
                memory[weights_base_addr[2] + i] = $random & 16'hFFFF;
            end
            
            // Input image: 28x28x1 = 784 pixels
            // Initialize with test pattern
            for (i = 0; i < 784; i = i + 1) begin
                memory[input_base_addr + i] = (i % 256) * 256;  // Gradient pattern
            end
            
            $display("Memory initialization complete");
        end
    endtask
    
    // Test stimulus
    initial begin
        // Waveform dump
        $dumpfile("streaming_nn_tb.vcd");
        $dumpvars(0, tb_streaming_nn_system);
        
        // Initialize
        rst = 1;
        start_inference = 0;
        load_weights = 0;
        inference_count = 0;
        cycle_count = 0;
        
        // Configure memory addresses
        input_base_addr = 20'h00000;
        output_base_addr = 20'h10000;
        weights_base_addr[0] = 20'h20000;  // Layer 0 weights
        weights_base_addr[1] = 20'h20100;  // Layer 1 (no weights, but need address)
        weights_base_addr[2] = 20'h30000;  // Layer 2 weights
        weights_base_addr[3] = 20'h30A00;  // Layer 3 (no weights)
        
        // Initialize memory
        init_memory();
        
        // Reset
        #(CLK_PERIOD * 10);
        rst = 0;
        #(CLK_PERIOD * 5);
        
        $display("\n=== Streaming NN Pipeline System Test ===\n");
        
        // Load weights
        $display("--- Loading Weights ---");
        load_weights = 1;
        #(CLK_PERIOD);
        load_weights = 0;
        
        wait(weights_loaded);
        $display("Weights loaded successfully at time %0t", $time);
        #(CLK_PERIOD * 10);
        
        // Run multiple inferences
        repeat (2) begin
            $display("\n--- Starting Inference %0d ---", inference_count);
            
            wait(system_ready);
            start_time = $time;
            
            start_inference = 1;
            #(CLK_PERIOD);
            start_inference = 0;
            
            wait(inference_done);
            end_time = $time;
            
            inference_count = inference_count + 1;
            cycle_count = (end_time - start_time) / CLK_PERIOD;
            
            $display("Inference %0d completed at time %0t", inference_count - 1, $time);
            $display("Cycles taken: %0d", cycle_count);
            $display("Throughput: %.2f cycles/inference", cycle_count * 1.0);
            
            #(CLK_PERIOD * 20);
        end
        
        // Summary
        $display("\n=== Test Summary ===");
        $display("Total inferences: %0d", inference_count);
        $display("Pipeline stages: %0d", NUM_LAYERS);
        $display("MAC array width: %0d", N);
        
        // Check some output values
        $display("\nSample output values:");
        $display("Output[0] = %h", memory[output_base_addr + 0]);
        $display("Output[1] = %h", memory[output_base_addr + 1]);
        $display("Output[2] = %h", memory[output_base_addr + 2]);
        $display("Output[255] = %h", memory[output_base_addr + 255]);
        
        $display("\n=== Test Completed Successfully ===\n");
        #(CLK_PERIOD * 100);
        $finish;
    end
    
    // Monitor pipeline activity
    always @(posedge clk) begin
        if (pipeline_active) begin
            // Can add detailed monitoring here
        end
    end
    
    // Timeout watchdog
    initial begin
        #(CLK_PERIOD * 1000000);
        $display("ERROR: Simulation timeout!");
        $finish;
    end
    
    // Layer activity monitor
    integer layer;
    always @(posedge clk) begin
        for (layer = 0; layer < NUM_LAYERS; layer = layer + 1) begin
            if (layer_busy[layer]) begin
                // $display("Time %0t: Layer %0d is busy", $time, layer);
            end
        end
    end

endmodule
