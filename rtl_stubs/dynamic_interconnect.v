`timescale 1ns/1ps

// Dynamic Crossbar Interconnect
// Provides reconfigurable connections between MAC units and memory blocks
// Supports runtime reconfiguration for different layer mappings
//
// NOTE: Ports flattened to 1-D vectors for Verilog-2001 compatibility.
//   Bit slice i of a N-element W-bit array is [i*W +: W].

module dynamic_crossbar_interconnect #(
    parameter NUM_INPUTS  = 64,
    parameter NUM_OUTPUTS = 32,
    parameter DATA_W      = 16,
    parameter ADDR_W      = 10
)(
    input  wire clk,
    input  wire rst,

    // Configuration interface
    input  wire        config_valid,
    input  wire [7:0]  config_input_idx,
    input  wire [7:0]  config_output_idx,
    input  wire        config_enable,

    // Input ports (flattened; element i = [i*DATA_W +: DATA_W])
    input  wire [DATA_W*NUM_INPUTS-1:0]  in_data,
    input  wire [ADDR_W*NUM_INPUTS-1:0]  in_addr,
    input  wire [NUM_INPUTS-1:0]         in_valid,
    output reg  [NUM_INPUTS-1:0]         in_ready,

    // Output ports (flattened; element j = [j*DATA_W +: DATA_W])
    output reg  [DATA_W*NUM_OUTPUTS-1:0] out_data,
    output reg  [ADDR_W*NUM_OUTPUTS-1:0] out_addr,
    output reg  [NUM_OUTPUTS-1:0]        out_valid,
    input  wire [NUM_OUTPUTS-1:0]        out_ready
);

    // Connection matrix: connection_matrix[i][j] = 1 -> input i feeds output j
    reg connection_matrix [0:NUM_INPUTS-1][0:NUM_OUTPUTS-1];

    // Which input is currently connected to each output (8'hFF = none)
    reg [7:0] output_source [0:NUM_OUTPUTS-1];

    // Loop variables declared at module level (Verilog-2001 requirement)
    integer i, j, src;

    // =========================================================================
    // CONFIGURATION LOGIC
    // =========================================================================

    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < NUM_INPUTS; i = i + 1) begin
                for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin
                    connection_matrix[i][j] <= 0;
                end
            end
            for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin
                output_source[j] <= 8'hFF;
            end
        end else if (config_valid) begin
            if (config_enable) begin
                connection_matrix[config_input_idx][config_output_idx] <= 1;
                output_source[config_output_idx] <= config_input_idx;
            end else begin
                connection_matrix[config_input_idx][config_output_idx] <= 0;
                if (output_source[config_output_idx] == config_input_idx)
                    output_source[config_output_idx] <= 8'hFF;
            end
        end
    end

    // =========================================================================
    // DATAPATH ROUTING
    // =========================================================================

    always @(*) begin
        for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin
            out_data[j*DATA_W +: DATA_W] = 0;
            out_addr[j*ADDR_W +: ADDR_W] = 0;
            out_valid[j] = 0;
        end
        for (i = 0; i < NUM_INPUTS; i = i + 1)
            in_ready[i] = 0;

        for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin
            if (output_source[j] != 8'hFF) begin
                src = output_source[j];
                out_data[j*DATA_W +: DATA_W] = in_data[src*DATA_W +: DATA_W];
                out_addr[j*ADDR_W +: ADDR_W] = in_addr[src*ADDR_W +: ADDR_W];
                out_valid[j] = in_valid[src];
                in_ready[src] = out_ready[j];
            end
        end
    end

endmodule


// =========================================================================
// RECONFIGURABLE DATAPATH FABRIC
// =========================================================================

module reconfigurable_datapath_fabric #(
    parameter NUM_MAC_UNITS  = 64,
    parameter NUM_BRAM_BLOCKS = 32,
    parameter DATA_W         = 16,
    parameter ACC_W          = 32,
    parameter ADDR_W         = 10
)(
    input  wire clk,
    input  wire rst,

    // Configuration
    input  wire        config_valid,
    input  wire [15:0] config_data,
    input  wire [7:0]  config_addr,

    // MAC unit interfaces (flattened)
    input  wire [DATA_W*NUM_MAC_UNITS-1:0]  mac_a_in,
    input  wire [DATA_W*NUM_MAC_UNITS-1:0]  mac_w_in,
    input  wire [ACC_W*NUM_MAC_UNITS-1:0]   mac_p_in,
    output wire [ACC_W*NUM_MAC_UNITS-1:0]   mac_p_out,
    input  wire [NUM_MAC_UNITS-1:0]         mac_enable,

    // Memory interfaces (flattened)
    output wire [DATA_W*NUM_BRAM_BLOCKS-1:0] mem_wdata,
    output wire [ADDR_W*NUM_BRAM_BLOCKS-1:0] mem_waddr,
    output wire [NUM_BRAM_BLOCKS-1:0]        mem_we,
    input  wire [DATA_W*NUM_BRAM_BLOCKS-1:0] mem_rdata,
    output wire [ADDR_W*NUM_BRAM_BLOCKS-1:0] mem_raddr,
    output wire [NUM_BRAM_BLOCKS-1:0]        mem_re
);

    reg [5:0] mac_to_act_mem [0:NUM_MAC_UNITS-1];
    reg [5:0] mac_to_wgt_mem [0:NUM_MAC_UNITS-1];
    reg [5:0] mac_to_out_mem [0:NUM_MAC_UNITS-1];

    reg [DATA_W-1:0] mac_a_routed [0:NUM_MAC_UNITS-1];
    reg [DATA_W-1:0] mac_w_routed [0:NUM_MAC_UNITS-1];

    // Route activation/weight data from memory to MACs
    genvar m;
    generate
        for (m = 0; m < NUM_MAC_UNITS; m = m + 1) begin : MAC_ROUTING
            always @(*) begin
                if (mac_to_act_mem[m] < NUM_BRAM_BLOCKS)
                    mac_a_routed[m] = mem_rdata[mac_to_act_mem[m]*DATA_W +: DATA_W];
                else
                    mac_a_routed[m] = mac_a_in[m*DATA_W +: DATA_W];

                if (mac_to_wgt_mem[m] < NUM_BRAM_BLOCKS)
                    mac_w_routed[m] = mem_rdata[mac_to_wgt_mem[m]*DATA_W +: DATA_W];
                else
                    mac_w_routed[m] = mac_w_in[m*DATA_W +: DATA_W];
            end

            mac_unit #(
                .DATA_W(DATA_W),
                .ACC_W (ACC_W)
            ) mac_inst (
                .clk   (clk),
                .rst   (rst),
                .enable(mac_enable[m]),
                .a_in  (mac_a_routed[m]),
                .w_in  (mac_w_routed[m]),
                .p_in  (mac_p_in [m*ACC_W +: ACC_W]),
                .p_out (mac_p_out[m*ACC_W +: ACC_W])
            );
        end
    endgenerate

    // Route MAC outputs to memory write ports
    genvar b;
    generate
        for (b = 0; b < NUM_BRAM_BLOCKS; b = b + 1) begin : MEM_ROUTING
            reg [ACC_W-1:0] mem_accumulator;
            reg             mem_write_en;
            integer         mac_idx;   // valid inside named generate block (Verilog-2001)

            always @(*) begin
                mem_accumulator = 0;
                mem_write_en    = 0;
                for (mac_idx = 0; mac_idx < NUM_MAC_UNITS; mac_idx = mac_idx + 1) begin
                    if (mac_to_out_mem[mac_idx] == b && mac_enable[mac_idx]) begin
                        mem_accumulator = mem_accumulator + mac_p_out[mac_idx*ACC_W +: ACC_W];
                        mem_write_en    = 1;
                    end
                end
            end

            assign mem_wdata[b*DATA_W +: DATA_W] = mem_accumulator[DATA_W-1:0];
            assign mem_we[b]                      = mem_write_en;
        end
    endgenerate

    // Configuration interface
    integer cfg_m;
    always @(posedge clk) begin
        if (rst) begin
            for (cfg_m = 0; cfg_m < NUM_MAC_UNITS; cfg_m = cfg_m + 1) begin
                mac_to_act_mem[cfg_m] <= 6'h3F;
                mac_to_wgt_mem[cfg_m] <= 6'h3F;
                mac_to_out_mem[cfg_m] <= 6'h3F;
            end
        end else if (config_valid) begin
            case (config_data[15:14])
                2'b00: mac_to_act_mem[config_addr] <= config_data[5:0];
                2'b01: mac_to_wgt_mem[config_addr] <= config_data[5:0];
                2'b10: mac_to_out_mem[config_addr] <= config_data[5:0];
                default: ;
            endcase
        end
    end

endmodule


// =========================================================================
// LAYER EXECUTION SCHEDULER
// =========================================================================

module layer_execution_scheduler #(
    parameter MAX_LAYERS = 16,
    parameter MAX_PHASES = 8
)(
    input  wire clk,
    input  wire rst,

    // Configuration
    input  wire [7:0]                      num_phases,
    // Flattened: phase i layers  = phase_layers[i*MAX_LAYERS +: MAX_LAYERS]
    input  wire [MAX_LAYERS*MAX_PHASES-1:0] phase_layers,
    // Flattened: phase i cycles  = phase_cycles[i*32 +: 32]
    input  wire [32*MAX_PHASES-1:0]         phase_cycles,

    // Control
    input  wire       start,
    output reg        done,
    output reg        busy,

    // Phase control
    output reg [7:0]            current_phase,
    output reg                  phase_start,
    output reg                  phase_done,
    output reg [MAX_LAYERS-1:0] active_layers,

    // Resource reconfiguration trigger
    output reg       reconfig_trigger,
    output reg [7:0] reconfig_phase
);

    reg [2:0] state;
    localparam IDLE        = 3'd0;
    localparam PHASE_START = 3'd1;
    localparam PHASE_RUN   = 3'd2;
    localparam PHASE_END   = 3'd3;
    localparam RECONFIG    = 3'd4;
    localparam DONE        = 3'd5;

    reg [31:0] phase_counter;

    always @(posedge clk) begin
        if (rst) begin
            state           <= IDLE;
            done            <= 0;
            busy            <= 0;
            current_phase   <= 0;
            phase_start     <= 0;
            phase_done      <= 0;
            reconfig_trigger <= 0;
            phase_counter   <= 0;
            active_layers   <= 0;
        end else begin
            // Pulse defaults
            phase_start      <= 0;
            phase_done       <= 0;
            reconfig_trigger <= 0;

            case (state)
                IDLE: begin
                    if (start) begin
                        busy          <= 1;
                        done          <= 0;
                        current_phase <= 0;
                        state         <= PHASE_START;
                    end
                end

                PHASE_START: begin
                    active_layers <= phase_layers[current_phase*MAX_LAYERS +: MAX_LAYERS];
                    phase_start   <= 1;
                    phase_counter <= 0;
                    state         <= PHASE_RUN;
                end

                PHASE_RUN: begin
                    phase_counter <= phase_counter + 1;
                    if (phase_counter >= phase_cycles[current_phase*32 +: 32])
                        state <= PHASE_END;
                end

                PHASE_END: begin
                    phase_done    <= 1;
                    active_layers <= 0;
                    if (current_phase < num_phases - 1)
                        state <= RECONFIG;
                    else
                        state <= DONE;
                end

                RECONFIG: begin
                    reconfig_trigger <= 1;
                    reconfig_phase   <= current_phase + 1;
                    current_phase    <= current_phase + 1;
                    if (phase_counter < 10)
                        phase_counter <= phase_counter + 1;
                    else
                        state <= PHASE_START;
                end

                DONE: begin
                    done  <= 1;
                    busy  <= 0;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule
