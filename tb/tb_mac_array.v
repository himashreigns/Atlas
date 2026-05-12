`timescale 1ns/1ps
module tb_mac_array;

    // -------------------------------------------------------------------------
    // Parameters
    // -------------------------------------------------------------------------
    parameter CLK_PERIOD = 10;
    parameter N      = 4;   // window depth
    parameter DATA_W = 16;
    parameter ACC_W  = 32;
    parameter VLEN   = 8;   // number of input vectors to feed

    // -------------------------------------------------------------------------
    // DUT signals
    // -------------------------------------------------------------------------
    reg  clk;
    reg  rst;
    reg  [DATA_W-1:0] a_in;
    reg  [DATA_W-1:0] w_in;
    wire [ACC_W-1:0]  psum_out;

    // -------------------------------------------------------------------------
    // Test vectors
    // -------------------------------------------------------------------------
    reg [DATA_W-1:0] a_vec [0:VLEN-1];
    reg [DATA_W-1:0] w_vec [0:VLEN-1];

    integer errors;
    integer i, j;
    reg [ACC_W-1:0] expected;

    // -------------------------------------------------------------------------
    // DUT instantiation
    // -------------------------------------------------------------------------
    mac_array #(
        .N     (N),
        .DATA_W(DATA_W),
        .ACC_W (ACC_W)
    ) dut (
        .clk     (clk),
        .rst     (rst),
        .a_in    (a_in),
        .w_in    (w_in),
        .psum_out(psum_out)
    );

    // -------------------------------------------------------------------------
    // Clock
    // -------------------------------------------------------------------------
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // -------------------------------------------------------------------------
    // Stimulus & checking
    //
    // One input per clock cycle. After posedge i (i >= 1) the input driven in
    // iteration i-1 has just been captured into prod[0], and older products
    // have shifted down. So psum_out, sampled 1 ns after posedge i, equals
    //
    //     sum_{k=0..N-1} a_vec[i-1-k] * w_vec[i-1-k]
    //
    // i.e. the dot product of the most-recent N test-vector entries. The
    // first fully-populated window appears at i = N.
    // -------------------------------------------------------------------------
    initial begin
        $dumpfile("tb_mac_array.vcd");
        $dumpvars(0, tb_mac_array);

        rst    = 1;
        a_in   = 0;
        w_in   = 0;
        errors = 0;

        a_vec[0] = 16'h0001; w_vec[0] = 16'h0002;
        a_vec[1] = 16'h0003; w_vec[1] = 16'h0004;
        a_vec[2] = 16'h0005; w_vec[2] = 16'h0006;
        a_vec[3] = 16'h0010; w_vec[3] = 16'h0001;
        a_vec[4] = 16'h00FF; w_vec[4] = 16'h0003;
        a_vec[5] = 16'h8000; w_vec[5] = 16'h0002;
        a_vec[6] = 16'h1234; w_vec[6] = 16'h5678;
        a_vec[7] = 16'h0100; w_vec[7] = 16'h00FF;

        // Hold reset 5 cycles, release on a posedge boundary
        repeat(5) @(posedge clk);
        @(posedge clk); rst = 0;

        // Feed one input per cycle. Sample psum_out at the same posedge, then
        // drive the next pair. Run for VLEN + N iterations so the final window
        // also gets a chance to drain.
        for (i = 0; i < VLEN + N; i = i + 1) begin
            @(posedge clk); #1;

            if (i >= N) begin
                expected = 0;
                for (j = 0; j < N; j = j + 1) begin
                    if ((i-1-j) >= 0 && (i-1-j) < VLEN)
                        expected = expected + a_vec[i-1-j] * w_vec[i-1-j];
                end

                if (psum_out !== expected) begin
                    $display("ERROR: i=%0d  expected=0x%08h  got=0x%08h",
                             i, expected, psum_out);
                    errors = errors + 1;
                end else begin
                    $display("OK:    i=%0d  psum_out=0x%08h", i, psum_out);
                end
            end

            a_in = (i < VLEN) ? a_vec[i] : {DATA_W{1'b0}};
            w_in = (i < VLEN) ? w_vec[i] : {DATA_W{1'b0}};
        end

        if (errors == 0)
            $display("PASS: mac_array unit test completed successfully.");
        else
            $display("FAIL: mac_array unit test found %0d errors.", errors);

        $finish;
    end

endmodule
