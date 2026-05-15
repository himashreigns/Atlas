`timescale 1ns/1ps

module tb_mac_stage;

    parameter CLK_PERIOD = 10;
    parameter DATA_W = 16;
    parameter ACC_W = 32;

    reg clk;
    reg rst;
    reg [DATA_W-1:0] a_in;
    reg [DATA_W-1:0] w_in;
    reg [ACC_W-1:0] psum_in;

    wire [DATA_W-1:0] a_out;
    wire [DATA_W-1:0] w_out;
    wire [ACC_W-1:0] psum_out;

    integer errors;

    mac_stage #(
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) dut (
        .clk(clk),
        .rst(rst),
        .a_in(a_in),
        .w_in(w_in),
        .psum_in(psum_in),
        .a_out(a_out),
        .w_out(w_out),
        .psum_out(psum_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    task automatic apply_case;
        input [DATA_W-1:0] a_val;
        input [DATA_W-1:0] w_val;
        input [ACC_W-1:0] psum_val;
        input [ACC_W-1:0] expected_psum;
        begin
            a_in = a_val;
            w_in = w_val;
            psum_in = psum_val;
            #(CLK_PERIOD);
            if (a_out !== a_val) begin
                $display("ERROR: a_out expected %0h, got %0h", a_val, a_out);
                errors = errors + 1;
            end
            if (w_out !== w_val) begin
                $display("ERROR: w_out expected %0h, got %0h", w_val, w_out);
                errors = errors + 1;
            end
            if (psum_out !== expected_psum) begin
                $display("ERROR: psum_out expected %0h, got %0h", expected_psum, psum_out);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("tb_mac_stage.vcd");
        $dumpvars(0, tb_mac_stage);

        rst = 1;
        a_in = 0;
        w_in = 0;
        psum_in = 0;
        errors = 0;

        #(CLK_PERIOD * 5);
        rst = 0;
        #(CLK_PERIOD);

        // Basic functional tests
        apply_case(16'h0002, 16'h0003, 32'h00000000, 32'h00000006);
        apply_case(16'h0004, 16'h0005, 32'h00000010, 32'h00000024);
        apply_case(16'h00FF, 16'h0002, 32'h00000100, 32'h000002FE);
        apply_case(16'h8000, 16'h0002, 32'h00000000, 32'h00010000);
        apply_case(16'h1234, 16'h5678, 32'hFEDC0000, 32'h05020060);

        #(CLK_PERIOD);

        if (errors == 0) begin
            $display("PASS: mac_stage unit test completed successfully.");
        end else begin
            $display("FAIL: mac_stage unit test found %0d errors.", errors);
        end

        $finish;
    end
endmodule
