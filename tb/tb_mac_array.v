`timescale 1ns/1ps

module tb_mac_array;

    parameter CLK_PERIOD = 10;
    parameter N = 4;
    parameter DATA_W = 16;
    parameter ACC_W = 32;
    parameter VLEN = 8;

    reg clk;
    reg rst;
    reg [DATA_W-1:0] a_in;
    reg [DATA_W-1:0] w_in;
    reg [ACC_W-1:0] psum_in;

    wire [ACC_W-1:0] psum_out;

    reg [DATA_W-1:0] a_vec [0:VLEN-1];
    reg [DATA_W-1:0] w_vec [0:VLEN-1];
    integer cycle;
    integer errors;
    integer i, j;
    reg [ACC_W-1:0] expected;

    mac_array #(
        .N(N),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) dut (
        .clk(clk),
        .rst(rst),
        .a_in(a_in),
        .w_in(w_in),
        .psum_out(psum_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    initial begin
        $dumpfile("tb_mac_array.vcd");
        $dumpvars(0, tb_mac_array);

        rst = 1;
        a_in = 0;
        w_in = 0;
        psum_in = 0;
        cycle = 0;
        errors = 0;

        // Test vector
        a_vec[0] = 16'h0001; w_vec[0] = 16'h0002;
        a_vec[1] = 16'h0003; w_vec[1] = 16'h0004;
        a_vec[2] = 16'h0005; w_vec[2] = 16'h0006;
        a_vec[3] = 16'h0010; w_vec[3] = 16'h0001;
        a_vec[4] = 16'h00FF; w_vec[4] = 16'h0003;
        a_vec[5] = 16'h8000; w_vec[5] = 16'h0002;
        a_vec[6] = 16'h1234; w_vec[6] = 16'h5678;
        a_vec[7] = 16'h0100; w_vec[7] = 16'h00FF;

        #(CLK_PERIOD * 5);
        rst = 0;
        #(CLK_PERIOD);

        for (i = 0; i < VLEN + N; i = i + 1) begin
            if (i < VLEN) begin
                a_in <= a_vec[i];
                w_in <= w_vec[i];
            end else begin
                a_in <= 0;
                w_in <= 0;
            end
            psum_in <= 0;
            #(CLK_PERIOD);

            if (i >= N) begin
                expected = 0;
                for (j = 1; j <= N; j = j + 1) begin
                    expected = expected + a_vec[i-j] * w_vec[i-j];
                end
                if (psum_out !== expected) begin
                    $display("ERROR: cycle=%0d expected %0h got %0h", i, expected, psum_out);
                    errors = errors + 1;
                end
            end
        end

        if (errors == 0) begin
            $display("PASS: mac_array unit test completed successfully.");
        end else begin
            $display("FAIL: mac_array unit test found %0d errors.", errors);
        end

        $finish;
    end
endmodule
