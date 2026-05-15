// Reconfigurable Neural Network Accelerator
// Dynamically allocates MAC units and memory across virtual pipeline stages
// Executes deep networks by folding layers onto limited hardware resources

module reconfigurable_nn_accelerator #(
    // Total hardware resources available
    parameter TOTAL_MAC_UNITS = 64,      // Total MAC units on chip
    parameter TOTAL_BRAM_BLOCKS = 32,    // Total BRAM blocks
    parameter BRAM_DEPTH = 1024,         // Depth per BRAM block
    parameter DATA_W = 16,
    parameter ACC_W = 32,
    
    // Maximum layers and stages
    parameter MAX_LAYERS = 16,           // Maximum layers in network
    parameter MAX_VIRTUAL_STAGES = 4,    // Maximum concurrent virtual stages
    
    // Configuration parameters
    parameter CONFIG_W = 32              // Configuration register width
)(
    input wire clk,
    input wire rst,
    
    // Configuration interface
    input wire config_valid,
    input wire [CONFIG_W-1:0] config_data,
    input wire [7:0] config_addr,
    output reg config_done,
    
    // Control interface
    input wire start_network,
    output reg network_done,
    output reg network_busy,
    
    // External memory interface (for large weights/data)
    output reg [31:0] ext_mem_addr,
    output reg ext_mem_read,
    input wire [127:0] ext_mem_rdata,
    input wire ext_mem_rdata_valid,
    output reg ext_mem_write,
    output reg [127:0] ext_mem_wdata,
    
    // Status and debug
    output reg [7:0] current_layer_idx,
    output reg [7:0] current_virtual_stage,
    output wire [MAX_VIRTUAL_STAGES-1:0] stage_active,
    output wire [15:0] mac_utilization,    // Percentage * 100
    output wire [15:0] mem_utilization     // Percentage * 100
);

    // =========================================================================
    // CONFIGURATION REGISTERS
    // =========================================================================
    
    // Network configuration
    reg [7:0] total_layers;                          // Total layers in network
    reg [7:0] num_virtual_stages;                    // Number of concurrent stages
    
    // Per-layer configuration
    reg [1:0]  layer_type [0:MAX_LAYERS-1];         // CONV=0, POOL=1, FC=2
    reg [7:0]  layer_in_h [0:MAX_LAYERS-1];
    reg [7:0]  layer_in_w [0:MAX_LAYERS-1];
    reg [7:0]  layer_in_c [0:MAX_LAYERS-1];
    reg [7:0]  layer_out_h [0:MAX_LAYERS-1];
    reg [7:0]  layer_out_w [0:MAX_LAYERS-1];
    reg [7:0]  layer_out_c [0:MAX_LAYERS-1];
    reg [7:0]  layer_kernel_size [0:MAX_LAYERS-1];
    reg [7:0]  layer_stride [0:MAX_LAYERS-1];
    
    // Per-layer resource allocation (runtime configurable)
    reg [7:0]  layer_mac_units [0:MAX_LAYERS-1];    // MACs allocated to this layer
    reg [7:0]  layer_bram_blocks [0:MAX_LAYERS-1];  // BRAMs allocated to this layer
    reg [31:0] layer_weight_addr [0:MAX_LAYERS-1];  // External memory address for weights
    
    // Virtual stage mapping (which layers are in which virtual stage)
    reg [7:0]  virtual_stage_layers [0:MAX_VIRTUAL_STAGES-1][0:7]; // Up to 8 layers per stage
    reg [3:0]  virtual_stage_num_layers [0:MAX_VIRTUAL_STAGES-1];
    
    // =========================================================================
    // RESOURCE ALLOCATION TRACKING
    // =========================================================================
    
    reg [7:0] allocated_macs [0:MAX_LAYERS-1];      // MACs currently allocated
    reg [7:0] allocated_brams [0:MAX_LAYERS-1];     // BRAMs currently allocated
    
    reg [7:0] total_allocated_macs;
    reg [7:0] total_allocated_brams;
    
    wire [7:0] available_macs = TOTAL_MAC_UNITS - total_allocated_macs;
    wire [7:0] available_brams = TOTAL_BRAM_BLOCKS - total_allocated_brams;
    
    // Utilization calculation
    assign mac_utilization = (total_allocated_macs * 10000) / TOTAL_MAC_UNITS;
    assign mem_utilization = (total_allocated_brams * 10000) / TOTAL_BRAM_BLOCKS;
    
    // =========================================================================
    // RECONFIGURABLE MAC ARRAY POOL
    // =========================================================================
    
    // Pool of MAC units that can be dynamically assigned
    wire [DATA_W-1:0] mac_pool_a_in [0:TOTAL_MAC_UNITS-1];
    wire [DATA_W-1:0] mac_pool_w_in [0:TOTAL_MAC_UNITS-1];
    wire [ACC_W-1:0]  mac_pool_p_in [0:TOTAL_MAC_UNITS-1];
    wire [ACC_W-1:0]  mac_pool_out [0:TOTAL_MAC_UNITS-1];
    wire              mac_pool_enable [0:TOTAL_MAC_UNITS-1];
    
    // MAC allocation table: which layer uses which MACs
    reg [4:0] mac_to_layer [0:TOTAL_MAC_UNITS-1];   // Which layer owns this MAC
    reg [5:0] mac_local_idx [0:TOTAL_MAC_UNITS-1];  // Local index within layer
    
    // Generate MAC pool
    genvar m;
    generate
        for (m = 0; m < TOTAL_MAC_UNITS; m = m + 1) begin : MAC_POOL
            mac_unit #(
                .DATA_W(DATA_W),
                .ACC_W(ACC_W)
            ) mac_inst (
                .clk(clk),
                .rst(rst),
                .enable(mac_pool_enable[m]),
                .a_in(mac_pool_a_in[m]),
                .w_in(mac_pool_w_in[m]),
                .p_in(mac_pool_p_in[m]),
                .p_out(mac_pool_out[m])
            );
        end
    endgenerate
    
    // =========================================================================
    // RECONFIGURABLE MEMORY POOL
    // =========================================================================
    
    // Pool of BRAM blocks that can be dynamically assigned
    wire [DATA_W-1:0] bram_pool_wdata [0:TOTAL_BRAM_BLOCKS-1];
    wire [9:0]        bram_pool_waddr [0:TOTAL_BRAM_BLOCKS-1];
    wire              bram_pool_we [0:TOTAL_BRAM_BLOCKS-1];
    wire [DATA_W-1:0] bram_pool_rdata [0:TOTAL_BRAM_BLOCKS-1];
    wire [9:0]        bram_pool_raddr [0:TOTAL_BRAM_BLOCKS-1];
    wire              bram_pool_re [0:TOTAL_BRAM_BLOCKS-1];
    
    // BRAM allocation table
    reg [4:0] bram_to_layer [0:TOTAL_BRAM_BLOCKS-1];    // Which layer owns this BRAM
    reg [1:0] bram_function [0:TOTAL_BRAM_BLOCKS-1];    // 0=ACT, 1=WGT, 2=OUT
    
    generate
        for (m = 0; m < TOTAL_BRAM_BLOCKS; m = m + 1) begin : BRAM_POOL
            bram_block #(
                .DATA_W(DATA_W),
                .DEPTH(BRAM_DEPTH)
            ) bram_inst (
                .clk(clk),
                .we(bram_pool_we[m]),
                .waddr(bram_pool_waddr[m]),
                .wdata(bram_pool_wdata[m]),
                .re(bram_pool_re[m]),
                .raddr(bram_pool_raddr[m]),
                .rdata(bram_pool_rdata[m])
            );
        end
    endgenerate
    
    // =========================================================================
    // RECONFIGURABLE INTERCONNECT NETWORK
    // =========================================================================
    
    // Crossbar switches to connect MAC pools to memory pools
    // Each virtual stage has its own interconnect configuration
    
    reg [5:0] mac_to_bram_act [0:MAX_LAYERS-1];     // Which BRAM for activation
    reg [5:0] mac_to_bram_wgt [0:MAX_LAYERS-1];     // Which BRAM for weight
    reg [5:0] mac_to_bram_out [0:MAX_LAYERS-1];     // Which BRAM for output
    
    // Interconnect routing function
    function [5:0] get_bram_for_layer;
        input [4:0] layer_idx;
        input [1:0] func_type;  // 0=ACT, 1=WGT, 2=OUT
        integer i;
        begin
            get_bram_for_layer = 6'h3F;  // Invalid
            for (i = 0; i < TOTAL_BRAM_BLOCKS; i = i + 1) begin
                if (bram_to_layer[i] == layer_idx && bram_function[i] == func_type) begin
                    get_bram_for_layer = i;
                end
            end
        end
    endfunction
    
    // =========================================================================
    // RESOURCE ALLOCATION ENGINE
    // =========================================================================
    
    // Allocates MACs and BRAMs to layers based on compute requirements
    
    task automatic allocate_layer_resources;
        input [4:0] layer_idx;
        integer required_macs, required_brams;
        integer i;
        integer mac_start, bram_start;
        begin
            // Calculate required resources based on layer type
            case (layer_type[layer_idx])
                2'b00: begin  // CONV
                    // MACs needed = kernel_size^2 * in_channels
                    required_macs = layer_kernel_size[layer_idx] * 
                                   layer_kernel_size[layer_idx] * 
                                   layer_in_c[layer_idx];
                    
                    // Limit to available
                    if (required_macs > available_macs)
                        required_macs = available_macs;
                    
                    // BRAMs needed: 1 for activation, 1+ for weights, 1 for output
                    required_brams = 3;
                end
                
                2'b01: begin  // POOL
                    required_macs = 4;  // Minimal MACs for comparison
                    required_brams = 2; // Input and output
                end
                
                2'b10: begin  // FC
                    required_macs = 16; // Configurable
                    required_brams = 3;
                end
                
                default: begin
                    required_macs = 0;
                    required_brams = 0;
                end
            endcase
            
            // Allocate MACs
            mac_start = total_allocated_macs;
            for (i = 0; i < required_macs && (total_allocated_macs < TOTAL_MAC_UNITS); i = i + 1) begin
                mac_to_layer[total_allocated_macs] = layer_idx;
                mac_local_idx[total_allocated_macs] = i;
                total_allocated_macs = total_allocated_macs + 1;
            end
            allocated_macs[layer_idx] = total_allocated_macs - mac_start;
            
            // Allocate BRAMs
            bram_start = total_allocated_brams;
            for (i = 0; i < required_brams && (total_allocated_brams < TOTAL_BRAM_BLOCKS); i = i + 1) begin
                bram_to_layer[total_allocated_brams] = layer_idx;
                bram_function[total_allocated_brams] = i;  // 0=ACT, 1=WGT, 2=OUT
                total_allocated_brams = total_allocated_brams + 1;
            end
            allocated_brams[layer_idx] = total_allocated_brams - bram_start;
            
            $display("Allocated Layer %0d: %0d MACs, %0d BRAMs", 
                     layer_idx, allocated_macs[layer_idx], allocated_brams[layer_idx]);
        end
    endtask
    
    task deallocate_layer_resources;
        input [4:0] layer_idx;
        integer i;
        begin
            // Free MACs
            for (i = 0; i < TOTAL_MAC_UNITS; i = i + 1) begin
                if (mac_to_layer[i] == layer_idx) begin
                    mac_to_layer[i] = 5'h1F;  // Mark as free
                end
            end
            
            // Free BRAMs
            for (i = 0; i < TOTAL_BRAM_BLOCKS; i = i + 1) begin
                if (bram_to_layer[i] == layer_idx) begin
                    bram_to_layer[i] = 5'h1F;  // Mark as free
                end
            end
            
            total_allocated_macs = total_allocated_macs - allocated_macs[layer_idx];
            total_allocated_brams = total_allocated_brams - allocated_brams[layer_idx];
            
            allocated_macs[layer_idx] = 0;
            allocated_brams[layer_idx] = 0;
        end
    endtask
    
    // =========================================================================
    // VIRTUAL STAGE SCHEDULER
    // =========================================================================
    
    // Determines which layers can run concurrently based on:
    // 1. Resource availability
    // 2. Data dependencies
    // 3. Memory bandwidth
    
    task schedule_virtual_stages;
        integer layer_idx, stage_idx;
        integer can_allocate;
        integer sched_abort;
        begin
            stage_idx = 0;
            layer_idx = 0;
            sched_abort = 0;
            
            // Reset stage mapping
            for (stage_idx = 0; stage_idx < MAX_VIRTUAL_STAGES; stage_idx = stage_idx + 1) begin
                virtual_stage_num_layers[stage_idx] = 0;
            end
            
            stage_idx = 0;
            
            // Greedy allocation: pack layers into stages
            while (layer_idx < total_layers && !sched_abort) begin
                // Try to allocate current layer
                can_allocate = 1;
                
                // Check if resources available
                if (allocated_macs[layer_idx] == 0) begin
                    // Not yet allocated, try to allocate
                    allocate_layer_resources(layer_idx);
                end
                
                if (allocated_macs[layer_idx] > 0) begin
                    // Successfully allocated, add to current stage
                    virtual_stage_layers[stage_idx][virtual_stage_num_layers[stage_idx]] = layer_idx;
                    virtual_stage_num_layers[stage_idx] = virtual_stage_num_layers[stage_idx] + 1;
                    layer_idx = layer_idx + 1;
                    
                    // Check if stage is full
                    if (virtual_stage_num_layers[stage_idx] >= 4) begin
                        stage_idx = stage_idx + 1;
                    end
                end else begin
                    // Cannot allocate more layers to this stage
                    // Move to next stage and deallocate previous layers
                    stage_idx = stage_idx + 1;
                    
                    if (stage_idx >= MAX_VIRTUAL_STAGES) begin
                        // Need to execute current stages before proceeding
                        sched_abort = 1;
                    end else begin
                        // Deallocate previous stage to free resources
                        if (stage_idx > 0) begin : dealloc_prev
                            integer i;
                            for (i = 0; i < virtual_stage_num_layers[stage_idx-1]; i = i + 1) begin
                                deallocate_layer_resources(virtual_stage_layers[stage_idx-1][i]);
                            end
                        end
                    end
                end
            end
            
            num_virtual_stages = stage_idx + 1;
            
            $display("Scheduled %0d virtual stages for %0d layers", num_virtual_stages, total_layers);
        end
    endtask
    
    // =========================================================================
    // LAYER EXECUTION ENGINE
    // =========================================================================
    
    reg [2:0] exec_state;
    localparam EXEC_IDLE = 0;
    localparam EXEC_LOAD_WEIGHTS = 1;
    localparam EXEC_LOAD_INPUT = 2;
    localparam EXEC_COMPUTE = 3;
    localparam EXEC_DRAIN = 4;
    localparam EXEC_NEXT_STAGE = 5;
    
    reg [7:0] exec_stage_idx;
    reg [3:0] exec_layer_in_stage;
    
    // Stage active signals
    assign stage_active = (1 << exec_stage_idx) & {{(MAX_VIRTUAL_STAGES-1){1'b0}}, 1'b1};
    
    // Per-layer compute control
    reg [MAX_LAYERS-1:0] layer_compute_enable;
    reg [MAX_LAYERS-1:0] layer_compute_done;
    
    // Layer computation tracking
    reg [15:0] layer_compute_cycles [0:MAX_LAYERS-1];
    reg [15:0] layer_cycle_counter [0:MAX_LAYERS-1];
    
    // =========================================================================
    // MAIN CONTROL FSM
    // =========================================================================
    
    always @(posedge clk) begin
        if (rst) begin
            exec_state <= EXEC_IDLE;
            network_busy <= 0;
            network_done <= 0;
            current_layer_idx <= 0;
            current_virtual_stage <= 0;
            exec_stage_idx <= 0;
            exec_layer_in_stage <= 0;
            total_allocated_macs <= 0;
            total_allocated_brams <= 0;
            
            // Initialize allocation tables
            begin : init_alloc_tables
                integer i;
                for (i = 0; i < TOTAL_MAC_UNITS; i = i + 1) begin
                    mac_to_layer[i] <= 5'h1F;  // Free
                end
                for (i = 0; i < TOTAL_BRAM_BLOCKS; i = i + 1) begin
                    bram_to_layer[i] <= 5'h1F;  // Free
                end
            end
            
        end else begin
            case (exec_state)
                EXEC_IDLE: begin
                    if (start_network) begin
                        network_busy <= 1;
                        network_done <= 0;
                        
                        // Schedule layers into virtual stages
                        schedule_virtual_stages();
                        
                        exec_stage_idx <= 0;
                        exec_state <= EXEC_LOAD_WEIGHTS;
                    end
                end
                
                EXEC_LOAD_WEIGHTS: begin
                    // Load weights for all layers in current stage
                    // This would trigger DMA transfers from external memory
                    
                    // Simplified: assume weights loaded
                    exec_state <= EXEC_LOAD_INPUT;
                end
                
                EXEC_LOAD_INPUT: begin
                    // Load input data for first layer in stage
                    // Or connect to output of previous stage
                    
                    exec_state <= EXEC_COMPUTE;
                end
                
                EXEC_COMPUTE: begin
                    // Enable computation for all layers in current stage
                    begin : enable_compute
                        integer i;
                        for (i = 0; i < virtual_stage_num_layers[exec_stage_idx]; i = i + 1) begin
                            layer_compute_enable[virtual_stage_layers[exec_stage_idx][i]] <= 1;
                        end
                    end
                    
                    // Check if all layers done
                    begin : check_compute_done
                        integer i;
                        reg all_done;
                        all_done = 1;
                        for (i = 0; i < virtual_stage_num_layers[exec_stage_idx]; i = i + 1) begin
                            if (!layer_compute_done[virtual_stage_layers[exec_stage_idx][i]])
                                all_done = 0;
                        end
                        if (all_done) begin
                            exec_state <= EXEC_DRAIN;
                        end
                    end
                end
                
                EXEC_DRAIN: begin
                    // Allow pipeline to drain
                    layer_compute_enable <= 0;
                    exec_state <= EXEC_NEXT_STAGE;
                end
                
                EXEC_NEXT_STAGE: begin
                    // Deallocate resources from current stage
                    begin : dealloc_stage
                        integer i;
                        for (i = 0; i < virtual_stage_num_layers[exec_stage_idx]; i = i + 1) begin
                            deallocate_layer_resources(virtual_stage_layers[exec_stage_idx][i]);
                        end
                    end
                    
                    if (exec_stage_idx < num_virtual_stages - 1) begin
                        exec_stage_idx <= exec_stage_idx + 1;
                        current_virtual_stage <= exec_stage_idx + 1;
                        
                        // Allocate next stage
                        begin : alloc_next_stage
                            integer i;
                            for (i = 0; i < virtual_stage_num_layers[exec_stage_idx+1]; i = i + 1) begin
                                allocate_layer_resources(virtual_stage_layers[exec_stage_idx+1][i]);
                            end
                        end
                        
                        exec_state <= EXEC_LOAD_WEIGHTS;
                    end else begin
                        // All stages complete
                        network_done <= 1;
                        network_busy <= 0;
                        exec_state <= EXEC_IDLE;
                    end
                end
            endcase
        end
    end
    
    // =========================================================================
    // CONFIGURATION INTERFACE
    // =========================================================================
    
    always @(posedge clk) begin
        if (rst) begin
            config_done <= 0;
            total_layers <= 0;
        end else begin
            config_done <= 0;
            
            if (config_valid) begin
                case (config_addr)
                    8'h00: total_layers <= config_data[7:0];
                    
                    // Layer configurations (0x10 - 0x1F for layer 0, 0x20 - 0x2F for layer 1, etc.)
                    default: begin : cfg_layer_decode
                        integer lidx;
                        if (config_addr >= 8'h10) begin
                            lidx = (config_addr - 8'h10) / 16;
                            
                            case ((config_addr - 8'h10) % 16)
                                0: layer_type[lidx] <= config_data[1:0];
                                1: layer_in_h[lidx] <= config_data[7:0];
                                2: layer_in_w[lidx] <= config_data[7:0];
                                3: layer_in_c[lidx] <= config_data[7:0];
                                4: layer_out_h[lidx] <= config_data[7:0];
                                5: layer_out_w[lidx] <= config_data[7:0];
                                6: layer_out_c[lidx] <= config_data[7:0];
                                7: layer_kernel_size[lidx] <= config_data[7:0];
                                8: layer_stride[lidx] <= config_data[7:0];
                            endcase
                        end
                    end
                endcase
                
                config_done <= 1;
            end
        end
    end

endmodule


// =========================================================================
// SIMPLE MAC UNIT
// =========================================================================

module mac_unit #(
    parameter DATA_W = 16,
    parameter ACC_W = 32
)(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [DATA_W-1:0] a_in,
    input wire [DATA_W-1:0] w_in,
    input wire [ACC_W-1:0] p_in,
    output reg [ACC_W-1:0] p_out
);

    always @(posedge clk) begin
        if (rst) begin
            p_out <= 0;
        end else if (enable) begin
            p_out <= p_in + (a_in * w_in);
        end
    end

endmodule


// =========================================================================
// SIMPLE BRAM BLOCK
// =========================================================================

module bram_block #(
    parameter DATA_W = 16,
    parameter DEPTH = 1024,
    parameter ADDR_W = $clog2(DEPTH)
)(
    input wire clk,
    input wire we,
    input wire [ADDR_W-1:0] waddr,
    input wire [DATA_W-1:0] wdata,
    input wire re,
    input wire [ADDR_W-1:0] raddr,
    output reg [DATA_W-1:0] rdata
);

    reg [DATA_W-1:0] mem [0:DEPTH-1];
    
    always @(posedge clk) begin
        if (we) mem[waddr] <= wdata;
        if (re) rdata <= mem[raddr];
    end

endmodule
