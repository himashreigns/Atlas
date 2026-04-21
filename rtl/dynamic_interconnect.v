// Dynamic Crossbar Interconnect
// Provides reconfigurable connections between MAC units and memory blocks
// Supports runtime reconfiguration for different layer mappings

module dynamic_crossbar_interconnect #(
    parameter NUM_INPUTS = 64,    // Number of MAC units or data sources
    parameter NUM_OUTPUTS = 32,   // Number of memory blocks or destinations
    parameter DATA_W = 16,
    parameter ADDR_W = 10
)(
    input wire clk,
    input wire rst,
    
    // Configuration interface
    input wire config_valid,
    input wire [7:0] config_input_idx,
    input wire [7:0] config_output_idx,
    input wire config_enable,
    
    // Input ports (from MACs or memory)
    input wire [DATA_W-1:0] in_data [0:NUM_INPUTS-1],
    input wire [ADDR_W-1:0] in_addr [0:NUM_INPUTS-1],
    input wire in_valid [0:NUM_INPUTS-1],
    output reg in_ready [0:NUM_INPUTS-1],
    
    // Output ports (to memory or MACs)
    output reg [DATA_W-1:0] out_data [0:NUM_OUTPUTS-1],
    output reg [ADDR_W-1:0] out_addr [0:NUM_OUTPUTS-1],
    output reg out_valid [0:NUM_OUTPUTS-1],
    input wire out_ready [0:NUM_OUTPUTS-1]
);

    // Connection matrix: connection[i][j] = 1 means input i connects to output j
    reg connection_matrix [0:NUM_INPUTS-1][0:NUM_OUTPUTS-1];
    
    // Priority encoder for multiple inputs to same output
    reg [7:0] output_source [0:NUM_OUTPUTS-1];  // Which input is connected
    
    // =========================================================================
    // CONFIGURATION LOGIC
    // =========================================================================
    
    always @(posedge clk) begin
        if (rst) begin
            // Initialize: no connections
            for (integer i = 0; i < NUM_INPUTS; i = i + 1) begin
                for (integer j = 0; j < NUM_OUTPUTS; j = j + 1) begin
                    connection_matrix[i][j] <= 0;
                end
            end
            
            for (integer j = 0; j < NUM_OUTPUTS; j = j + 1) begin
                output_source[j] <= 8'hFF;  // No source
            end
            
        end else if (config_valid) begin
            if (config_enable) begin
                // Enable connection
                connection_matrix[config_input_idx][config_output_idx] <= 1;
                output_source[config_output_idx] <= config_input_idx;
            end else begin
                // Disable connection
                connection_matrix[config_input_idx][config_output_idx] <= 0;
                if (output_source[config_output_idx] == config_input_idx) begin
                    output_source[config_output_idx] <= 8'hFF;
                end
            end
        end
    end
    
    // =========================================================================
    // DATAPATH ROUTING
    // =========================================================================
    
    always @(*) begin
        // Default: no data
        for (integer j = 0; j < NUM_OUTPUTS; j = j + 1) begin
            out_data[j] = 0;
            out_addr[j] = 0;
            out_valid[j] = 0;
        end
        
        for (integer i = 0; i < NUM_INPUTS; i = i + 1) begin
            in_ready[i] = 0;
        end
        
        // Route data from inputs to outputs
        for (integer j = 0; j < NUM_OUTPUTS; j = j + 1) begin
            if (output_source[j] != 8'hFF) begin
                integer src = output_source[j];
                out_data[j] = in_data[src];
                out_addr[j] = in_addr[src];
                out_valid[j] = in_valid[src];
                in_ready[src] = out_ready[j];
            end
        end
    end
    
    // =========================================================================
    // ALTERNATIVE: FULL CROSSBAR (More flexible but expensive)
    // =========================================================================
    
    // Uncomment for full crossbar with arbitration
    /*
    genvar i, j;
    generate
        for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin : OUTPUT_ARB
            // Arbitrate between multiple inputs wanting this output
            reg [DATA_W-1:0] arb_data;
            reg [ADDR_W-1:0] arb_addr;
            reg arb_valid;
            reg [7:0] arb_selected;
            
            always @(*) begin
                arb_valid = 0;
                arb_selected = 8'hFF;
                
                // Priority encoder: first valid input wins
                for (integer i = 0; i < NUM_INPUTS; i = i + 1) begin
                    if (connection_matrix[i][j] && in_valid[i] && !arb_valid) begin
                        arb_data = in_data[i];
                        arb_addr = in_addr[i];
                        arb_valid = 1;
                        arb_selected = i;
                    end
                end
                
                out_data[j] = arb_data;
                out_addr[j] = arb_addr;
                out_valid[j] = arb_valid;
                
                // Acknowledge selected input
                if (arb_selected != 8'hFF) begin
                    in_ready[arb_selected] = out_ready[j];
                end
            end
        end
    endgenerate
    */

endmodule


// =========================================================================
// RECONFIGURABLE DATAPATH FABRIC
// =========================================================================

// Provides flexible interconnect between compute and memory resources

module reconfigurable_datapath_fabric #(
    parameter NUM_MAC_UNITS = 64,
    parameter NUM_BRAM_BLOCKS = 32,
    parameter DATA_W = 16,
    parameter ACC_W = 32,
    parameter ADDR_W = 10
)(
    input wire clk,
    input wire rst,
    
    // Configuration
    input wire config_valid,
    input wire [15:0] config_data,
    input wire [7:0] config_addr,
    
    // MAC unit interfaces
    input wire [DATA_W-1:0] mac_a_in [0:NUM_MAC_UNITS-1],
    input wire [DATA_W-1:0] mac_w_in [0:NUM_MAC_UNITS-1],
    input wire [ACC_W-1:0] mac_p_in [0:NUM_MAC_UNITS-1],
    output wire [ACC_W-1:0] mac_p_out [0:NUM_MAC_UNITS-1],
    input wire mac_enable [0:NUM_MAC_UNITS-1],
    
    // Memory interfaces
    output wire [DATA_W-1:0] mem_wdata [0:NUM_BRAM_BLOCKS-1],
    output wire [ADDR_W-1:0] mem_waddr [0:NUM_BRAM_BLOCKS-1],
    output wire mem_we [0:NUM_BRAM_BLOCKS-1],
    input wire [DATA_W-1:0] mem_rdata [0:NUM_BRAM_BLOCKS-1],
    output wire [ADDR_W-1:0] mem_raddr [0:NUM_BRAM_BLOCKS-1],
    output wire mem_re [0:NUM_BRAM_BLOCKS-1]
);

    // Connection configuration
    // Each MAC can read from and write to specific memory blocks
    reg [5:0] mac_to_act_mem [0:NUM_MAC_UNITS-1];   // Activation memory
    reg [5:0] mac_to_wgt_mem [0:NUM_MAC_UNITS-1];   // Weight memory
    reg [5:0] mac_to_out_mem [0:NUM_MAC_UNITS-1];   // Output memory
    
    // Data routing
    reg [DATA_W-1:0] mac_a_routed [0:NUM_MAC_UNITS-1];
    reg [DATA_W-1:0] mac_w_routed [0:NUM_MAC_UNITS-1];
    
    // Route activation and weight data from memory to MACs
    genvar m;
    generate
        for (m = 0; m < NUM_MAC_UNITS; m = m + 1) begin : MAC_ROUTING
            always @(*) begin
                // Route activation from configured memory
                if (mac_to_act_mem[m] < NUM_BRAM_BLOCKS) begin
                    mac_a_routed[m] = mem_rdata[mac_to_act_mem[m]];
                end else begin
                    mac_a_routed[m] = mac_a_in[m];  // Direct input
                end
                
                // Route weight from configured memory
                if (mac_to_wgt_mem[m] < NUM_BRAM_BLOCKS) begin
                    mac_w_routed[m] = mem_rdata[mac_to_wgt_mem[m]];
                end else begin
                    mac_w_routed[m] = mac_w_in[m];  // Direct input
                end
            end
            
            // Instantiate MAC
            mac_unit #(
                .DATA_W(DATA_W),
                .ACC_W(ACC_W)
            ) mac_inst (
                .clk(clk),
                .rst(rst),
                .enable(mac_enable[m]),
                .a_in(mac_a_routed[m]),
                .w_in(mac_w_routed[m]),
                .p_in(mac_p_in[m]),
                .p_out(mac_p_out[m])
            );
        end
    endgenerate
    
    // Route MAC outputs to memory write ports
    // Multiple MACs can write to same memory (accumulation)
    genvar b;
    generate
        for (b = 0; b < NUM_BRAM_BLOCKS; b = b + 1) begin : MEM_ROUTING
            reg [ACC_W-1:0] mem_accumulator;
            reg [ADDR_W-1:0] mem_write_addr;
            reg mem_write_en;
            integer mac_idx;
            
            always @(*) begin
                mem_accumulator = 0;
                mem_write_en = 0;
                
                // Accumulate outputs from all MACs targeting this memory
                for (mac_idx = 0; mac_idx < NUM_MAC_UNITS; mac_idx = mac_idx + 1) begin
                    if (mac_to_out_mem[mac_idx] == b && mac_enable[mac_idx]) begin
                        mem_accumulator = mem_accumulator + mac_p_out[mac_idx];
                        mem_write_en = 1;
                    end
                end
            end
            
            // Truncate accumulator to data width for memory write
            assign mem_wdata[b] = mem_accumulator[DATA_W-1:0];
            assign mem_we[b] = mem_write_en;
        end
    endgenerate
    
    // Configuration interface
    always @(posedge clk) begin
        if (rst) begin
            // Initialize with no connections
            for (integer m = 0; m < NUM_MAC_UNITS; m = m + 1) begin
                mac_to_act_mem[m] <= 6'h3F;  // Invalid
                mac_to_wgt_mem[m] <= 6'h3F;
                mac_to_out_mem[m] <= 6'h3F;
            end
        end else if (config_valid) begin
            // Configure MAC-to-memory connections
            integer mac_idx = config_addr;
            
            case (config_data[15:14])
                2'b00: mac_to_act_mem[mac_idx] <= config_data[5:0];
                2'b01: mac_to_wgt_mem[mac_idx] <= config_data[5:0];
                2'b10: mac_to_out_mem[mac_idx] <= config_data[5:0];
            endcase
        end
    end

