// Single Streaming NN Layer Stage
// Fixed parameters at design time, processes feature maps in streaming fashion
// Uses row buffers instead of full feature map storage

module streaming_nn_layer_stage #(
    // Fixed layer parameters (design-time constants)
    parameter LAYER_TYPE      = 0,         // 0=CONV  1=FC  2=POOL
    parameter N               = 8,         // MAC array width
    parameter DATA_W          = 16,
    parameter ACC_W           = 32,
    parameter ADDR_W          = 10,
    
    // Layer-specific parameters
    parameter IMG_ROWS        = 32,
    parameter IMG_COLS        = 32,
    parameter KERNEL_SIZE     = 3,
    parameter STRIDE          = 1,
    parameter PADDING         = 0,
    parameter IN_CHANNELS     = 1,
    parameter OUT_CHANNELS    = 16,
    parameter POOL_SIZE       = 2,
    
    // FC parameters
    parameter FC_INPUT_SIZE   = 128,
    parameter FC_OUTPUT_SIZE  = 64,
    
    // Derived parameters
    parameter KERNEL_ROWS     = (LAYER_TYPE == 2) ? POOL_SIZE : KERNEL_SIZE,
    parameter OUT_ROWS        = (LAYER_TYPE == 0) ? ((IMG_ROWS + 2*PADDING - KERNEL_SIZE) / STRIDE + 1) :
                                (LAYER_TYPE == 2) ? (IMG_ROWS / POOL_SIZE) : 1,
    parameter OUT_COLS        = (LAYER_TYPE == 0) ? ((IMG_COLS + 2*PADDING - KERNEL_SIZE) / STRIDE + 1) :
                                (LAYER_TYPE == 2) ? (IMG_COLS / POOL_SIZE) : 1
)(
    input  wire clk,
    input  wire rst,
    
    // Upstream input stream (from previous layer or input)
    input  wire [DATA_W-1:0] stream_in_data,
    input  wire stream_in_valid,
    output wire stream_in_ready,
    
    // Downstream output stream (to next layer or output)
    output wire [ACC_W-1:0] stream_out_data,
    output wire stream_out_valid,
    input  wire stream_out_ready,
    
    // Weight loading interface (loaded once at startup)
    input  wire wgt_load_en,
    input  wire [ADDR_W-1:0] wgt_load_addr,
    input  wire [DATA_W-1:0] wgt_load_data,
    
    // Status
    output wire layer_ready,
    output wire layer_busy
);

    // Mode encoding for control unit
    localparam [1:0] MODE = (LAYER_TYPE == 0) ? 2'b00 :   // CONV
                            (LAYER_TYPE == 1) ? 2'b01 :   // FC
                            (LAYER_TYPE == 2) ? 2'b10 :   // POOL
                                                2'b00;

    // =========================================================================
    // STREAMING ROW BUFFER (for CONV and POOL)
    // =========================================================================
    
    // Flat packed bus matching streaming_row_buffer port
    // Element [r][c][ch] = window_data[DATA_W*((r*IMG_COLS*IN_CHANNELS)+(c*IN_CHANNELS)+ch) +: DATA_W]
    wire [DATA_W*KERNEL_ROWS*IMG_COLS*IN_CHANNELS-1:0] window_data;
    wire window_valid;
    wire window_read;
    wire buffer_full;
    wire [$clog2(1024):0] rows_buffered;
    
    generate
        if (LAYER_TYPE == 0 || LAYER_TYPE == 2) begin : GEN_ROW_BUFFER  // CONV or POOL
            streaming_row_buffer #(
                .DATA_W(DATA_W),
                .IMG_COLS(IMG_COLS),
                .KERNEL_ROWS(KERNEL_ROWS),
                .NUM_CHANNELS(IN_CHANNELS)
            ) row_buffer (
                .clk(clk),
                .rst(rst),
                .stream_in_data(stream_in_data),
                .stream_in_valid(stream_in_valid),
                .stream_in_ready(stream_in_ready),
                .window_data(window_data),
                .window_valid(window_valid),
                .window_read(window_read),
                .buffer_full(buffer_full),
                .rows_buffered(rows_buffered)
            );
        end else begin : GEN_NO_ROW_BUFFER
            // For FC, use simple FIFO or direct connection
            assign stream_in_ready = 1'b1;
            assign window_valid = stream_in_valid;
            assign rows_buffered = KERNEL_SIZE;
        end
    endgenerate
    
    // =========================================================================
    // WEIGHT BRAM
    // =========================================================================
    
    reg [DATA_W-1:0] wgt_mem [0:(1<<ADDR_W)-1];
    
    wire wgt_we;
    wire [ADDR_W-1:0] wgt_waddr;
    wire [DATA_W-1:0] wgt_wdata;
    wire wgt_re;
    wire [ADDR_W-1:0] wgt_raddr;
    reg [DATA_W-1:0] wgt_rdata;
    
    // Weight loading or runtime access
    assign wgt_we = wgt_load_en;
    assign wgt_waddr = wgt_load_addr;
    assign wgt_wdata = wgt_load_data;
    
    always @(posedge clk) begin
        if (wgt_we) wgt_mem[wgt_waddr] <= wgt_wdata;
        if (wgt_re) wgt_rdata <= wgt_mem[wgt_raddr];
    end
    
    // =========================================================================
    // ACTIVATION BRAM (small buffer for current window/data)
    // =========================================================================
    
    reg [DATA_W-1:0] act_mem [0:(1<<ADDR_W)-1];
    
    wire act_we;
    wire [ADDR_W-1:0] act_waddr;
    wire [DATA_W-1:0] act_wdata;
    wire act_re;
    wire [ADDR_W-1:0] act_raddr;
    reg [DATA_W-1:0] act_rdata;
    
    always @(posedge clk) begin
        if (act_we) act_mem[act_waddr] <= act_wdata;
        if (act_re) act_rdata <= act_mem[act_raddr];
    end
    
    // =========================================================================
    // OUTPUT BRAM (buffering output before streaming)
    // =========================================================================
    
    reg [ACC_W-1:0] out_mem [0:(1<<ADDR_W)-1];
    
    wire out_we;
    wire [ADDR_W-1:0] out_waddr;
    wire [ACC_W-1:0] out_wdata;
    wire out_re;
    wire [ADDR_W-1:0] out_raddr;
    reg [ACC_W-1:0] out_rdata;
    
    wire compute_enable = (rows_buffered >= KERNEL_ROWS);
    
    always @(posedge clk) begin
        if (out_we && compute_enable) out_mem[out_waddr] <= out_wdata;
        if (out_re) out_rdata <= out_mem[out_raddr];
    end
    
    // Width-bounded slices of parameters for port connections.
    // Vivado rejects bare bit-selects (e.g. KERNEL_SIZE[7:0]) on unsized params.
    localparam [7:0]  P_IMG_ROWS       = IMG_ROWS;
    localparam [7:0]  P_IMG_COLS       = IMG_COLS;
    localparam [7:0]  P_KERNEL_SIZE    = KERNEL_SIZE;
    localparam [7:0]  P_STRIDE         = STRIDE;
    localparam [7:0]  P_PADDING        = PADDING;
    localparam [7:0]  P_IN_CHANNELS    = IN_CHANNELS;
    localparam [7:0]  P_OUT_CHANNELS   = OUT_CHANNELS;
    localparam [7:0]  P_POOL_SIZE      = POOL_SIZE;
    localparam [15:0] P_FC_INPUT_SIZE  = FC_INPUT_SIZE;
    localparam [15:0] P_FC_OUTPUT_SIZE = FC_OUTPUT_SIZE;

    // =========================================================================
    // STREAMING CONTROL FSM
    // =========================================================================
    
    localparam ST_IDLE       = 3'b000;
    localparam ST_LOAD_WIN   = 3'b001;  // Load window data to activation BRAM
    localparam ST_COMPUTE    = 3'b010;  // Compute using control unit
    localparam ST_STREAM_OUT = 3'b011;  // Stream results out
    
    reg [2:0] state, next_state;
    
    reg [7:0] out_row_cnt;
    reg [7:0] out_col_cnt;
    reg [7:0] out_ch_cnt;
    
    reg ctrl_start;
    wire ctrl_done;
    wire ctrl_busy;
    
    // Window to activation BRAM loader
    reg [$clog2(KERNEL_SIZE):0] win_kr, win_kc, win_ch;
    reg win_load_active;
    
    always @(posedge clk) begin
        if (rst) begin
            state <= ST_IDLE;
        end else begin
            state <= next_state;
        end
    end
    
    always @(*) begin
        next_state = state;
        case (state)
            ST_IDLE: begin
                if (window_valid && stream_out_ready) begin
                    next_state = ST_LOAD_WIN;
                end
            end
            
            ST_LOAD_WIN: begin
                if (!win_load_active) begin
                    next_state = ST_COMPUTE;
                end
            end
            
            ST_COMPUTE: begin
                if (ctrl_done) begin
                    next_state = ST_STREAM_OUT;
                end
            end
            
            ST_STREAM_OUT: begin
                if (out_ch_cnt >= OUT_CHANNELS - 1 && 
                    out_col_cnt >= OUT_COLS - 1) begin
                    next_state = ST_IDLE;
                end
            end
        endcase
    end
    
    // FSM outputs and control logic
    always @(posedge clk) begin
        if (rst) begin
            ctrl_start <= 0;
            win_load_active <= 0;
            win_kr <= 0;
            win_kc <= 0;
            win_ch <= 0;
            out_row_cnt <= 0;
            out_col_cnt <= 0;
            out_ch_cnt <= 0;
        end else begin
            ctrl_start <= 0;  // Default
            
            case (state)
                ST_IDLE: begin
                    out_row_cnt <= 0;
                    out_col_cnt <= 0;
                    out_ch_cnt <= 0;
                    win_kr <= 0;
                    win_kc <= 0;
                    win_ch <= 0;
                end
                
                ST_LOAD_WIN: begin
                    // Load window data into activation BRAM
                    win_load_active <= 1;
                    
                    // Simple sequential loading
                    if (win_ch < IN_CHANNELS - 1) begin
                        win_ch <= win_ch + 1;
                    end else begin
                        win_ch <= 0;
                        if (win_kc < IMG_COLS - 1) begin
                            win_kc <= win_kc + 1;
                        end else begin
                            win_kc <= 0;
                            if (win_kr < KERNEL_ROWS - 1) begin
                                win_kr <= win_kr + 1;
                            end else begin
                                win_kr <= 0;
                                win_load_active <= 0;
                            end
                        end
                    end
                end
                
                ST_COMPUTE: begin
                    if (!ctrl_busy && !ctrl_start) begin
                        ctrl_start <= 1;
                    end
                end
                
                ST_STREAM_OUT: begin
                    // Stream output incrementally
                    if (stream_out_ready) begin
                        if (out_col_cnt < OUT_COLS - 1) begin
                            out_col_cnt <= out_col_cnt + 1;
                        end else begin
                            out_col_cnt <= 0;
                            if (out_ch_cnt < OUT_CHANNELS - 1) begin
                                out_ch_cnt <= out_ch_cnt + 1;
                            end else begin
                                out_ch_cnt <= 0;
                                // Move to next row or done
                            end
                        end
                    end
                end
            endcase
        end
    end
    
    // Window to activation BRAM interface
    assign act_we = win_load_active;
    assign act_waddr = (win_kr * IMG_COLS * IN_CHANNELS + 
                        win_kc * IN_CHANNELS + 
                        win_ch) & ((1 << ADDR_W) - 1);
    assign act_wdata = window_data[DATA_W*((win_kr*IMG_COLS*IN_CHANNELS)+(win_kc*IN_CHANNELS)+win_ch) +: DATA_W];
    
    assign window_read = (state == ST_STREAM_OUT) && 
                         (out_col_cnt == OUT_COLS - 1) && 
                         (out_ch_cnt == OUT_CHANNELS - 1);
    
    // =========================================================================
    // CONTROL UNIT
    // =========================================================================
    
    wire [$clog2(1024):0] out_rows_produced;
    
    nn_layer_control_unit #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) control_unit (
        .clk(clk),
        .rst(rst),
        .mode(MODE),
        .start(ctrl_start),
        .done(ctrl_done),
        .busy(ctrl_busy),
        .img_rows(P_IMG_ROWS),
        .img_cols(P_IMG_COLS),
        .kernel_size(P_KERNEL_SIZE),
        .stride(P_STRIDE),
        .padding(P_PADDING),
        .in_channels(P_IN_CHANNELS),
        .out_channels(P_OUT_CHANNELS),
        .pool_size(P_POOL_SIZE),
        .fc_input_size(P_FC_INPUT_SIZE),
        .fc_output_size(P_FC_OUTPUT_SIZE),
        .act_we(),  // Overridden by window loader
        .act_waddr(),
        .act_re(act_re),
        .act_raddr(act_raddr),
        .wgt_we(),  // Handled separately
        .wgt_waddr(),
        .wgt_re(wgt_re),
        .wgt_raddr(wgt_raddr),
        .out_we(out_we),
        .out_waddr(out_waddr),
        .out_re(out_re),
        .out_raddr(out_raddr),
        .in_rows_buffered(rows_buffered),
        .out_rows_produced(out_rows_produced)
    );
    
    // =========================================================================
    // MAC ARRAY DATAPATH
    // =========================================================================
    
    reg [DATA_W-1:0] act_reg, wgt_reg;
    
    always @(posedge clk) begin
        if (rst) begin
            act_reg <= {DATA_W{1'b0}};
            wgt_reg <= {DATA_W{1'b0}};
        end else if (compute_enable) begin
            act_reg <= act_rdata;
            wgt_reg <= wgt_rdata;
        end
    end
    
    wire [ACC_W-1:0] mac_psum;
    
    mac_array #(
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) mac_array_inst (
        .clk(clk),
        .rst(rst),
        .a_in (compute_enable ? act_reg : {DATA_W{1'b0}}),
        .w_in (compute_enable ? wgt_reg : {DATA_W{1'b0}}),
        .psum_out(mac_psum)
    );
    
    assign out_wdata = mac_psum;
    
    // =========================================================================
    // OUTPUT STREAMING INTERFACE
    // =========================================================================
    
    assign stream_out_data = out_rdata;
    assign stream_out_valid = (state == ST_STREAM_OUT);
    
    assign layer_ready = (state == ST_IDLE) && buffer_full;
    assign layer_busy = (state != ST_IDLE);

endmodule
