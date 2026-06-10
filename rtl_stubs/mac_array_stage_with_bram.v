module mac_array_stage_with_bram #(
    parameter N               = 8,
    parameter DATA_W          = 16,
    parameter ACC_W           = 32,
    parameter ADDR_W          = 10,
    parameter KERNEL_ROWS     = 3,
    parameter NEXT_KERNEL_ROWS= 3
)(
    input  wire clk,
    input  wire rst,

    input  wire [$clog2(1024):0] in_rows_buffered,
    input  wire [$clog2(1024):0] out_rows_produced,

    // Activation BRAM
    input  wire act_we,
    input  wire [ADDR_W-1:0] act_waddr,
    input  wire [DATA_W-1:0] act_wdata,
    input  wire act_re,
    input  wire [ADDR_W-1:0] act_raddr,
    output wire [DATA_W-1:0] act_rdata,

    // Weight BRAM
    input  wire wgt_we,
    input  wire [ADDR_W-1:0] wgt_waddr,
    input  wire [DATA_W-1:0] wgt_wdata,
    input  wire wgt_re,
    input  wire [ADDR_W-1:0] wgt_raddr,
    output wire [DATA_W-1:0] wgt_rdata,

    // Output BRAM
    input  wire out_we,
    input  wire [ADDR_W-1:0] out_waddr,
    input  wire out_re,
    input  wire [ADDR_W-1:0] out_raddr,
    output wire [ACC_W-1:0] out_rdata
);

    wire compute_enable  = (in_rows_buffered  >= KERNEL_ROWS);
    wire output_enable   = (out_rows_produced >= NEXT_KERNEL_ROWS);

    reg [DATA_W-1:0] act_mem [0:(1<<ADDR_W)-1];
    reg [DATA_W-1:0] wgt_mem [0:(1<<ADDR_W)-1];
    reg [ACC_W-1:0]  out_mem [0:(1<<ADDR_W)-1];

    // Declared here (before use) to avoid [Synth 8-6901] forward-reference warning.
    wire [ACC_W-1:0] mac_psum;

    always @(posedge clk) begin
        if (act_we) act_mem[act_waddr] <= act_wdata;
        if (wgt_we) wgt_mem[wgt_waddr] <= wgt_wdata;
        if (out_we && compute_enable) out_mem[out_waddr] <= mac_psum;
    end

    reg [DATA_W-1:0] act_rdata_r, wgt_rdata_r;
    reg [ACC_W-1:0]  out_rdata_r;

    always @(posedge clk) begin
        if (act_re) act_rdata_r <= act_mem[act_raddr];
        if (wgt_re) wgt_rdata_r <= wgt_mem[wgt_raddr];
        if (out_re && output_enable) out_rdata_r <= out_mem[out_raddr];
    end

    assign act_rdata = act_rdata_r;
    assign wgt_rdata = wgt_rdata_r;
    assign out_rdata = out_rdata_r;

    reg [DATA_W-1:0] act_reg, wgt_reg;
    always @(posedge clk) begin
        if (rst) begin
           act_reg <= {DATA_W{1'b0}};
           wgt_reg <= {DATA_W{1'b0}};
        end else if (compute_enable) begin
            act_reg <= act_rdata_r;
            wgt_reg <= wgt_rdata_r;
        end
    end

    mac_array #(
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) mac_array_i (
        .clk      (clk),
        .rst      (rst),
       .a_in (compute_enable ? act_reg : {DATA_W{1'b0}}),
        .w_in (compute_enable ? wgt_reg : {DATA_W{1'b0}}),
        .psum_out (mac_psum)
    );

endmodule
