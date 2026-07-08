// tb_system_stress.v — hardened system TB that models the REAL memory
// behavior the board exposes (variable AXI read latency, single-cycle
// mem_rdata_valid pulses) instead of the idealized 1-cycle model that let
// the pipeline bugs hide in simulation.
//
// Checks, per inference (3 back-to-back):
//   * all 20 outputs bit-exact vs the golden model (tools/golden_tb_expected.py)
//   * exactly 20 memory writes, all inside the output window
//   * inference_done pulse observed
// Run 2 additionally injects a "rude" START mid-inference which the core
// interlock must ignore (this is what the polling host's retry loop does).
`timescale 1ns/1ps

module tb_system_stress;
    reg clk = 0; always #5 clk = ~clk;
    reg rst = 1;

    localparam DATA_W     = 16;
    localparam ACC_W      = 32;
    localparam ADDR_W     = 10;
    localparam MEM_ADDR_W = 20;
    localparam MEM_DATA_W = 32;
    localparam NUM_LAYERS = 4;

    reg  start_inference = 0;
    wire inference_done;
    wire system_ready;
    reg  load_weights = 0;
    wire weights_loaded;

    wire [MEM_ADDR_W-1:0] mem_addr;
    wire                  mem_read;
    reg  [MEM_DATA_W-1:0] mem_rdata;
    reg                   mem_rdata_valid;
    wire                  mem_write;
    wire [MEM_DATA_W-1:0] mem_wdata;

    reg [MEM_ADDR_W-1:0]                input_base_addr = 0;
    reg [MEM_ADDR_W-1:0]                output_base_addr = 0;
    reg [MEM_ADDR_W*NUM_LAYERS-1:0]     weights_base_addr;
    reg [15:0]                          input_size_in  = 256;
    reg [15:0]                          output_size_in = 20;
    reg [ADDR_W*NUM_LAYERS-1:0]         weights_per_layer_in;

    wire [NUM_LAYERS-1:0] layer_busy;
    wire [NUM_LAYERS-1:0] layer_ready_dbg;
    wire                  pipeline_active;

    streaming_nn_system #(
        .N(8), .DATA_W(DATA_W), .ACC_W(ACC_W), .ADDR_W(ADDR_W),
        .NUM_LAYERS(NUM_LAYERS),
        .MEM_ADDR_W(MEM_ADDR_W), .MEM_DATA_W(MEM_DATA_W)
    ) dut (
        .clk(clk), .rst(rst),
        .start_inference(start_inference),
        .inference_done(inference_done),
        .system_ready(system_ready),
        .load_weights(load_weights),
        .weights_loaded(weights_loaded),
        .mem_addr(mem_addr),
        .mem_read(mem_read),
        .mem_rdata(mem_rdata),
        .mem_rdata_valid(mem_rdata_valid),
        .mem_write(mem_write),
        .mem_wdata(mem_wdata),
        .input_base_addr(input_base_addr),
        .output_base_addr(output_base_addr),
        .weights_base_addr(weights_base_addr),
        .input_size_in(input_size_in),
        .output_size_in(output_size_in),
        .weights_per_layer_in(weights_per_layer_in),
        .layer_busy(layer_busy),
        .layer_ready_dbg(layer_ready_dbg),
        .pipeline_active(pipeline_active)
    );

    // ------------------------------------------------------------------
    // Memory model with VARIABLE read latency (1..24 cycles) and
    // single-cycle mem_rdata_valid pulses — like the real AXI HP port.
    // ------------------------------------------------------------------
    reg [31:0] mem [0:32'h100000];
    reg [31:0] out_mem [0:31];
    integer out_written = 0;
    integer bad_writes = 0;

    reg        pend = 0;
    reg [31:0] pend_data;
    reg [5:0]  pend_cnt;

    always @(posedge clk) begin
        mem_rdata_valid <= 1'b0;
        if (mem_read) begin
            if (pend) begin
                $display("[%0t] ERROR: mem_read while previous read pending", $time);
                bad_writes = bad_writes + 1;
            end
            pend_data <= mem[mem_addr];
            pend_cnt  <= 6'd1 + ($urandom % 24);
            pend      <= 1'b1;
        end else if (pend) begin
            if (pend_cnt == 6'd1) begin
                mem_rdata       <= pend_data;
                mem_rdata_valid <= 1'b1;
                pend            <= 1'b0;
            end else begin
                pend_cnt <= pend_cnt - 6'd1;
            end
        end
        if (mem_write) begin
            mem[mem_addr] <= mem_wdata;
            if (mem_addr >= output_base_addr && mem_addr < output_base_addr + 20) begin
                out_mem[mem_addr - output_base_addr] <= mem_wdata;
                out_written <= out_written + 1;
            end else begin
                $display("[%0t] ERROR: write outside output window @%05x", $time, mem_addr);
                bad_writes = bad_writes + 1;
            end
        end
    end

    reg [31:0] in_words [0:255];
    reg [31:0] wgt_l0   [0:35];
    reg [31:0] wgt_l3   [0:719];
    reg [31:0] expected [0:19];

    integer i, run, errors, total_errors;
    integer done_seen;

    initial begin
        $readmemh("tb_input.memh",  in_words);
        $readmemh("tb_wgt_l0.memh", wgt_l0);
        $readmemh("tb_wgt_l3.memh", wgt_l3);

        // expected L3 outputs for tb_input.memh (tools/golden_tb_expected.py)
        expected[0] = 32'h48DA0000;
        expected[1] = 32'hA2BA0000;
        expected[2] = 32'h089A0000;
        expected[3] = 32'h187A0000;
        expected[4] = 32'hF45A0000;
        expected[5] = 32'h0A3A0000;
        expected[6] = 32'h4D1A0000;
        expected[7] = 32'hA9FA0000;
        expected[8] = 32'h7ADA0000;
        expected[9] = 32'hC7BA0000;
        expected[10] = 32'h109A0000;
        expected[11] = 32'h947A0000;
        expected[12] = 32'hEE5A0000;
        expected[13] = 32'h543A0000;
        expected[14] = 32'h641A0000;
        expected[15] = 32'hD2FA0000;
        expected[16] = 32'h55DA0000;
        expected[17] = 32'h98BA0000;
        expected[18] = 32'hC89A0000;
        expected[19] = 32'hC67A0000;
    end

    // count done pulses (must be exactly 1 per inference)
    always @(posedge clk) if (inference_done) done_seen = done_seen + 1;

    initial begin
        total_errors = 0;

        for (i = 0; i < 32'h100000; i = i + 1) mem[i] = 32'h0;
        for (i = 0; i < 256; i = i + 1) mem[i] = in_words[i];
        for (i = 0; i < 36;  i = i + 1) mem[20'h20000 + i] = wgt_l0[i];
        for (i = 0; i < 720; i = i + 1) mem[20'h20024 + i] = wgt_l3[i];

        input_base_addr  = 20'h00000;
        output_base_addr = 20'h04000;
        weights_base_addr = 0;
        weights_base_addr[MEM_ADDR_W*0 +: MEM_ADDR_W] = 20'h20000;

        weights_per_layer_in = 0;
        weights_per_layer_in[ADDR_W*0 +: ADDR_W] = 36;
        weights_per_layer_in[ADDR_W*3 +: ADDR_W] = 720;

        mem_rdata = 0;
        mem_rdata_valid = 0;

        #100 rst = 0;
        #50;

        // Load weights once
        @(negedge clk); load_weights = 1;
        @(negedge clk); load_weights = 0;
        i = 0;
        while (!weights_loaded && i < 500000) begin @(posedge clk); i = i + 1; end
        if (!weights_loaded) begin
            $display("FATAL: weights never loaded"); $finish;
        end
        $display("[%0t] weights loaded (%0d cycles)", $time, i);

        // -------- three back-to-back inferences --------
        for (run = 0; run < 3; run = run + 1) begin
            out_written = 0;
            done_seen = 0;
            for (i = 0; i < 20; i = i + 1) out_mem[i] = 32'hDEADBEEF;
            #50;

            $display("[%0t] === RUN %0d: start ===", $time, run);
            @(negedge clk); start_inference = 1;
            @(negedge clk); start_inference = 0;

            // Run 1 gets a rude START mid-inference (like the host retry
            // loop). The interlock must ignore it.
            if (run == 1) begin
                #3000;   // well inside the frame
                $display("[%0t]   injecting rude START mid-inference", $time);
                @(negedge clk); start_inference = 1;
                @(negedge clk); start_inference = 0;
            end

            i = 0;
            while (done_seen == 0 && i < 2000000) begin @(posedge clk); i = i + 1; end
            if (done_seen == 0) begin
                $display("[%0t] RUN %0d: TIMEOUT (out_written=%0d layer_busy=%b)",
                         $time, run, out_written, layer_busy);
                total_errors = total_errors + 1;
            end else begin
                // let the last write settle
                #100;
                errors = 0;
                if (out_written != 20) begin
                    $display("  RUN %0d: out_written=%0d (expected 20)", run, out_written);
                    errors = errors + 1;
                end
                for (i = 0; i < 20; i = i + 1) begin
                    if (out_mem[i] !== expected[i]) begin
                        $display("  RUN %0d: out[%0d]=%08x expected %08x  MISMATCH",
                                 run, i, out_mem[i], expected[i]);
                        errors = errors + 1;
                    end
                end
                if (errors == 0)
                    $display("[%0t] RUN %0d: PASS (20/20 outputs bit-exact, done pulses=%0d)",
                             $time, run, done_seen);
                total_errors = total_errors + errors;
            end

            // wait for the pipeline to fully drain before the next frame
            i = 0;
            while ((pipeline_active || (|layer_busy)) && i < 200000) begin
                @(posedge clk); i = i + 1;
            end
        end

        total_errors = total_errors + bad_writes;
        if (total_errors == 0)
            $display("*** TB RESULT: ALL 3 RUNS PASS ***");
        else
            $display("*** TB RESULT: %0d ERRORS ***", total_errors);
        $finish;
    end

    initial begin
        #500000000;
        $display("*** SIM TIMEOUT ***");
        $finish;
    end
endmodule