endmodule


// =========================================================================
// LAYER EXECUTION SCHEDULER
// =========================================================================

// Schedules layer execution and manages resource allocation timing

module layer_execution_scheduler #(
    parameter MAX_LAYERS = 16,
    parameter MAX_PHASES = 8
)(
    input wire clk,
    input wire rst,
    
    // Configuration
    input wire [7:0] num_phases,
    input wire [MAX_LAYERS-1:0] phase_layers [0:MAX_PHASES-1],
    input wire [31:0] phase_cycles [0:MAX_PHASES-1],
    
    // Control
    input wire start,
    output reg done,
    output reg busy,
    
    // Phase control
    output reg [7:0] current_phase,
    output reg phase_start,
    output reg phase_done,
    output reg [MAX_LAYERS-1:0] active_layers,
    
    // Resource reconfiguration trigger
    output reg reconfig_trigger,
    output reg [7:0] reconfig_phase
);

    reg [2:0] state;
    localparam IDLE = 0;
    localparam PHASE_START = 1;
    localparam PHASE_RUN = 2;
    localparam PHASE_END = 3;
    localparam RECONFIG = 4;
    localparam DONE = 5;
    
    reg [31:0] phase_counter;
    
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            done <= 0;
            busy <= 0;
            current_phase <= 0;
            phase_start <= 0;
            phase_done <= 0;
            reconfig_trigger <= 0;
            phase_counter <= 0;
            active_layers <= 0;
            
        end else begin
            // Default
            phase_start <= 0;
            phase_done <= 0;
            reconfig_trigger <= 0;
            
            case (state)
                IDLE: begin
                    if (start) begin
                        busy <= 1;
                        done <= 0;
                        current_phase <= 0;
                        state <= PHASE_START;
                    end
                end
                
                PHASE_START: begin
                    // Activate layers in current phase
                    active_layers <= phase_layers[current_phase];
                    phase_start <= 1;
                    phase_counter <= 0;
                    state <= PHASE_RUN;
                end
                
                PHASE_RUN: begin
                    // Wait for phase to complete
                    phase_counter <= phase_counter + 1;
                    
                    if (phase_counter >= phase_cycles[current_phase]) begin
                        state <= PHASE_END;
                    end
                end
                
                PHASE_END: begin
                    phase_done <= 1;
                    active_layers <= 0;
                    
                    if (current_phase < num_phases - 1) begin
                        state <= RECONFIG;
                    end else begin
                        state <= DONE;
                    end
                end
                
                RECONFIG: begin
                    // Trigger reconfiguration for next phase
                    reconfig_trigger <= 1;
                    reconfig_phase <= current_phase + 1;
                    current_phase <= current_phase + 1;
                    
                    // Wait for reconfiguration (simplified: 10 cycles)
                    if (phase_counter < 10) begin
                        phase_counter <= phase_counter + 1;
                    end else begin
                        state <= PHASE_START;
                    end
                end
                
                DONE: begin
                    done <= 1;
                    busy <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
