// Runtime Resource Manager
// Optimizes allocation of MAC units and memory across layers
// Maintains steady dataflow by balancing resource allocation

module runtime_resource_manager #(
    parameter TOTAL_MAC_UNITS = 64,
    parameter TOTAL_BRAM_BLOCKS = 32,
    parameter MAX_LAYERS = 16,
    parameter DATA_W = 16
)(
    input wire clk,
    input wire rst,
    
    // Layer configuration input
    input wire [MAX_LAYERS-1:0] layer_valid,
    input wire [1:0] layer_type [0:MAX_LAYERS-1],       // 0=CONV, 1=POOL, 2=FC
    input wire [15:0] layer_ops [0:MAX_LAYERS-1],       // Total operations
    input wire [15:0] layer_data_size [0:MAX_LAYERS-1], // Input data size
    
    // Resource allocation output
    output reg [7:0] layer_mac_alloc [0:MAX_LAYERS-1],
    output reg [7:0] layer_mem_alloc [0:MAX_LAYERS-1],
    output reg [7:0] num_execution_phases,
    output reg [MAX_LAYERS-1:0] phase_layer_mask [0:7], // Which layers in each phase
    output reg allocation_ready,
    
    // Runtime statistics
    output reg [15:0] mac_efficiency,    // Utilization percentage
    output reg [15:0] mem_efficiency,
    output reg [31:0] estimated_cycles
);

    // =========================================================================
    // LAYER ANALYSIS
    // =========================================================================
    
    // Compute requirements per layer
    reg [31:0] layer_compute_cycles [0:MAX_LAYERS-1];
    reg [31:0] layer_memory_accesses [0:MAX_LAYERS-1];
    reg [7:0]  layer_priority [0:MAX_LAYERS-1];
    
    // Analyze computational requirements
    task analyze_layer_requirements;
        integer i;
        begin
            for (i = 0; i < MAX_LAYERS; i = i + 1) begin
                if (layer_valid[i]) begin
                    // Estimate cycles needed based on operations
                    layer_compute_cycles[i] = layer_ops[i];
                    
                    // Estimate memory accesses
                    layer_memory_accesses[i] = layer_data_size[i] * 2; // Read + Write
                    
                    // Calculate priority (compute-bound layers get more MACs)
                    if (layer_ops[i] > layer_data_size[i] * 4) begin
                        layer_priority[i] = 8'd200; // Compute-bound
                    end else begin
                        layer_priority[i] = 8'd100; // Memory-bound
                    end
                end
            end
        end
    endtask
    
    // =========================================================================
    // RESOURCE ALLOCATION ALGORITHM
    // =========================================================================
    
    // Allocation strategy: Balance compute and memory bandwidth
    
    function [7:0] calculate_mac_allocation;
        input [15:0] ops;
        input [7:0] priority;
        input [7:0] available_macs;
        reg [15:0] ideal_macs;
        begin
            // Ideal: ops / target_cycles
            ideal_macs = ops / 1000; // Target 1000 cycles per layer
            
            if (ideal_macs > available_macs)
                calculate_mac_allocation = available_macs;
            else if (ideal_macs < 4)
                calculate_mac_allocation = 4; // Minimum allocation
            else
                calculate_mac_allocation = ideal_macs[7:0];
        end
    endfunction
    
    function [7:0] calculate_mem_allocation;
        input [15:0] data_size;
        input [7:0] available_mem;
        reg [7:0] needed_mem;
        begin
            // Need: activation + weight + output BRAMs
            needed_mem = 3;
            
            // Large layers need more memory
            if (data_size > 10000)
                needed_mem = needed_mem + 2;
            
            if (needed_mem > available_mem)
                calculate_mem_allocation = available_mem;
            else
                calculate_mem_allocation = needed_mem;
        end
    endfunction
    
    // =========================================================================
    // PHASE SCHEDULING
    // =========================================================================
    
    // Group layers into execution phases based on:
    // 1. Resource constraints
    // 2. Data dependencies
    // 3. Balanced utilization
    
    task schedule_execution_phases;
        integer phase, layer_idx;
        integer phase_macs, phase_mem;
        integer can_add;
        begin
            phase = 0;
            layer_idx = 0;
            
            // Initialize phase masks
            for (phase = 0; phase < 8; phase = phase + 1) begin
                phase_layer_mask[phase] = 0;
            end
            
            phase = 0;
            phase_macs = 0;
            phase_mem = 0;
            
            // Greedy packing with balance
            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (layer_valid[layer_idx]) begin
                    // Try to add to current phase
                    can_add = 1;
                    
                    // Check resource constraints
                    if (phase_macs + layer_mac_alloc[layer_idx] > TOTAL_MAC_UNITS)
                        can_add = 0;
                    if (phase_mem + layer_mem_alloc[layer_idx] > TOTAL_BRAM_BLOCKS)
                        can_add = 0;
                    
                    if (can_add) begin
                        // Add to current phase
                        phase_layer_mask[phase][layer_idx] = 1;
                        phase_macs = phase_macs + layer_mac_alloc[layer_idx];
                        phase_mem = phase_mem + layer_mem_alloc[layer_idx];
                    end else begin
                        // Move to next phase
                        phase = phase + 1;
                        phase_macs = layer_mac_alloc[layer_idx];
                        phase_mem = layer_mem_alloc[layer_idx];
                        phase_layer_mask[phase][layer_idx] = 1;
                    end
                end
            end
            
            num_execution_phases = phase + 1;
        end
    endtask
    
    // =========================================================================
    // DATAFLOW BALANCING
    // =========================================================================
    
    // Adjust allocations to maintain steady dataflow
    // Goal: All layers in a phase finish at approximately same time
    
    task balance_phase_execution;
        input integer phase_idx;
        integer layer_idx;
        integer max_cycles, min_cycles;
        real avg_cycles;
        integer total_layers_in_phase;
        begin
            max_cycles = 0;
            min_cycles = 32'hFFFFFFFF;
            total_layers_in_phase = 0;
            
            // Find max and min execution times in phase
            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (phase_layer_mask[phase_idx][layer_idx]) begin
                    if (layer_compute_cycles[layer_idx] > max_cycles)
                        max_cycles = layer_compute_cycles[layer_idx];
                    if (layer_compute_cycles[layer_idx] < min_cycles)
                        min_cycles = layer_compute_cycles[layer_idx];
                    total_layers_in_phase = total_layers_in_phase + 1;
                end
            end
            
            avg_cycles = (max_cycles + min_cycles) / 2;
            
            // Rebalance: Fast layers get fewer MACs, slow layers get more
            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (phase_layer_mask[phase_idx][layer_idx]) begin
                    if (layer_compute_cycles[layer_idx] < avg_cycles * 0.8) begin
                        // This layer is too fast, reduce MACs
                        if (layer_mac_alloc[layer_idx] > 4) begin
                            layer_mac_alloc[layer_idx] = layer_mac_alloc[layer_idx] - 
                                                         (layer_mac_alloc[layer_idx] / 4);
                        end
                    end else if (layer_compute_cycles[layer_idx] > avg_cycles * 1.2) begin
                        // This layer is too slow, add MACs if available
                        layer_mac_alloc[layer_idx] = layer_mac_alloc[layer_idx] + 4;
                    end
                end
            end
        end
    endtask
    
    // =========================================================================
    // MAIN ALLOCATION PROCESS
    // =========================================================================
    
    reg [2:0] alloc_state;
    localparam ALLOC_IDLE = 0;
    localparam ALLOC_ANALYZE = 1;
    localparam ALLOC_INITIAL = 2;
    localparam ALLOC_SCHEDULE = 3;
    localparam ALLOC_BALANCE = 4;
    localparam ALLOC_DONE = 5;
    
    integer alloc_layer_idx;
    integer alloc_phase_idx;
    integer available_macs_count;
    integer available_mem_count;
    
    always @(posedge clk) begin
        if (rst) begin
            alloc_state <= ALLOC_IDLE;
            allocation_ready <= 0;
            alloc_layer_idx <= 0;
            alloc_phase_idx <= 0;
            available_macs_count <= TOTAL_MAC_UNITS;
            available_mem_count <= TOTAL_BRAM_BLOCKS;
            
        end else begin
            case (alloc_state)
                ALLOC_IDLE: begin
                    if (|layer_valid) begin
                        alloc_state <= ALLOC_ANALYZE;
                        available_macs_count <= TOTAL_MAC_UNITS;
                        available_mem_count <= TOTAL_BRAM_BLOCKS;
                    end
                end
                
                ALLOC_ANALYZE: begin
                    // Analyze layer requirements
                    analyze_layer_requirements();
                    alloc_layer_idx <= 0;
                    alloc_state <= ALLOC_INITIAL;
                end
                
                ALLOC_INITIAL: begin
                    // Initial resource allocation
                    if (alloc_layer_idx < MAX_LAYERS) begin
                        if (layer_valid[alloc_layer_idx]) begin
                            // Allocate MACs
                            layer_mac_alloc[alloc_layer_idx] <= 
                                calculate_mac_allocation(
                                    layer_ops[alloc_layer_idx],
                                    layer_priority[alloc_layer_idx],
                                    available_macs_count
                                );
                            
                            // Allocate Memory
                            layer_mem_alloc[alloc_layer_idx] <= 
                                calculate_mem_allocation(
                                    layer_data_size[alloc_layer_idx],
                                    available_mem_count
                                );
                            
                            // Update available counts (temporary)
                            available_macs_count <= available_macs_count - 
                                                   layer_mac_alloc[alloc_layer_idx];
                            available_mem_count <= available_mem_count - 
                                                  layer_mem_alloc[alloc_layer_idx];
                        end
                        
                        alloc_layer_idx <= alloc_layer_idx + 1;
                    end else begin
                        alloc_state <= ALLOC_SCHEDULE;
                    end
                end
                
                ALLOC_SCHEDULE: begin
                    // Schedule layers into phases
                    schedule_execution_phases();
                    alloc_phase_idx <= 0;
                    alloc_state <= ALLOC_BALANCE;
                end
                
                ALLOC_BALANCE: begin
                    // Balance execution within each phase
                    if (alloc_phase_idx < num_execution_phases) begin
                        balance_phase_execution(alloc_phase_idx);
                        alloc_phase_idx <= alloc_phase_idx + 1;
                    end else begin
                        alloc_state <= ALLOC_DONE;
                    end
                end
                
                ALLOC_DONE: begin
                    allocation_ready <= 1;
                    
                    // Calculate efficiency metrics
                    mac_efficiency <= (TOTAL_MAC_UNITS * 10000) / TOTAL_MAC_UNITS; // Placeholder
                    mem_efficiency <= (TOTAL_BRAM_BLOCKS * 10000) / TOTAL_BRAM_BLOCKS;
                    
                    // Estimate total cycles
                    estimated_cycles <= 0;
                    for (integer i = 0; i < num_execution_phases; i = i + 1) begin
                        // Find longest layer in phase
                        integer max_in_phase = 0;
                        for (integer j = 0; j < MAX_LAYERS; j = j + 1) begin
                            if (phase_layer_mask[i][j]) begin
                                if (layer_compute_cycles[j] > max_in_phase)
                                    max_in_phase = layer_compute_cycles[j];
                            end
                        end
                        estimated_cycles <= estimated_cycles + max_in_phase;
                    end
                    
                    alloc_state <= ALLOC_IDLE;
                end
            endcase
        end
    end

endmodule
