`timescale 1ns/1ps

// Comprehensive Golden Model Comparison Testbench
// Loads TensorFlow golden outputs and compares with hardware at each layer

module tb_hw_vs_golden;

    parameter CLK_PERIOD = 10;
    parameter N = 8;
    parameter DATA_W = 16;
    parameter ACC_W = 32;
    parameter ADDR_W = 10;
    parameter NUM_LAYERS = 4;
    parameter MEM_ADDR_W = 20;
    parameter MEM_DATA_W = 32;
    
    // Comparison tolerances
    parameter real TOLERANCE_PERCENT = 5.0;  // 5% tolerance
    parameter integer ABS_TOLERANCE_FP = 32;  // In fixed point (0.125 in Q8.8)
    
    // Clock and reset
    reg clk;
    reg rst;
    
    // Control
    reg start_inference;
    wire inference_done;
    wire system_ready;
    reg load_weights;
    wire weights_loaded;
    
    // Memory interface
    reg [MEM_DATA_W-1:0] memory [0:(1<<16)-1];
    wire [MEM_ADDR_W-1:0] mem_addr;
    wire mem_read;
    reg [MEM_DATA_W-1:0] mem_rdata;
    reg mem_rdata_valid;
    wire mem_write;
    wire [MEM_DATA_W-1:0] mem_wdata;
    
    // Configuration
    reg [MEM_ADDR_W-1:0] input_base_addr;
    reg [MEM_ADDR_W-1:0] output_base_addr;
    reg [MEM_ADDR_W-1:0] weights_base_addr_0;
    reg [MEM_ADDR_W-1:0] weights_base_addr_1;
    reg [MEM_ADDR_W-1:0] weights_base_addr_2;
    reg [MEM_ADDR_W-1:0] weights_base_addr_3;
    
    // Status
    wire [NUM_LAYERS-1:0] layer_busy;
    wire pipeline_active;
    
    // Golden reference storage
    reg [ACC_W-1:0] golden_layer_output [0:3][0:16383];  // [layer][address]
    
    // Test statistics
    integer total_tests = 0;
    integer passed_tests = 0;
    integer failed_tests = 0;
    
    // Per-layer statistics
    integer layer_comparisons [0:NUM_LAYERS-1];
    integer layer_passed [0:NUM_LAYERS-1];
    integer layer_failed [0:NUM_LAYERS-1];
    real layer_max_error [0:NUM_LAYERS-1];
    real layer_mean_error [0:NUM_LAYERS-1];
    
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
    .weights_base_addr_0(weights_base_addr_0),
    .weights_base_addr_1(weights_base_addr_1),
    .weights_base_addr_2(weights_base_addr_2),
    .weights_base_addr_3(weights_base_addr_3),       
        .layer_busy(layer_busy),
        .pipeline_active(pipeline_active)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    // Memory model
    always @(posedge clk) begin
        mem_rdata_valid <= 0;
        if (mem_read) begin
            mem_rdata <= memory[mem_addr];
            mem_rdata_valid <= 1;
        end
        if (mem_write) begin
            memory[mem_addr] <= mem_wdata;
        end
    end
    
    // Fixed point conversion functions
    function real fixed_to_real;
        input [ACC_W-1:0] fixed_val;
        integer signed val;
        begin
            val = fixed_val;
            fixed_to_real = val / 256.0;  // Q8.8 format
        end
    endfunction
    
    function [ACC_W-1:0] real_to_fixed;
        input real val;
        integer signed fixed;
        begin
            fixed = $rtoi(val * 256.0);
            real_to_fixed = fixed;
        end
    endfunction
    
    // Load golden reference for a layer
    task load_golden_layer;
        input integer sample_idx;
        input integer layer_idx;
        string filename;
        integer file;
        integer addr;
        integer value;
        integer scan_result;
        begin
            $sformat(filename, "hw_export/sample_%0d/layer%0d_output.mem", sample_idx, layer_idx);
            file = $fopen(filename, "r");
            
            if (file == 0) begin
                $display("ERROR: Cannot open %s", filename);
                $finish;
            end
            
            $display("Loading golden data: %s", filename);
            
            while (!$feof(file)) begin
                scan_result = $fscanf(file, "@%h %h\n", addr, value);
                if (scan_result == 2) begin
                    golden_layer_output[layer_idx][addr] = value;
                end
            end
            
            $fclose(file);
        end
    endtask
    
    // Compare single value
    function bit compare_value;
        input [ACC_W-1:0] hw_val;
        input [ACC_W-1:0] golden_val;
        input integer layer_idx;
        real hw_real, golden_real, diff, rel_error;
        real threshold;
        begin
            hw_real = fixed_to_real(hw_val);
            golden_real = fixed_to_real(golden_val);
            diff = hw_real - golden_real;
            if (diff < 0) diff = -diff;
            
            // Calculate relative error
            if (golden_real != 0)
                rel_error = (diff / golden_real) * 100.0;
            else
                rel_error = 0;
            
            // Threshold is percentage of golden value or absolute minimum
            threshold = golden_real * TOLERANCE_PERCENT / 100.0;
            if (threshold < 0) threshold = -threshold;
            if (threshold < fixed_to_real(ABS_TOLERANCE_FP))
                threshold = fixed_to_real(ABS_TOLERANCE_FP);
            
            compare_value = (diff <= threshold);
            
            // Update statistics
            total_tests = total_tests + 1;
            layer_comparisons[layer_idx] = layer_comparisons[layer_idx] + 1;
            
            if (compare_value) begin
                passed_tests = passed_tests + 1;
                layer_passed[layer_idx] = layer_passed[layer_idx] + 1;
            end else begin
                failed_tests = failed_tests + 1;
                layer_failed[layer_idx] = layer_failed[layer_idx] + 1;
                
                // Print mismatch
                $display("  MISMATCH @ addr=%h: HW=%.6f, Golden=%.6f, Diff=%.6f (%.2f%%)",
                        layer_comparisons[layer_idx] - 1, hw_real, golden_real, diff, rel_error);
            end
            
            // Update error statistics
            if (diff > layer_max_error[layer_idx])
                layer_max_error[layer_idx] = diff;
            layer_mean_error[layer_idx] = layer_mean_error[layer_idx] + diff;
        end
    endfunction
    
    // Compare layer outputs
    task compare_layer;
        input integer sample_idx;
        input integer layer_idx;
        input integer num_outputs;
        integer i;
        reg [ACC_W-1:0] hw_output;
        integer mismatches;
        begin
            $display("\n--- Comparing Layer %0d ---", layer_idx);
            
            // Load golden reference
            load_golden_layer(sample_idx, layer_idx);
            
            // Reset layer statistics
            layer_comparisons[layer_idx] = 0;
            layer_passed[layer_idx] = 0;
            layer_failed[layer_idx] = 0;
            layer_max_error[layer_idx] = 0;
            layer_mean_error[layer_idx] = 0;
            
            mismatches = 0;
            
            // Compare each output
            for (i = 0; i < num_outputs; i = i + 1) begin
                // Read hardware output from the layer's output memory
                // Access path depends on hierarchy
                case (layer_idx)
                    0: hw_output = dut.pipeline.layer_0.out_mem[i];
                    1: hw_output = dut.pipeline.layer_1.out_mem[i];
                    2: hw_output = dut.pipeline.layer_2.out_mem[i];
                    3: hw_output = dut.pipeline.layer_3.out_mem[i];
                endcase
                
                if (!compare_value(hw_output, golden_layer_output[layer_idx][i], layer_idx)) begin
                    mismatches = mismatches + 1;
                    if (mismatches <= 10) begin  // Only print first 10 mismatches
                        // Mismatch already printed in compare_value
                    end
                end
            end
            
            // Calculate mean error
            if (layer_comparisons[layer_idx] > 0)
                layer_mean_error[layer_idx] = layer_mean_error[layer_idx] / layer_comparisons[layer_idx];
            
            // Print layer summary
            $display("\nLayer %0d Summary:", layer_idx);
            $display("  Total comparisons: %0d", layer_comparisons[layer_idx]);
            $display("  Passed: %0d", layer_passed[layer_idx]);
            $display("  Failed: %0d", layer_failed[layer_idx]);
            $display("  Pass rate: %.2f%%", 
                    (layer_passed[layer_idx] * 100.0) / layer_comparisons[layer_idx]);
            $display("  Max error: %.6f", layer_max_error[layer_idx]);
            $display("  Mean error: %.6f", layer_mean_error[layer_idx]);
        end
    endtask
    
    // Compare intermediate MAC products (if accessible)
    task compare_mac_products;
        input integer sample_idx;
        input integer layer_idx;
        // This would compare individual MAC operation results
        // Requires exposing intermediate signals from MAC array
        begin
            $display("MAC product comparison not yet implemented");
        end
    endtask
    
    // Load input test vector
    task load_input_sample;
        input integer sample_idx;
        string filename;
        integer file, addr, value, scan_result;
        begin
            $sformat(filename, "hw_export/sample_%0d/input.mem", sample_idx);
            file = $fopen(filename, "r");
            
            if (file == 0) begin
                $display("ERROR: Cannot open %s", filename);
                $finish;
            end
            
            $display("Loading input sample: %s", filename);
            
            while (!$feof(file)) begin
                scan_result = $fscanf(file, "@%h %h\n", addr, value);
                if (scan_result == 2) begin
                    memory[input_base_addr + addr] = value;
                end
            end
            
            $fclose(file);
        end
    endtask
    
    // Load weights for all layers
    task load_all_weights;
        integer layer_idx;
        string filename;
        integer file, addr, value, scan_result;
        integer base_addr;
        begin
            $display("\nLoading weights for all layers...");
            
            for (layer_idx = 0; layer_idx < NUM_LAYERS; layer_idx = layer_idx + 1) begin
                $sformat(filename, "hw_export/layer%0d_weights.mem", layer_idx);
                file = $fopen(filename, "r");
                
                if (file != 0) begin
                    $display("  Loading layer %0d weights: %s", layer_idx, filename);
                    case (layer_idx)
    0: base_addr = weights_base_addr_0;
    1: base_addr = weights_base_addr_1;
    2: base_addr = weights_base_addr_2;
    3: base_addr = weights_base_addr_3;
endcase
                    
                    while (!$feof(file)) begin
                        scan_result = $fscanf(file, "@%h %h\n", addr, value);
                        if (scan_result == 2) begin
                            memory[base_addr + addr] = value;
                        end
                    end
                    
                    $fclose(file);
                end else begin
                    $display("  Layer %0d has no weights (pooling layer)", layer_idx);
                end
            end
        end
    endtask
    
    // Main test
    initial begin
        $dumpfile("hw_vs_golden.vcd");
        $dumpvars(0, tb_hw_vs_golden);
        
        // Initialize
        rst = 1;
        start_inference = 0;
        load_weights = 0;
        
        // Configure addresses
        input_base_addr = 20'h00000;
        output_base_addr = 20'h10000;
        weights_base_addr_0 = 20'h20000;
    weights_base_addr_1 = 20'h20100;
    weights_base_addr_2 = 20'h30000;
    weights_base_addr_3 = 20'h30A00;;
        
        total_tests = 0;
        passed_tests = 0;
        failed_tests = 0;
        
        #(CLK_PERIOD * 10);
        rst = 0;
        #(CLK_PERIOD * 5);
        
        $display("================================================================================");
        $display("Hardware vs Golden Model Comparison Test");
        $display("================================================================================");
        
        // Load weights into memory
        load_all_weights();
        
        // Trigger weight loading in hardware
        $display("\nLoading weights into hardware...");
        load_weights = 1;
        #(CLK_PERIOD);
        load_weights = 0;
        
        wait(weights_loaded);
        $display("Weights loaded successfully");
        #(CLK_PERIOD * 10);
        
        // Test each sample
        begin : test_samples
            integer sample_idx;
            
            for (sample_idx = 0; sample_idx < 2; sample_idx = sample_idx + 1) begin
                $display("================================================================================");
                $display("Testing Sample %0d", sample_idx);
                $display("================================================================================");
                
                // Load input
                load_input_sample(sample_idx);
                
                // Run inference
                wait(system_ready);
                start_inference = 1;
                #(CLK_PERIOD);
                start_inference = 0;
                
                // Wait for completion
                wait(inference_done);
                $display("\nInference complete");
                
                // Give time for outputs to settle
                #(CLK_PERIOD * 20);
                
                // Compare each layer's output
                // Layer 0: CONV 5x5, 1->6, 28x28 input -> 24x24x6 output
                compare_layer(sample_idx, 0, 24*24*6);
                
                // Layer 1: POOL 2x2, 24x24x6 -> 12x12x6
                compare_layer(sample_idx, 1, 12*12*6);
                
                // Layer 2: CONV 5x5, 6->16, 12x12x6 -> 8x8x16
                compare_layer(sample_idx, 2, 8*8*16);
                
                // Layer 3: POOL 2x2, 8x8x16 -> 4x4x16
                compare_layer(sample_idx, 3, 4*4*16);
                
                #(CLK_PERIOD * 50);
            end
        end
        
        // Final summary
       $display("================================================================================");
        $display("FINAL TEST SUMMARY");
        $display("================================================================================");
        $display("Total comparisons: %0d", total_tests);
        $display("Passed: %0d", passed_tests);
        $display("Failed: %0d", failed_tests);
        $display("Overall pass rate: %.2f%%", (passed_tests * 100.0) / total_tests);
        
        $display("\nPer-Layer Summary:");
        for (integer i = 0; i < NUM_LAYERS; i = i + 1) begin
            if (layer_comparisons[i] > 0) begin
                $display("  Layer %0d: %.2f%% pass rate, max error: %.6f",
                        i, 
                        (layer_passed[i] * 100.0) / layer_comparisons[i],
                        layer_max_error[i]);
            end
        end
        
        if (failed_tests == 0) begin
            $display("\n*** ALL TESTS PASSED ***");
        end else begin
            $display("\n*** TESTS FAILED - %0d mismatches found ***", failed_tests);
        end
        
        #(CLK_PERIOD * 100);
        $finish;
    end
    
    // Timeout watchdog
    initial begin
        #(CLK_PERIOD * 500000);
        $display("ERROR: Simulation timeout!");
        $finish;
    end

endmodule
