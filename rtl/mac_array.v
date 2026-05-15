`timescale 1ns/1ps
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

    // Sliding-window dot product of depth N.
    // Each cycle: compute product, shift into prod[0], drop the oldest from prod[N-1].
    // psum_out is the combinational sum of all N registered products.
    reg [ACC_W-1:0] prod [0:N-1];

    integer k;
    always @(posedge clk) begin
        if (rst) begin
            for (k = 0; k < N; k = k + 1)
                prod[k] <= {ACC_W{1'b0}};
        end else begin
            prod[0] <= a_in * w_in;
            for (k = 1; k < N; k = k + 1)
                prod[k] <= prod[k-1];
        end
    end

    integer j;
    reg [ACC_W-1:0] sum_comb;
    always @* begin
        sum_comb = {ACC_W{1'b0}};
        for (j = 0; j < N; j = j + 1)
            sum_comb = sum_comb + prod[j];
    end

    assign psum_out = sum_comb;
endmodule
