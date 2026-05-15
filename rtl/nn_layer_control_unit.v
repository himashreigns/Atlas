`timescale 1ns/1ps
module nn_layer_control_unit #(
    parameter ADDR_W         = 10,
    parameter DATA_W         = 16,
    parameter ACC_W          = 32,
    parameter MAX_IMG_SIZE   = 32,    // Maximum image dimension
    parameter MAX_KERNEL     = 5,     // Maximum kernel size
    parameter MAX_CHANNELS   = 16,    // Maximum number of channels
    parameter MAX_FILTERS    = 16     // Maximum number of filters/output channels
)(
    input  wire clk,
    input  wire rst,
    
    // Operation mode selection
    input  wire [1:0] mode,           // 2'b00: CONV, 2'b01: FC, 2'b10: POOL
    input  wire start,                // Start signal
    output reg  done,                 // Completion signal
    output reg  busy,                 // Busy flag
    
    // Layer configuration (set before start)
    input  wire [7:0] img_rows,       // Input feature map height
    input  wire [7:0] img_cols,       // Input feature map width
    input  wire [7:0] kernel_size,    // Kernel size (K×K)
    input  wire [7:0] stride,         // Stride
    input  wire [7:0] padding,        // Padding
    input  wire [7:0] in_channels,    // Input channels
    input  wire [7:0] out_channels,   // Output channels (filters)
    input  wire [7:0] pool_size,      // Pooling window size
    
    // FC layer specific
    input  wire [15:0] fc_input_size, // Fully connected input size
    input  wire [15:0] fc_output_size,// Fully connected output size
    
    // BRAM control outputs - Activation
    output reg  act_we,
    output reg  [ADDR_W-1:0] act_waddr,
    output reg  act_re,
    output reg  [ADDR_W-1:0] act_raddr,
    
    // BRAM control outputs - Weight
    output reg  wgt_we,
    output reg  [ADDR_W-1:0] wgt_waddr,
    output reg  wgt_re,
    output reg  [ADDR_W-1:0] wgt_raddr,
    
    // BRAM control outputs - Output
    output reg  out_we,
    output reg  [ADDR_W-1:0] out_waddr,
    output reg  out_re,
    output reg  [ADDR_W-1:0] out_raddr,
    
    // Status outputs  ($clog2(1024)=10, replaced for Verilog-2001 compatibility)
    output reg  [10:0] in_rows_buffered,
    output reg  [10:0] out_rows_produced
);

    // Operation modes
    localparam MODE_CONV = 2'b00;
    localparam MODE_FC   = 2'b01;
    localparam MODE_POOL = 2'b10;
    
    // FSM states
    localparam IDLE       = 3'b000;
    localparam LOAD_WGT   = 3'b001;
    localparam COMPUTE    = 3'b010;
    localparam WRITE_OUT  = 3'b011;
    localparam DONE_ST    = 3'b100;
    
    reg [2:0] state, next_state;
    
    // Computed output dimensions
    reg [7:0] out_rows, out_cols;
    
    // Counters for convolution
    reg [7:0] row_cnt;        // Current output row
    reg [7:0] col_cnt;        // Current output col
    reg [7:0] ch_in_cnt;      // Input channel counter
    reg [7:0] ch_out_cnt;     // Output channel counter
    reg [7:0] kr_cnt;         // Kernel row counter
    reg [7:0] kc_cnt;         // Kernel col counter
    
    // Counters for FC
    reg [15:0] fc_in_cnt;     // FC input counter
    reg [15:0] fc_out_cnt;    // FC output counter
    
    // Counters for Pooling
    reg [7:0] pool_row_cnt;   // Pooling window row
    reg [7:0] pool_col_cnt;   // Pooling window col
    
    // Address computation registers
    reg [ADDR_W-1:0] act_base_addr;
    reg [ADDR_W-1:0] wgt_base_addr;
    reg [ADDR_W-1:0] out_base_addr;
    
    // Pipeline delay counter
    reg [3:0] pipe_delay_cnt;

    // Computation tracking
    reg [15:0] total_computations;
    reg [15:0] comp_cnt;

    // Weight loading and computation completion flags (declared here to avoid
    // forward-reference error in combinational next-state block)
    reg wgt_loading_done;
    reg computation_done;
    
    // Calculate output dimensions
    always @(*) begin
        case (mode)
            MODE_CONV: begin
                out_rows = (img_rows + 2*padding - kernel_size) / stride + 1;
                out_cols = (img_cols + 2*padding - kernel_size) / stride + 1;
            end
            MODE_FC: begin
                out_rows = 1;
                out_cols = 1;
            end
            MODE_POOL: begin
                out_rows = img_rows / pool_size;
                out_cols = img_cols / pool_size;
            end
            default: begin
                out_rows = 0;
                out_cols = 0;
            end
        endcase
    end
    
    // FSM - State register
    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    // FSM - Next state logic
    always @(*) begin
        next_state = state;
        
        case (state)
            IDLE: begin
                if (start)
                    next_state = LOAD_WGT;
            end
            
            LOAD_WGT: begin
                if (mode == MODE_POOL)
                    next_state = COMPUTE;  // Pooling doesn't need weights
                else if (wgt_loading_done)
                    next_state = COMPUTE;
            end
            
            COMPUTE: begin
                if (computation_done)
                    next_state = WRITE_OUT;
            end
            
            WRITE_OUT: begin
                if (pipe_delay_cnt >= 4'd10)  // Allow pipeline to flush
                    next_state = DONE_ST;
            end
            
            DONE_ST: begin
                next_state = IDLE;
            end
            
            default: next_state = IDLE;
        endcase
    end
    
    // Main control logic
    always @(posedge clk) begin
        if (rst) begin
            act_we <= 0;
            act_waddr <= 0;
            act_re <= 0;
            act_raddr <= 0;
            
            wgt_we <= 0;
            wgt_waddr <= 0;
            wgt_re <= 0;
            wgt_raddr <= 0;
            
            out_we <= 0;
            out_waddr <= 0;
            out_re <= 0;
            out_raddr <= 0;
            
            done <= 0;
            busy <= 0;
            
            row_cnt <= 0;
            col_cnt <= 0;
            ch_in_cnt <= 0;
            ch_out_cnt <= 0;
            kr_cnt <= 0;
            kc_cnt <= 0;
            
            fc_in_cnt <= 0;
            fc_out_cnt <= 0;
            
            pool_row_cnt <= 0;
            pool_col_cnt <= 0;
            
            act_base_addr <= 0;
            wgt_base_addr <= 0;
            out_base_addr <= 0;
            
            pipe_delay_cnt <= 0;
            comp_cnt <= 0;
            
            wgt_loading_done <= 0;
            computation_done <= 0;
            
            in_rows_buffered <= 0;
            out_rows_produced <= 0;
            
        end else begin
            // Default values
            act_we <= 0;
            wgt_we <= 0;
            out_we <= 0;
            act_re <= 0;
            wgt_re <= 0;
            out_re <= 0;
            done <= 0;
            
            case (state)
                IDLE: begin
                    busy <= 0;
                    if (start) begin
                        busy <= 1;
                        // Reset counters
                        row_cnt <= 0;
                        col_cnt <= 0;
                        ch_in_cnt <= 0;
                        ch_out_cnt <= 0;
                        kr_cnt <= 0;
                        kc_cnt <= 0;
                        fc_in_cnt <= 0;
                        fc_out_cnt <= 0;
                        pool_row_cnt <= 0;
                        pool_col_cnt <= 0;
                        comp_cnt <= 0;
                        pipe_delay_cnt <= 0;
                        wgt_loading_done <= 0;
                        computation_done <= 0;
                        in_rows_buffered <= kernel_size;  // Assume kernel_size rows buffered
                        out_rows_produced <= 0;
                    end
                end
                
                LOAD_WGT: begin
                    // Weight loading is typically done by external controller
                    // Here we just signal that we're ready to proceed
                    wgt_loading_done <= 1;
                end
                
                COMPUTE: begin
                    case (mode)
                        MODE_CONV: begin
                            // Convolution address generation
                            act_re <= 1;
                            wgt_re <= 1;
                            out_we <= 1;
                            
                            // Calculate activation address
                            // act_addr = (row*stride + kr - padding) * img_cols + (col*stride + kc - padding) + ch_in * img_rows * img_cols
                            act_raddr <= ((row_cnt * stride + kr_cnt) * img_cols + 
                                         (col_cnt * stride + kc_cnt) + 
                                         ch_in_cnt * img_rows * img_cols) & ((1 << ADDR_W) - 1);
                            
                            // Calculate weight address
                            // wgt_addr = ch_out * in_channels * K * K + ch_in * K * K + kr * K + kc
                            wgt_raddr <= (ch_out_cnt * in_channels * kernel_size * kernel_size +
                                         ch_in_cnt * kernel_size * kernel_size +
                                         kr_cnt * kernel_size + kc_cnt) & ((1 << ADDR_W) - 1);
                            
                            // Calculate output address
                            // out_addr = ch_out * out_rows * out_cols + row * out_cols + col
                            out_waddr <= (ch_out_cnt * out_rows * out_cols +
                                         row_cnt * out_cols + col_cnt) & ((1 << ADDR_W) - 1);
                            
                            // Increment kernel column
                            if (kc_cnt < kernel_size - 1) begin
                                kc_cnt <= kc_cnt + 1;
                            end else begin
                                kc_cnt <= 0;
                                // Increment kernel row
                                if (kr_cnt < kernel_size - 1) begin
                                    kr_cnt <= kr_cnt + 1;
                                end else begin
                                    kr_cnt <= 0;
                                    // Increment input channel
                                    if (ch_in_cnt < in_channels - 1) begin
                                        ch_in_cnt <= ch_in_cnt + 1;
                                    end else begin
                                        ch_in_cnt <= 0;
                                        // Increment output column
                                        if (col_cnt < out_cols - 1) begin
                                            col_cnt <= col_cnt + 1;
                                        end else begin
                                            col_cnt <= 0;
                                            // Increment output row
                                            if (row_cnt < out_rows - 1) begin
                                                row_cnt <= row_cnt + 1;
                                                out_rows_produced <= out_rows_produced + 1;
                                            end else begin
                                                row_cnt <= 0;
                                                // Increment output channel
                                                if (ch_out_cnt < out_channels - 1) begin
                                                    ch_out_cnt <= ch_out_cnt + 1;
                                                end else begin
                                                    computation_done <= 1;
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        
                        MODE_FC: begin
                            // Fully connected address generation
                            act_re <= 1;
                            wgt_re <= 1;
                            out_we <= 1;
                            
                            // Activation address (linear indexing)
                            act_raddr <= fc_in_cnt & ((1 << ADDR_W) - 1);
                            
                            // Weight address: out_neuron * input_size + in_neuron
                            wgt_raddr <= (fc_out_cnt * fc_input_size + fc_in_cnt) & ((1 << ADDR_W) - 1);
                            
                            // Output address
                            out_waddr <= fc_out_cnt & ((1 << ADDR_W) - 1);
                            
                            // Increment input counter
                            if (fc_in_cnt < fc_input_size - 1) begin
                                fc_in_cnt <= fc_in_cnt + 1;
                            end else begin
                                fc_in_cnt <= 0;
                                // Increment output counter
                                if (fc_out_cnt < fc_output_size - 1) begin
                                    fc_out_cnt <= fc_out_cnt + 1;
                                end else begin
                                    computation_done <= 1;
                                end
                            end
                        end
                        
                        MODE_POOL: begin
                            // Pooling address generation
                            // Note: Pooling typically uses max/avg pooling
                            // This generates read addresses for pooling windows
                            act_re <= 1;
                            out_we <= 1;
                            
                            // Calculate activation address for pooling window
                            // act_addr = ch_in * img_rows * img_cols + (row*pool_size + pool_row) * img_cols + (col*pool_size + pool_col)
                            act_raddr <= (ch_in_cnt * img_rows * img_cols +
                                         (row_cnt * pool_size + pool_row_cnt) * img_cols +
                                         (col_cnt * pool_size + pool_col_cnt)) & ((1 << ADDR_W) - 1);
                            
                            // Output address
                            out_waddr <= (ch_in_cnt * out_rows * out_cols +
                                         row_cnt * out_cols + col_cnt) & ((1 << ADDR_W) - 1);
                            
                            // Increment pooling window column
                            if (pool_col_cnt < pool_size - 1) begin
                                pool_col_cnt <= pool_col_cnt + 1;
                            end else begin
                                pool_col_cnt <= 0;
                                // Increment pooling window row
                                if (pool_row_cnt < pool_size - 1) begin
                                    pool_row_cnt <= pool_row_cnt + 1;
                                end else begin
                                    pool_row_cnt <= 0;
                                    // Increment output column
                                    if (col_cnt < out_cols - 1) begin
                                        col_cnt <= col_cnt + 1;
                                    end else begin
                                        col_cnt <= 0;
                                        // Increment output row
                                        if (row_cnt < out_rows - 1) begin
                                            row_cnt <= row_cnt + 1;
                                        end else begin
                                            row_cnt <= 0;
                                            // Increment channel
                                            if (ch_in_cnt < in_channels - 1) begin
                                                ch_in_cnt <= ch_in_cnt + 1;
                                            end else begin
                                                computation_done <= 1;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        
                        default: begin
                            computation_done <= 1;
                        end
                    endcase
                end
                
                WRITE_OUT: begin
                    // Allow pipeline to flush
                    pipe_delay_cnt <= pipe_delay_cnt + 1;
                end
                
                DONE_ST: begin
                    done <= 1;
                    busy <= 0;
                end
                
            endcase
        end
    end

endmodule
