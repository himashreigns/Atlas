// =============================================================================
// tb_layer_stage_yolo.v
//
// Stand-alone xsim testbench that drives ONE streaming_nn_layer_stage with
// YOLO-Nano Layer 0 parameters (CONV 3x3, 1->4 channels, 16x16 input) so we
// can watch its compute FSM in a waveform and figure out why it stalls
// mid-compute on real hardware.
// =============================================================================
`timescale 1ns / 1ps

module tb_layer_stage_yolo;

    // ---- Clock / reset ------------------------------------------------------
    reg clk = 0;
    always #5 clk = ~clk;   // 100 MHz
    reg rst = 1;

    // ---- Layer parameters (mirror pipeline Layer 0 for YOLO) ----------------
    localparam DATA_W      = 16;
    localparam ACC_W       = 32;
    localparam ADDR_W      = 10;
    localparam IMG_ROWS    = 16;
    localparam IMG_COLS    = 16;
    localparam KERNEL_SIZE = 3;
    localparam IN_CH       = 1;
    localparam OUT_CH      = 4;
    localparam N_WEIGHTS   = KERNEL_SIZE*KERNEL_SIZE*IN_CH*OUT_CH;  // 36
    localparam N_INPUTS    = IMG_ROWS * IMG_COLS;                   // 256
    localparam OUT_W       = IMG_COLS - KERNEL_SIZE + 1;            // 14
    localparam OUT_H       = IMG_ROWS - KERNEL_SIZE + 1;            // 14
    localparam N_OUTPUTS   = OUT_W * OUT_H * OUT_CH;                // 784

    // ---- DUT signals --------------------------------------------------------
    reg  [DATA_W-1:0]  stream_in_data;
    reg                stream_in_valid;
    wire               stream_in_ready;
    wire [ACC_W-1:0]   stream_out_data;
    wire               stream_out_valid;
    reg                stream_out_ready;
    reg                wgt_load_en;
    reg  [ADDR_W-1:0]  wgt_load_addr;
    reg  [DATA_W-1:0]  wgt_load_data;
    wire               layer_ready;
    wire               layer_busy;

    streaming_nn_layer_stage #(
        .LAYER_TYPE  (0),    // CONV
        .DATA_W      (DATA_W),
        .ACC_W       (ACC_W),
        .ADDR_W      (ADDR_W),
        .IMG_ROWS    (IMG_ROWS),
        .IMG_COLS    (IMG_COLS),
        .KERNEL_SIZE (KERNEL_SIZE),
        .STRIDE      (1),
        .PADDING     (0),
        .IN_CHANNELS (IN_CH),
        .OUT_CHANNELS(OUT_CH)
    ) dut (
        .clk            (clk),
        .rst            (rst),
        .stream_in_data (stream_in_data),
        .stream_in_valid(stream_in_valid),
        .stream_in_ready(stream_in_ready),
        .stream_out_data(stream_out_data),
        .stream_out_valid(stream_out_valid),
        .stream_out_ready(stream_out_ready),
        .wgt_load_en    (wgt_load_en),
        .wgt_load_addr  (wgt_load_addr),
        .wgt_load_data  (wgt_load_data),
        .layer_ready    (layer_ready),
        .layer_busy     (layer_busy)
    );

    // ---- Counters for visibility --------------------------------------------
    integer pixels_sent  = 0;
    integer outputs_seen = 0;
    integer cycle_count  = 0;

    always @(posedge clk) cycle_count <= cycle_count + 1;
    always @(posedge clk) if (stream_in_valid && stream_in_ready) pixels_sent <= pixels_sent + 1;
    always @(posedge clk) if (stream_out_valid && stream_out_ready) outputs_seen <= outputs_seen + 1;

    // ---- Trace layer_stage FSM transitions ----------------------------------
    reg [2:0] last_state = 3'b111;
    always @(posedge clk) begin
        if (dut.state !== last_state) begin
            $display("[%0t] layer_stage state %0d -> %0d  (ctrl_busy=%b ctrl_done=%b ctrl_start=%b in_cnt=%0d out_cnt=%0d)",
                     $time, last_state, dut.state, dut.ctrl_busy, dut.ctrl_done, dut.ctrl_start,
                     dut.in_cnt, dut.out_cnt);
            last_state <= dut.state;
        end
    end

    // ---- Trace control_unit FSM transitions ---------------------------------
    reg [2:0] last_cu_state = 3'b111;
    always @(posedge clk) begin
        if (dut.control_unit.state !== last_cu_state) begin
            $display("[%0t]   ctrl_unit state %0d -> %0d  (busy=%b done=%b row=%0d col=%0d ch_out=%0d kr=%0d kc=%0d)",
                     $time, last_cu_state, dut.control_unit.state,
                     dut.control_unit.busy, dut.control_unit.done,
                     dut.control_unit.row_cnt, dut.control_unit.col_cnt,
                     dut.control_unit.ch_out_cnt, dut.control_unit.kr_cnt, dut.control_unit.kc_cnt);
            last_cu_state <= dut.control_unit.state;
        end
    end

    // ---- Stimulus -----------------------------------------------------------
    integer i;
    initial begin
        $dumpfile("tb_layer_stage_yolo.vcd");
        $dumpvars(0, tb_layer_stage_yolo);

        stream_in_data  = 0;
        stream_in_valid = 0;
        stream_out_ready = 1;
        wgt_load_en   = 0;
        wgt_load_addr = 0;
        wgt_load_data = 0;

        // Hold reset
        #100 rst = 0;
        #50;

        // ---- Load weights -----------------------------------------------
        $display("[%0t] loading %0d weights...", $time, N_WEIGHTS);
        for (i = 0; i < N_WEIGHTS; i = i + 1) begin
            @(negedge clk);
            wgt_load_en   = 1;
            wgt_load_addr = i;
            wgt_load_data = 16'h0100 + i;   // simple test pattern
        end
        @(negedge clk);
        wgt_load_en = 0;

        #50;
        $display("[%0t] starting input stream (256 pixels)...", $time);

        // ---- Feed 256 input pixels --------------------------------------
        for (i = 0; i < N_INPUTS; i = i + 1) begin
            @(negedge clk);
            stream_in_data  = i;     // pattern: pixel value = index
            stream_in_valid = 1;
            // Honour back-pressure
            wait (stream_in_ready);
        end
        @(negedge clk);
        stream_in_valid = 0;

        $display("[%0t] all %0d pixels sent. Waiting for %0d outputs...",
                 $time, N_INPUTS, N_OUTPUTS);

        // ---- Wait for outputs or timeout --------------------------------
        i = 0;
        while (outputs_seen < N_OUTPUTS && i < 50000) begin
            @(posedge clk);
            i = i + 1;
            if ((i % 5000) == 0) begin
                $display("[%0t] tick %0d: pixels_sent=%0d  outputs_seen=%0d  busy=%b ready=%b stream_in_ready=%b state=%0d cu_state=%0d",
                         $time, i, pixels_sent, outputs_seen, layer_busy, layer_ready, stream_in_ready,
                         dut.state, dut.control_unit.state);
            end
        end

        if (outputs_seen >= N_OUTPUTS) begin
            $display("[%0t] DONE: got all %0d outputs in %0d cycles", $time, outputs_seen, cycle_count);
        end else begin
            $display("[%0t] STALLED: only %0d/%0d outputs after %0d wait cycles",
                     $time, outputs_seen, N_OUTPUTS, i);
            $display("       final: pixels_sent=%0d busy=%b ready=%b stream_in_ready=%b stream_out_valid=%b",
                     pixels_sent, layer_busy, layer_ready, stream_in_ready, stream_out_valid);
        end

        #200;
        $finish;
    end

    // Hard simulation timeout
    initial begin
        #20000000;   // 20 ms sim time
        $display("[%0t] *** SIM TIMEOUT — likely deadlocked ***", $time);
        $display("       pixels_sent=%0d outputs_seen=%0d busy=%b ready=%b",
                 pixels_sent, outputs_seen, layer_busy, layer_ready);
        $finish;
    end

endmodule
