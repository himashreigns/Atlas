module mac_array #(
    parameter N      = 8,
    parameter DATA_W = 16,
    parameter ACC_W  = 32
)(
    input  wire                     clk,
    input  wire                     rst,
    input  wire [DATA_W-1:0]         a_in,
    input  wire [DATA_W-1:0]         w_in,
    output wire [ACC_W-1:0]          psum_out
);

    wire [DATA_W-1:0] a_pipe   [0:N];
    wire [DATA_W-1:0] w_pipe   [0:N];
    wire [ACC_W-1:0]  psum_pipe[0:N];

    assign a_pipe[0]    = a_in;
    assign w_pipe[0]    = w_in;
    assign psum_pipe[0] = '0;

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : MACS
            mac_stage #(
                .DATA_W(DATA_W),
                .ACC_W (ACC_W)
            ) mac_i (
                .clk      (clk),
                .rst      (rst),
                .a_in     (a_pipe[i]),
                .w_in     (w_pipe[i]),
                .psum_in  (psum_pipe[i]),
                .a_out    (a_pipe[i+1]),
                .w_out    (w_pipe[i+1]),
                .psum_out (psum_pipe[i+1])
            );
        end
    endgenerate

    assign psum_out = psum_pipe[N];
endmodule
