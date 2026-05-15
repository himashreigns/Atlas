// Streaming Row Buffer - stores just enough rows for convolution window
// Implements circular buffer with read pointers for kernel window access

module streaming_row_buffer #(
    parameter DATA_W      = 16,
    parameter IMG_COLS    = 32,      // Feature map width
    parameter KERNEL_ROWS = 3,       // Number of rows needed for kernel
    parameter NUM_CHANNELS= 1        // Number of input channels
)(
    input  wire clk,
    input  wire rst,
    
    // Input stream interface
    input  wire [DATA_W-1:0] stream_in_data,
    input  wire stream_in_valid,
    output wire stream_in_ready,
    
    // Kernel window output (KERNEL_ROWS x IMG_COLS x NUM_CHANNELS), flattened packed bus
    // Element [r][c][ch] = window_data[ DATA_W*((r*IMG_COLS*NUM_CHANNELS)+(c*NUM_CHANNELS)+ch) +: DATA_W ]
    output wire [DATA_W*KERNEL_ROWS*IMG_COLS*NUM_CHANNELS-1:0] window_data,
    output wire window_valid,
    
    // Control
    input  wire window_read,          // Advance to next row
    output wire buffer_full,          // Buffer has enough rows
    output reg [$clog2(1024):0] rows_buffered
);

    // Row buffer memory - circular buffer
    reg [DATA_W-1:0] row_mem [0:KERNEL_ROWS-1][0:IMG_COLS-1][0:NUM_CHANNELS-1];
    
    // Write pointer (which row to write next)
    reg [$clog2(KERNEL_ROWS):0] wr_row_ptr;
    
    // Read pointer (oldest row in buffer)
    reg [$clog2(KERNEL_ROWS):0] rd_row_ptr;
    
    // Column counter for incoming data
    reg [$clog2(IMG_COLS):0] col_cnt;
    reg [$clog2(NUM_CHANNELS):0] ch_cnt;
    
    // Buffer status
    reg [$clog2(KERNEL_ROWS+1):0] valid_rows;
    
    assign buffer_full = (valid_rows >= KERNEL_ROWS);
    assign window_valid = buffer_full;
    assign stream_in_ready = 1'b1;  // Always ready in this implementation
    
    // Write incoming stream data
    always @(posedge clk) begin
        if (rst) begin
            wr_row_ptr <= 0;
            rd_row_ptr <= 0;
            col_cnt <= 0;
            ch_cnt <= 0;
            valid_rows <= 0;
            rows_buffered <= 0;
        end else begin
            if (stream_in_valid && stream_in_ready) begin
                // Write data to current position
                row_mem[wr_row_ptr][col_cnt][ch_cnt] <= stream_in_data;
                
                // Increment channel counter
                if (ch_cnt < NUM_CHANNELS - 1) begin
                    ch_cnt <= ch_cnt + 1;
                end else begin
                    ch_cnt <= 0;
                    
                    // Increment column counter
                    if (col_cnt < IMG_COLS - 1) begin
                        col_cnt <= col_cnt + 1;
                    end else begin
                        col_cnt <= 0;
                        
                        // Row complete - move to next row
                        if (wr_row_ptr < KERNEL_ROWS - 1) begin
                            wr_row_ptr <= wr_row_ptr + 1;
                        end else begin
                            wr_row_ptr <= 0;  // Wrap around
                        end
                        
                        // Update valid rows count
                        if (valid_rows < KERNEL_ROWS) begin
                            valid_rows <= valid_rows + 1;
                            rows_buffered <= rows_buffered + 1;
                        end
                    end
                end
            end
            
            // Handle window read (consume oldest row)
            if (window_read && window_valid) begin
                if (rd_row_ptr < KERNEL_ROWS - 1) begin
                    rd_row_ptr <= rd_row_ptr + 1;
                end else begin
                    rd_row_ptr <= 0;  // Wrap around
                end
            end
        end
    end
    
    // Generate window output - map circular buffer to linear window view
    genvar r, c, ch;
    generate
        for (r = 0; r < KERNEL_ROWS; r = r + 1) begin : GEN_ROWS
            for (c = 0; c < IMG_COLS; c = c + 1) begin : GEN_COLS
                for (ch = 0; ch < NUM_CHANNELS; ch = ch + 1) begin : GEN_CHANNELS
                    // Calculate actual row index in circular buffer
                    wire [$clog2(KERNEL_ROWS):0] actual_row;
                    assign actual_row = (rd_row_ptr + r) % KERNEL_ROWS;
                    // Map to flattened packed bus:
                    // bit offset = DATA_W * (r*IMG_COLS*NUM_CHANNELS + c*NUM_CHANNELS + ch)
                    assign window_data[DATA_W*((r*IMG_COLS*NUM_CHANNELS)+(c*NUM_CHANNELS)+ch) +: DATA_W]
                        = row_mem[actual_row][c][ch];
                end
            end
        end
    endgenerate

endmodule
