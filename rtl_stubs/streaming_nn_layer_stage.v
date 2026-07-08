// Single Streaming NN Layer Stage  (clean rewrite)
//
// Flow:
//   1. INGEST  - accept stream_in pixels, write them sequentially to act_mem
//                (addresses 0..N_IN-1)
//   2. COMPUTE - pulse ctrl_start to control_unit; wait for ctrl_done
//   3. STREAM_OUT - read out_mem sequentially (0..N_OUT-1), present on
//                   stream_out interface with valid/ready handshake
//   4. back to IDLE for the next frame
//
// Weight BRAM is loaded via the wgt_load_* port at start of day.
//
// Notes:
// - The previous design tried to use a 3-row sliding row_buffer between the
//   stream input and the control_unit, but the control_unit's address
//   generator assumes the FULL feature-map is laid out flat in act_mem
//   (so addresses go up to img_rows*img_cols-1). The two are incompatible
//   and produced a stall after one output row (= 14*4 = 56 outputs). The
//   simpler "absorb whole image, then compute" approach matches the
//   control_unit's assumption and uses ADDR_W=10 (1024 entries) which is
//   enough for the largest YOLO-Nano layer (14*14*4 = 784).

module streaming_nn_layer_stage #(
    parameter LAYER_TYPE      = 0,         // 0=CONV  1=FC  2=POOL
    parameter N               = 8,         // MAC array width (unused in
                                           // this fixed datapath but kept
                                           // for port compatibility)
    parameter DATA_W          = 16,
    parameter ACC_W           = 32,
    parameter ADDR_W          = 10,

    parameter IMG_ROWS        = 32,
    parameter IMG_COLS        = 32,
    parameter KERNEL_SIZE     = 3,
    parameter STRIDE          = 1,
    parameter PADDING         = 0,
    parameter IN_CHANNELS     = 1,
    parameter OUT_CHANNELS    = 16,
    parameter POOL_SIZE       = 2,

    parameter FC_INPUT_SIZE   = 128,
    parameter FC_OUTPUT_SIZE  = 64,

    // Derived
    parameter OUT_ROWS = (LAYER_TYPE == 0) ?
                          ((IMG_ROWS + 2*PADDING - KERNEL_SIZE) / STRIDE + 1) :
                        (LAYER_TYPE == 2) ? (IMG_ROWS / POOL_SIZE) : 1,
    parameter OUT_COLS = (LAYER_TYPE == 0) ?
                          ((IMG_COLS + 2*PADDING - KERNEL_SIZE) / STRIDE + 1) :
                        (LAYER_TYPE == 2) ? (IMG_COLS / POOL_SIZE) : 1
)(
    input  wire clk,
    input  wire rst,

    // Upstream input stream
    input  wire [DATA_W-1:0] stream_in_data,
    input  wire              stream_in_valid,
    output wire              stream_in_ready,

    // Downstream output stream
    output wire [ACC_W-1:0]  stream_out_data,
    output wire              stream_out_valid,
    input  wire              stream_out_ready,

    // Weight loading interface (loaded once at startup)
    input  wire              wgt_load_en,
    input  wire [ADDR_W-1:0] wgt_load_addr,
    input  wire [DATA_W-1:0] wgt_load_data,

    // Status
    output wire layer_ready,
    output wire layer_busy
);

    // ---- Mode for control_unit ---------------------------------------------
    localparam [1:0] MODE = (LAYER_TYPE == 0) ? 2'b00 :   // CONV
                            (LAYER_TYPE == 1) ? 2'b01 :   // FC
                            (LAYER_TYPE == 2) ? 2'b10 :   // POOL
                                                2'b00;

    // ---- Expected input / output element counts ----------------------------
    localparam integer N_IN  = (LAYER_TYPE == 1) ? FC_INPUT_SIZE
                                                 : (IMG_ROWS * IMG_COLS * IN_CHANNELS);
    localparam integer N_OUT = (LAYER_TYPE == 0) ? (OUT_ROWS * OUT_COLS * OUT_CHANNELS)
                              : (LAYER_TYPE == 1) ? FC_OUTPUT_SIZE
                              :                     (OUT_ROWS * OUT_COLS * IN_CHANNELS);

    // ---- Width-bounded parameter slices for control_unit ports -------------
    localparam [7:0]  P_IMG_ROWS       = IMG_ROWS;
    localparam [7:0]  P_IMG_COLS       = IMG_COLS;
    localparam [7:0]  P_KERNEL_SIZE    = KERNEL_SIZE;
    localparam [7:0]  P_STRIDE         = STRIDE;
    localparam [7:0]  P_PADDING        = PADDING;
    localparam [7:0]  P_IN_CHANNELS    = IN_CHANNELS;
    localparam [7:0]  P_OUT_CHANNELS   = OUT_CHANNELS;
    localparam [7:0]  P_POOL_SIZE      = POOL_SIZE;
    localparam [15:0] P_FC_INPUT_SIZE  = FC_INPUT_SIZE;
    localparam [15:0] P_FC_OUTPUT_SIZE = FC_OUTPUT_SIZE;

    // ---- BRAMs --------------------------------------------------------------
    reg [DATA_W-1:0] wgt_mem [0:(1<<ADDR_W)-1];
    reg [DATA_W-1:0] act_mem [0:(1<<ADDR_W)-1];
    reg [ACC_W-1:0]  out_mem [0:(1<<ADDR_W)-1];

    // Zero-init all mems so simulation doesn't propagate X's from unread
    // BRAM slots. On synthesis Vivado infers the same (BRAM comes out of
    // config-load with 0 unless INIT is set), so this doesn't affect
    // hardware behavior.
    integer mem_init_i;
    initial begin
        for (mem_init_i = 0; mem_init_i < (1<<ADDR_W); mem_init_i = mem_init_i + 1) begin
            wgt_mem[mem_init_i] = {DATA_W{1'b0}};
            act_mem[mem_init_i] = {DATA_W{1'b0}};
            out_mem[mem_init_i] = {ACC_W{1'b0}};
        end
    end

    // Weight BRAM: write from external loader, read from control_unit
    wire                wgt_re_cu;
    wire [ADDR_W-1:0]   wgt_raddr_cu;
    reg  [DATA_W-1:0]   wgt_rdata;
    always @(posedge clk) begin
        if (wgt_load_en) wgt_mem[wgt_load_addr] <= wgt_load_data;
        if (wgt_re_cu)   wgt_rdata <= wgt_mem[wgt_raddr_cu];
    end

    // Activation BRAM: write from ingest FSM, read from control_unit
    reg              act_we_fsm;
    reg [ADDR_W-1:0] act_waddr_fsm;
    reg [DATA_W-1:0] act_wdata_fsm;
    wire             act_re_cu;
    wire [ADDR_W-1:0] act_raddr_cu;
    reg  [DATA_W-1:0] act_rdata;
    always @(posedge clk) begin
        if (act_we_fsm) act_mem[act_waddr_fsm] <= act_wdata_fsm;
        if (act_re_cu)  act_rdata <= act_mem[act_raddr_cu];
    end

    // Output BRAM. Writes are committed by the MAC accumulator (one write
    // per fully accumulated output pixel), not on every control_unit
    // out_we_cu pulse — the control_unit pulses out_we_cu every inner-loop
    // cycle, but only the SUM across the inner loop is the real output.
    wire              out_we_cu;          // pulses every COMPUTE cycle from control_unit (unused for write)
    wire [ADDR_W-1:0] out_waddr_cu;
    reg               out_re_fsm;
    reg  [ADDR_W-1:0] out_raddr_fsm;
    reg  [ACC_W-1:0]  out_rdata;

    // 1-cycle pipeline of out_we_cu / out_waddr_cu so they align with
    // act_rdata / wgt_rdata which arrive 1 cycle after the control_unit
    // issued the read.
    reg               out_we_d;
    reg [ADDR_W-1:0]  out_waddr_d;
    always @(posedge clk) begin
        out_we_d    <= out_we_cu;
        out_waddr_d <= out_waddr_cu;
    end

    // ---- Accumulator / activation datapath ---------------------------------
    // Per-layer semantics:
    //   CONV (LAYER_TYPE=0): out[i] = ReLU( sum_j(act_j * wgt_j) )
    //                        inner-loop length = K * K * IN_CH
    //   FC   (LAYER_TYPE=1): out[i] = sum_j(act_j * wgt_j)     [no ReLU on head]
    //                        inner-loop length = FC_INPUT_SIZE
    //   POOL (LAYER_TYPE=2): out[i] = max_j(act_j)              [MAX pool]
    //                        inner-loop length = POOL_SIZE * POOL_SIZE
    localparam integer N_MAC_PER_OUT =
        (LAYER_TYPE == 0) ? (KERNEL_SIZE * KERNEL_SIZE * IN_CHANNELS) :
        (LAYER_TYPE == 1) ? FC_INPUT_SIZE :
        (LAYER_TYPE == 2) ? (POOL_SIZE * POOL_SIZE) :
                            1;
    localparam integer MAC_CNT_W = (N_MAC_PER_OUT <= 1) ? 1 : $clog2(N_MAC_PER_OUT + 1);

    wire signed [DATA_W-1:0]   mac_a   = $signed(act_rdata);
    wire signed [DATA_W-1:0]   mac_b   = $signed(wgt_rdata);
    wire signed [2*DATA_W-1:0] product = mac_a * mac_b;

    // product_ext: adapt 2*DATA_W-bit signed product to ACC_W. When ACC_W >
    // 2*DATA_W we sign-extend; otherwise we truncate to ACC_W bits (this
    // second path fires for POOL/FC layers where DATA_W = ACC_W = 32 and the
    // 64-bit product must fold into a 32-bit accumulator like the on-board
    // implementation). Using a generate avoids negative-width replication,
    // which xelab rejects with SIGSEGV.
    wire signed [ACC_W-1:0]    product_ext;
    generate
        if (ACC_W > 2*DATA_W) begin : GEN_PROD_SEXT
            assign product_ext =
                {{(ACC_W-2*DATA_W){product[2*DATA_W-1]}}, product};
        end else begin : GEN_PROD_TRUNC
            assign product_ext = product[ACC_W-1:0];
        end
    endgenerate

    // act_ext: sign-extend DATA_W-bit activation to ACC_W.
    wire signed [ACC_W-1:0]    act_ext;
    generate
        if (ACC_W > DATA_W) begin : GEN_ACT_SEXT
            assign act_ext = {{(ACC_W-DATA_W){mac_a[DATA_W-1]}}, mac_a};
        end else begin : GEN_ACT_PASS
            assign act_ext = mac_a;
        end
    endgenerate

    reg            ctrl_start;   // declared here: used by the accumulator re-arm below
    reg signed [ACC_W-1:0] acc;
    reg [MAC_CNT_W-1:0]    mac_cnt;
    reg                    commit_we;
    reg [ADDR_W-1:0]       commit_addr;
    reg signed [ACC_W-1:0] commit_val;

    // Pre-compute next-cycle candidate accumulators for each mode.
    wire signed [ACC_W-1:0] next_acc_conv_fc = (mac_cnt == 0) ? product_ext
                                                              : (acc + product_ext);
    wire signed [ACC_W-1:0] next_acc_pool    = (mac_cnt == 0) ? act_ext
                                              : (act_ext > acc) ? act_ext
                                                                : acc;
    wire signed [ACC_W-1:0] next_acc = (LAYER_TYPE == 2) ? next_acc_pool
                                                          : next_acc_conv_fc;

    // ReLU clamp — only CONV layers apply activation.
    wire signed [ACC_W-1:0] activated =
        (LAYER_TYPE == 0) ? ((next_acc[ACC_W-1]) ? {ACC_W{1'b0}} : next_acc)
                          : next_acc;

    always @(posedge clk) begin
        if (rst) begin
            acc         <= {ACC_W{1'b0}};
            mac_cnt     <= {MAC_CNT_W{1'b0}};
            commit_we   <= 1'b0;
            commit_addr <= {ADDR_W{1'b0}};
            commit_val  <= {ACC_W{1'b0}};
        end else begin
            commit_we <= 1'b0;
            if (ctrl_start) begin
                // Frame-boundary re-arm: the control unit can emit trailing
                // out_we pulses after the last real commit, leaving mac_cnt
                // nonzero. Frame 1 still commits correctly, but frame 2 then
                // accumulates PHASE-SHIFTED and every output is wrong. Clear
                // at each new fire so frames are self-aligned. (ctrl_start
                // and out_we_d are never high together — the control unit is
                // idle when the stage fires it.)
                acc     <= {ACC_W{1'b0}};
                mac_cnt <= {MAC_CNT_W{1'b0}};
            end else if (out_we_d) begin
                acc <= next_acc;

                if (mac_cnt + 1 == N_MAC_PER_OUT) begin
                    commit_we   <= 1'b1;
                    commit_addr <= out_waddr_d;
                    commit_val  <= activated;
                    mac_cnt     <= {MAC_CNT_W{1'b0}};
                end else begin
                    mac_cnt <= mac_cnt + 1;
                end
            end
        end
    end

    always @(posedge clk) begin
        if (commit_we)  out_mem[commit_addr] <= commit_val;
        if (out_re_fsm) out_rdata <= out_mem[out_raddr_fsm];
    end

    // ---- Outer FSM ----------------------------------------------------------
    localparam ST_IDLE     = 3'd0;
    localparam ST_INGEST   = 3'd1;
    localparam ST_FIRE     = 3'd2;
    localparam ST_WAIT     = 3'd3;
    localparam ST_STREAM   = 3'd4;
    localparam ST_DONE     = 3'd5;

    reg [2:0] state;

    // Counters sized to ADDR_W so they can index the full BRAM
    reg [ADDR_W:0] in_cnt;
    reg [ADDR_W:0] out_cnt;
    reg            out_re_d;   // 1-cycle pipe so valid lines up with rdata
    // After a handshake fires we need to pause valid for one cycle to wait
    // for the BRAM read at the newly incremented address to land — otherwise
    // stream_out_data still shows the previous slot's value and the
    // downstream layer captures it a second time.
    reg            stream_hold;

    wire           ctrl_done;
    wire           ctrl_busy;

    // Allow upstream to push whenever we're in INGEST or IDLE; we'll latch
    // pixels into act_mem unconditionally (back-pressure when busy elsewhere).
    assign stream_in_ready = (state == ST_IDLE) || (state == ST_INGEST);

    always @(posedge clk) begin
        if (rst) begin
            state         <= ST_IDLE;
            in_cnt        <= 0;
            out_cnt       <= 0;
            ctrl_start    <= 1'b0;
            act_we_fsm    <= 1'b0;
            act_waddr_fsm <= 0;
            act_wdata_fsm <= 0;
            out_re_fsm    <= 1'b0;
            out_raddr_fsm <= 0;
            out_re_d      <= 1'b0;
            stream_hold   <= 1'b0;
        end else begin
            // defaults
            act_we_fsm <= 1'b0;
            ctrl_start <= 1'b0;
            out_re_fsm <= 1'b0;
            out_re_d   <= out_re_fsm;
            stream_hold <= 1'b0;    // pulse for exactly 1 cycle after each handshake

            case (state)
                ST_IDLE: begin
                    in_cnt  <= 0;
                    out_cnt <= 0;
                    if (stream_in_valid) begin
                        // first pixel: write straight to addr 0 and start counting
                        act_we_fsm    <= 1'b1;
                        act_waddr_fsm <= 0;
                        act_wdata_fsm <= stream_in_data;
                        in_cnt        <= 1;
                        if (N_IN <= 1)
                            state <= ST_FIRE;
                        else
                            state <= ST_INGEST;
                    end
                end

                ST_INGEST: begin
                    if (stream_in_valid) begin
                        act_we_fsm    <= 1'b1;
                        act_waddr_fsm <= in_cnt[ADDR_W-1:0];
                        act_wdata_fsm <= stream_in_data;
                        in_cnt        <= in_cnt + 1;
                        if (in_cnt + 1 == N_IN) begin
                            state <= ST_FIRE;
                        end
                    end
                end

                ST_FIRE: begin
                    if (!ctrl_busy) begin
                        ctrl_start <= 1'b1;
                        state      <= ST_WAIT;
                    end
                end

                ST_WAIT: begin
                    if (ctrl_done) begin
                        state         <= ST_STREAM;
                        out_cnt       <= 0;
                        // issue first read so out_rdata is ready next cycle
                        out_re_fsm    <= 1'b1;
                        out_raddr_fsm <= 0;
                    end
                end

                ST_STREAM: begin
                    if (stream_out_ready && out_re_d && !stream_hold) begin
                        if (out_cnt + 1 == N_OUT) begin
                            state      <= ST_DONE;
                            out_re_fsm <= 1'b0;
                        end else begin
                            out_cnt       <= out_cnt + 1;
                            out_raddr_fsm <= out_raddr_fsm + 1;
                            out_re_fsm    <= 1'b1;
                            stream_hold   <= 1'b1;   // BRAM read at new addr needs 1 cycle
                        end
                    end else begin
                        out_re_fsm <= 1'b1;   // hold
                    end
                end

                ST_DONE: begin
                    // Wait one cycle for downstream to take the final word,
                    // then go IDLE for the next frame.
                    state <= ST_IDLE;
                end

                default: state <= ST_IDLE;
            endcase
        end
    end

    // out_re_d is asserted the cycle AFTER out_re_fsm. When it's high,
    // out_rdata contains the value at out_raddr_fsm (now the previously-
    // issued address). Present that to downstream.
    assign stream_out_data  = out_rdata;
    assign stream_out_valid = (state == ST_STREAM) && out_re_d && !stream_hold;

    assign layer_ready = (state == ST_IDLE);
    assign layer_busy  = (state != ST_IDLE);

    // ---- Control unit instance --------------------------------------------
    wire [10:0] rows_buffered_unused = {{(10){1'b0}}, (state == ST_FIRE) || (state == ST_WAIT)};
    wire [10:0] out_rows_produced_unused;

    nn_layer_control_unit #(
        .ADDR_W(ADDR_W),
        .DATA_W(DATA_W),
        .ACC_W(ACC_W)
    ) control_unit (
        .clk(clk),
        .rst(rst),
        .mode(MODE),
        .start(ctrl_start),
        .done(ctrl_done),
        .busy(ctrl_busy),
        .img_rows(P_IMG_ROWS),
        .img_cols(P_IMG_COLS),
        .kernel_size(P_KERNEL_SIZE),
        .stride(P_STRIDE),
        .padding(P_PADDING),
        .in_channels(P_IN_CHANNELS),
        .out_channels(P_OUT_CHANNELS),
        .pool_size(P_POOL_SIZE),
        .fc_input_size(P_FC_INPUT_SIZE),
        .fc_output_size(P_FC_OUTPUT_SIZE),

        .act_we(),                 // we drive act_mem write port ourselves
        .act_waddr(),
        .act_re(act_re_cu),
        .act_raddr(act_raddr_cu),

        .wgt_we(),                 // wgt_load_en is the only writer
        .wgt_waddr(),
        .wgt_re(wgt_re_cu),
        .wgt_raddr(wgt_raddr_cu),

        .out_we(out_we_cu),
        .out_waddr(out_waddr_cu),
        .out_re(),                 // stream_out FSM drives out_mem read port
        .out_raddr(),

        .in_rows_buffered(rows_buffered_unused),
        .out_rows_produced(out_rows_produced_unused)
    );

endmodule
