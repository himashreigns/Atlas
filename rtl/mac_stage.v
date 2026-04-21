module mac_stage #(
    parameter DATA_W = 16,
    parameter ACC_W  = 32
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire [DATA_W-1:0]         a_in,
    input  wire [DATA_W-1:0]         w_in,
    input  wire [ACC_W-1:0]          psum_in,
    output reg  [DATA_W-1:0]         a_out,
    output reg  [DATA_W-1:0]         w_out,
    output reg  [ACC_W-1:0]          psum_out
);

    wire [ACC_W-1:0] mult;
    assign mult = a_in * w_in;

    always @(posedge clk) begin
        if (rst) begin
            a_out    <= '0;
            w_out    <= '0;
            psum_out <= '0;
        end else begin
            a_out    <= a_in;
            w_out    <= w_in;
            psum_out <= psum_in + mult;
        end
    end
endmodule
