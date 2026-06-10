`timescale 1ns/1ps
// Runtime Resource Manager
// Optimizes allocation of MAC units and memory across layers
// Maintains steady dataflow by balancing resource allocation
//
// NOTE: Array ports flattened to 1-D vectors for Verilog-2001 compatibility.
//   Element i of an N-element W-bit array is [i*W +: W].
//   phase_layer_mask phase p = [p*MAX_LAYERS +: MAX_LAYERS].

module runtime_resource_manager #(
    parameter TOTAL_MAC_UNITS   = 64,
    parameter TOTAL_BRAM_BLOCKS = 32,
    parameter MAX_LAYERS        = 16,
    parameter DATA_W            = 16
)(
    input  wire clk,
    input  wire rst,

    // Layer configuration input (flattened)
    input  wire [MAX_LAYERS-1:0]        layer_valid,
    input  wire [2*MAX_LAYERS-1:0]      layer_type,       // [i*2 +: 2]: 0=CONV,1=POOL,2=FC
    input  wire [16*MAX_LAYERS-1:0]     layer_ops,        // [i*16 +: 16] total operations
    input  wire [16*MAX_LAYERS-1:0]     layer_data_size,  // [i*16 +: 16] input data size

    // Resource allocation output (flattened)
    output reg  [8*MAX_LAYERS-1:0]      layer_mac_alloc,  // [i*8 +: 8]
    output reg  [8*MAX_LAYERS-1:0]      layer_mem_alloc,  // [i*8 +: 8]
    output reg  [7:0]                   num_execution_phases,
    output reg  [MAX_LAYERS*8-1:0]      phase_layer_mask, // [p*MAX_LAYERS +: MAX_LAYERS]
    output reg                          allocation_ready,

    // Runtime statistics
    output reg [15:0] mac_efficiency,
    output reg [15:0] mem_efficiency,
    output reg [31:0] estimated_cycles
);

    // =========================================================================
    // LAYER ANALYSIS
    // =========================================================================

    reg [31:0] layer_compute_cycles  [0:MAX_LAYERS-1];
    reg [31:0] layer_memory_accesses [0:MAX_LAYERS-1];
    reg [7:0]  layer_priority        [0:MAX_LAYERS-1];

    task analyze_layer_requirements;
        integer i;
        begin
            for (i = 0; i < MAX_LAYERS; i = i + 1) begin
                if (layer_valid[i]) begin
                    layer_compute_cycles[i]  = layer_ops[i*16 +: 16];
                    layer_memory_accesses[i] = layer_data_size[i*16 +: 16] * 2;

                    if (layer_ops[i*16 +: 16] > layer_data_size[i*16 +: 16] * 4)
                        layer_priority[i] = 8'd200;  // Compute-bound
                    else
                        layer_priority[i] = 8'd100;  // Memory-bound
                end
            end
        end
    endtask

    // =========================================================================
    // RESOURCE ALLOCATION ALGORITHM
    // =========================================================================

    function [7:0] calculate_mac_allocation;
        input [15:0] ops;
        input [7:0]  mac_prio;        // renamed: 'priority' is an SV keyword
        input [7:0]  available_macs;
        reg [15:0] ideal_macs;
        begin
            ideal_macs = ops / 1000;
            if (ideal_macs > available_macs)
                calculate_mac_allocation = available_macs;
            else if (ideal_macs < 4)
                calculate_mac_allocation = 4;
            else
                calculate_mac_allocation = ideal_macs[7:0];
        end
    endfunction

    function [7:0] calculate_mem_allocation;
        input [15:0] data_size;
        input [7:0]  available_mem;
        reg [7:0] needed_mem;
        begin
            needed_mem = 3;
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

    task schedule_execution_phases;
        integer phase, layer_idx;
        integer phase_macs, phase_mem;
        integer can_add;
        begin
            phase = 0;

            for (phase = 0; phase < 8; phase = phase + 1)
                phase_layer_mask[phase*MAX_LAYERS +: MAX_LAYERS] = 0;

            phase      = 0;
            phase_macs = 0;
            phase_mem  = 0;

            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (layer_valid[layer_idx]) begin
                    can_add = 1;

                    if (phase_macs + layer_mac_alloc[layer_idx*8 +: 8] > TOTAL_MAC_UNITS)
                        can_add = 0;
                    if (phase_mem  + layer_mem_alloc[layer_idx*8 +: 8] > TOTAL_BRAM_BLOCKS)
                        can_add = 0;

                    if (can_add) begin
                        phase_layer_mask[phase*MAX_LAYERS + layer_idx] = 1;
                        phase_macs = phase_macs + layer_mac_alloc[layer_idx*8 +: 8];
                        phase_mem  = phase_mem  + layer_mem_alloc[layer_idx*8 +: 8];
                    end else begin
                        phase      = phase + 1;
                        phase_macs = layer_mac_alloc[layer_idx*8 +: 8];
                        phase_mem  = layer_mem_alloc[layer_idx*8 +: 8];
                        phase_layer_mask[phase*MAX_LAYERS + layer_idx] = 1;
                    end
                end
            end

            num_execution_phases = phase + 1;
        end
    endtask

    // =========================================================================
    // DATAFLOW BALANCING
    // =========================================================================

    task balance_phase_execution;
        input integer phase_idx;
        integer layer_idx;
        integer max_cycles, min_cycles;
        integer avg_cycles;           // was 'real' — not synthesisable; use integer
        integer total_layers_in_phase;
        begin
            max_cycles            = 0;
            min_cycles            = 32'h7FFFFFFF;
            total_layers_in_phase = 0;

            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (phase_layer_mask[phase_idx*MAX_LAYERS + layer_idx]) begin
                    if (layer_compute_cycles[layer_idx] > max_cycles)
                        max_cycles = layer_compute_cycles[layer_idx];
                    if (layer_compute_cycles[layer_idx] < min_cycles)
                        min_cycles = layer_compute_cycles[layer_idx];
                    total_layers_in_phase = total_layers_in_phase + 1;
                end
            end

            avg_cycles = (max_cycles + min_cycles) / 2;

            // 0.8 x avg  →  (avg*4)/5   and   1.2 x avg  →  (avg*6)/5
            for (layer_idx = 0; layer_idx < MAX_LAYERS; layer_idx = layer_idx + 1) begin
                if (phase_layer_mask[phase_idx*MAX_LAYERS + layer_idx]) begin
                    if (layer_compute_cycles[layer_idx] * 5 < avg_cycles * 4) begin
                        if (layer_mac_alloc[layer_idx*8 +: 8] > 4)
                            layer_mac_alloc[layer_idx*8 +: 8] =
                                layer_mac_alloc[layer_idx*8 +: 8] -
                                (layer_mac_alloc[layer_idx*8 +: 8] / 4);
                    end else if (layer_compute_cycles[layer_idx] * 5 > avg_cycles * 6) begin
                        layer_mac_alloc[layer_idx*8 +: 8] =
                            layer_mac_alloc[layer_idx*8 +: 8] + 4;
                    end
                end
            end
        end
    endtask

    // =========================================================================
    // MAIN ALLOCATION PROCESS
    // =========================================================================

    reg [2:0] alloc_state;
    localparam ALLOC_IDLE     = 3'd0;
    localparam ALLOC_ANALYZE  = 3'd1;
    localparam ALLOC_INITIAL  = 3'd2;
    localparam ALLOC_SCHEDULE = 3'd3;
    localparam ALLOC_BALANCE  = 3'd4;
    localparam ALLOC_DONE     = 3'd5;

    integer alloc_layer_idx;
    integer alloc_phase_idx;
    integer available_macs_count;
    integer available_mem_count;
    integer alloc_i, alloc_j, max_in_phase;  // loop vars for ALLOC_DONE

    always @(posedge clk) begin
        if (rst) begin
            alloc_state          <= ALLOC_IDLE;
            allocation_ready     <= 0;
            estimated_cycles     <= 0;
            alloc_layer_idx      <= 0;
            alloc_phase_idx      <= 0;
            available_macs_count <= TOTAL_MAC_UNITS;
            available_mem_count  <= TOTAL_BRAM_BLOCKS;
        end else begin
            case (alloc_state)
                ALLOC_IDLE: begin
                    if (|layer_valid) begin
                        alloc_state          <= ALLOC_ANALYZE;
                        available_macs_count <= TOTAL_MAC_UNITS;
                        available_mem_count  <= TOTAL_BRAM_BLOCKS;
                    end
                end

                ALLOC_ANALYZE: begin
                    analyze_layer_requirements();
                    alloc_layer_idx <= 0;
                    alloc_state     <= ALLOC_INITIAL;
                end

                ALLOC_INITIAL: begin
                    if (alloc_layer_idx < MAX_LAYERS) begin
                        if (layer_valid[alloc_layer_idx]) begin
                            layer_mac_alloc[alloc_layer_idx*8 +: 8] <=
                                calculate_mac_allocation(
                                    layer_ops[alloc_layer_idx*16 +: 16],
                                    layer_priority[alloc_layer_idx],
                                    available_macs_count
                                );
                            layer_mem_alloc[alloc_layer_idx*8 +: 8] <=
                                calculate_mem_allocation(
                                    layer_data_size[alloc_layer_idx*16 +: 16],
                                    available_mem_count
                                );
                            available_macs_count <= available_macs_count -
                                                    layer_mac_alloc[alloc_layer_idx*8 +: 8];
                            available_mem_count  <= available_mem_count  -
                                                    layer_mem_alloc[alloc_layer_idx*8 +: 8];
                        end
                        alloc_layer_idx <= alloc_layer_idx + 1;
                    end else begin
                        alloc_state <= ALLOC_SCHEDULE;
                    end
                end

                ALLOC_SCHEDULE: begin
                    schedule_execution_phases();
                    alloc_phase_idx <= 0;
                    alloc_state     <= ALLOC_BALANCE;
                end

                ALLOC_BALANCE: begin
                    if (alloc_phase_idx < num_execution_phases) begin
                        balance_phase_execution(alloc_phase_idx);
                        alloc_phase_idx <= alloc_phase_idx + 1;
                    end else begin
                        alloc_state <= ALLOC_DONE;
                    end
                end

                ALLOC_DONE: begin
                    allocation_ready <= 1;

                    mac_efficiency <= (TOTAL_MAC_UNITS   * 10000) / TOTAL_MAC_UNITS;
                    mem_efficiency <= (TOTAL_BRAM_BLOCKS * 10000) / TOTAL_BRAM_BLOCKS;

                    estimated_cycles <= 0;
                    for (alloc_i = 0; alloc_i < num_execution_phases; alloc_i = alloc_i + 1) begin
                        max_in_phase = 0;
                        for (alloc_j = 0; alloc_j < MAX_LAYERS; alloc_j = alloc_j + 1) begin
                            if (phase_layer_mask[alloc_i*MAX_LAYERS + alloc_j]) begin
                                if (layer_compute_cycles[alloc_j] > max_in_phase)
                                    max_in_phase = layer_compute_cycles[alloc_j];
                            end
                        end
                        estimated_cycles <= estimated_cycles + max_in_phase;
                    end

                    alloc_state <= ALLOC_IDLE;
                end

                default: alloc_state <= ALLOC_IDLE;
            endcase
        end
    end

endmodule
