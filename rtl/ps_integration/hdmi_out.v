// =============================================================================
// hdmi_out.v — framebuffer scanout for the ZedBoard ADV7511 HDMI transmitter
//              (+ grayscale VGA tap as a bring-up fallback)
//
//   DDR framebuffer (YUYV 640x480) --AXI-HP read--> line ping-pong BRAM
//        --pixel clock domain--> 16-bit YCbCr 4:2:2 bus to ADV7511
//
// Timing: 640x480@60 (DMT), pixel clock 25 MHz (PS FCLK1; 25.0 vs the
// nominal 25.175 gives ~59.5 Hz — accepted by essentially all monitors).
//
// Clocking / CDC:
//   aclk      : AXI domain (FCLK0). AXI-Lite regs, fetch FSM, I2C bit-bang.
//   pixel_clk : scanout domain (FCLK1, 25 MHz).
//   The two meet ONLY at (a) the dual-clock line BRAM, (b) a line-request
//   toggle + quasi-static line number, (c) synchronized enable/test bits.
//
// Register map (AXI-Lite, byte offsets):
//   0x00 CTRL   [0]=enable  [1]=yc_swap  [2]=cbcr_swap  [3]=test_pattern
//               [4]=W1: clear sticky status
//   0x04 FB     framebuffer byte base address (default 0x10100000)
//   0x08 STATUS [0]=fetch overrun (sticky)  [15:8]=frame counter (pixel dom.)
//   0x0C I2C    legacy bit-bang register, pads removed — the ADV7511 I2C now
//               lives on a real axi_iic controller in the BD. Writes are
//               accepted, reads report the bus idle ([8]=sda=1 [9]=scl=1).
// =============================================================================

module hdmi_out #(
    parameter AXI_LITE_ADDR_W = 16,
    parameter AXI_ID_W        = 6,
    parameter [31:0] FB_DEFAULT = 32'h1010_0000,
    // 640x480@60 DMT timing; overridable so the TB can run a small frame
    parameter H_ACT = 640, H_FP = 16, H_SYNC = 96, H_BP = 48,
    parameter V_ACT = 480, V_FP = 10, V_SYNC = 2,  V_BP = 33
)(
    input  wire aclk,
    input  wire aresetn,
    input  wire pixel_clk,

    // ---- AXI-Lite slave (control) ------------------------------------------
    input  wire [AXI_LITE_ADDR_W-1:0] s_axi_lite_awaddr,
    input  wire [2:0]  s_axi_lite_awprot,
    input  wire        s_axi_lite_awvalid,
    output wire        s_axi_lite_awready,
    input  wire [31:0] s_axi_lite_wdata,
    input  wire [3:0]  s_axi_lite_wstrb,
    input  wire        s_axi_lite_wvalid,
    output wire        s_axi_lite_wready,
    output wire [1:0]  s_axi_lite_bresp,
    output wire        s_axi_lite_bvalid,
    input  wire        s_axi_lite_bready,
    input  wire [AXI_LITE_ADDR_W-1:0] s_axi_lite_araddr,
    input  wire [2:0]  s_axi_lite_arprot,
    input  wire        s_axi_lite_arvalid,
    output wire        s_axi_lite_arready,
    output wire [31:0] s_axi_lite_rdata,
    output wire [1:0]  s_axi_lite_rresp,
    output wire        s_axi_lite_rvalid,
    input  wire        s_axi_lite_rready,

    // ---- AXI4 read-only master (framebuffer fetch) -------------------------
    output wire [AXI_ID_W-1:0] m_axi_hp_arid,
    output wire [31:0] m_axi_hp_araddr,
    output wire [7:0]  m_axi_hp_arlen,
    output wire [2:0]  m_axi_hp_arsize,
    output wire [1:0]  m_axi_hp_arburst,
    output wire [1:0]  m_axi_hp_arlock,
    output wire [3:0]  m_axi_hp_arcache,
    output wire [2:0]  m_axi_hp_arprot,
    output wire [3:0]  m_axi_hp_arqos,
    output wire        m_axi_hp_arvalid,
    input  wire        m_axi_hp_arready,
    input  wire [AXI_ID_W-1:0] m_axi_hp_rid,
    input  wire [31:0] m_axi_hp_rdata,
    input  wire [1:0]  m_axi_hp_rresp,
    input  wire        m_axi_hp_rlast,
    input  wire        m_axi_hp_rvalid,
    output wire        m_axi_hp_rready,

    // ---- ADV7511 (HDMI) ------------------------------------------------------
    output wire        hdmi_clk,      // pixel clock forwarded via ODDR
    output wire [15:0] hdmi_d,        // {Y[7:0], C[7:0]} YCbCr 4:2:2
    output reg         hdmi_de,
    output reg         hdmi_hsync,
    output reg         hdmi_vsync,

    // ---- VGA (grayscale fallback) -------------------------------------------
    output wire [3:0]  vga_r,
    output wire [3:0]  vga_g,
    output wire [3:0]  vga_b,
    output reg         vga_hsync,
    output reg         vga_vsync
);

    // ---- 640x480@60 timing (negative sync polarity) -------------------------
    localparam H_TOT = H_ACT + H_FP + H_SYNC + H_BP;   // 800
    localparam V_TOT = V_ACT + V_FP + V_SYNC + V_BP;   // 525
    localparam WORDS_PER_LINE = H_ACT / 2;             // 320 x 32-bit (YUYV)

    // =========================================================================
    // AXI-Lite control registers (aclk)
    // =========================================================================
    reg        ctrl_enable, ctrl_yc_swap, ctrl_cbcr_swap, ctrl_testpat;
    reg        ctrl_mono;   // send Y in the C slot: forces R=G=B downstream
    reg [31:0] fb_base;
    reg        i2c_sda_low, i2c_scl_low;
    reg        st_overrun;
    reg        fetch_overrun_set;   // driven by the fetch FSM below
    wire       scl_in, sda_in;      // I2C pad read-back (IOBUF outputs below)

    // Canonical Xilinx AXI-Lite slave template (mirrors the accelerator's
    // proven axi_lite_ctrl_slave.v): ready held high proactively, captured
    // on valid&&ready, response valid strictly AFTER the address handshake.
    // (The first cut asserted rvalid in the same cycle as arready, which the
    // protocol converter treated as an orphan R beat -> bus deadlock.)
    reg aw_done, w_done, ar_done;
    reg awready_q, wready_q, arready_q;
    reg [AXI_LITE_ADDR_W-1:0] awaddr_q, araddr_q;
    reg [31:0] wdata_q;
    reg bvalid_q;
    reg rvalid_q;
    reg [31:0] rdata_q;

    // status snapshot pieces crossed from pixel domain (quasi-static / gray-free
    // single bits and a slow counter — read for debug only)
    reg [7:0] frame_cnt_pix;            // pixel domain
    reg [7:0] frame_cnt_s1, frame_cnt_s2;   // 2FF into aclk (debug value)
    // Free-running pixel-clock heartbeat: increments on EVERY pixel clock,
    // no enable involved — STATUS[23:16] proves the clock is alive even if
    // everything else is misconfigured.
    reg [23:0] pix_alive;               // pixel domain
    reg [7:0]  pix_alive_s1, pix_alive_s2;  // into aclk (sample high bits)

    always @(posedge aclk) begin
        if (!aresetn) begin
            ctrl_enable <= 1'b0; ctrl_yc_swap <= 1'b0;
            ctrl_cbcr_swap <= 1'b0; ctrl_testpat <= 1'b0;
            ctrl_mono <= 1'b0;
            fb_base <= FB_DEFAULT;
            i2c_sda_low <= 1'b0; i2c_scl_low <= 1'b0;
            st_overrun <= 1'b0;
            aw_done <= 0; w_done <= 0; ar_done <= 0;
            awready_q <= 0; wready_q <= 0; arready_q <= 0;
            bvalid_q <= 0; rvalid_q <= 0;
            awaddr_q <= 0; araddr_q <= 0; wdata_q <= 0; rdata_q <= 0;
            frame_cnt_s1 <= 0; frame_cnt_s2 <= 0;
        end else begin
            frame_cnt_s1 <= frame_cnt_pix;
            frame_cnt_s2 <= frame_cnt_s1;
            pix_alive_s1 <= pix_alive[23:16];   // ~6 Hz at 25 MHz
            pix_alive_s2 <= pix_alive_s1;

            // ---- write channel (template) ----
            if (!aw_done) begin
                awready_q <= 1'b1;
                if (s_axi_lite_awvalid && awready_q) begin
                    awaddr_q  <= s_axi_lite_awaddr;
                    awready_q <= 1'b0;
                    aw_done   <= 1'b1;
                end
            end
            if (!w_done) begin
                wready_q <= 1'b1;
                if (s_axi_lite_wvalid && wready_q) begin
                    wdata_q  <= s_axi_lite_wdata;
                    wready_q <= 1'b0;
                    w_done   <= 1'b1;
                end
            end
            if (aw_done && w_done && !bvalid_q) begin
                case (awaddr_q[7:0])
                    8'h00: begin
                        ctrl_enable    <= wdata_q[0];
                        ctrl_yc_swap   <= wdata_q[1];
                        ctrl_cbcr_swap <= wdata_q[2];
                        ctrl_testpat   <= wdata_q[3];
                        if (wdata_q[4]) st_overrun <= 1'b0;
                        ctrl_mono      <= wdata_q[5];
                    end
                    8'h04: fb_base <= wdata_q;
                    8'h0C: begin
                        i2c_sda_low <= wdata_q[0];
                        i2c_scl_low <= wdata_q[1];
                    end
                    default: ;
                endcase
                bvalid_q <= 1;
            end
            if (bvalid_q && s_axi_lite_bready) begin
                bvalid_q <= 0; aw_done <= 0; w_done <= 0;
            end

            // ---- read channel (template) ----
            if (!ar_done) begin
                arready_q <= 1'b1;
                if (s_axi_lite_arvalid && arready_q) begin
                    araddr_q  <= s_axi_lite_araddr;
                    arready_q <= 1'b0;
                    ar_done   <= 1'b1;
                end
            end
            if (ar_done && !rvalid_q) begin
                case (araddr_q[7:0])
                    8'h00: rdata_q <= {27'd0, ctrl_testpat, ctrl_cbcr_swap,
                                       ctrl_yc_swap, ctrl_enable};
                    8'h04: rdata_q <= fb_base;
                    8'h08: rdata_q <= {8'd0, pix_alive_s2, frame_cnt_s2,
                                       7'd0, st_overrun};
                    8'h0C: rdata_q <= {22'd0, scl_in, sda_in, 6'd0,
                                       i2c_scl_low, i2c_sda_low};
                    default: rdata_q <= 32'hDEADBEEF;
                endcase
                rvalid_q <= 1;
            end
            if (rvalid_q && s_axi_lite_rready) begin
                rvalid_q <= 0; ar_done <= 0;
            end

            if (fetch_overrun_set) st_overrun <= 1'b1;
        end
    end

    assign s_axi_lite_awready = awready_q;
    assign s_axi_lite_wready  = wready_q;
    assign s_axi_lite_bresp   = 2'b00;
    assign s_axi_lite_bvalid  = bvalid_q;
    assign s_axi_lite_arready = arready_q;
    assign s_axi_lite_rdata   = rdata_q;
    assign s_axi_lite_rresp   = 2'b00;
    assign s_axi_lite_rvalid  = rvalid_q;

    // I2C pads removed: the ADV7511 bus is owned by an axi_iic controller in
    // the block design (AA18/Y16). The 0x0C register is kept for software
    // back-compat and reads as bus-idle.
    assign scl_in = 1'b1;
    assign sda_in = 1'b1;

    // =========================================================================
    // Pixel-domain timing generator
    // =========================================================================
    // enable synchronized into pixel domain
    reg en_p1, en_p2, tp_p1, tp_p2, ycs_p1, ycs_p2, ccs_p1, ccs_p2;
    reg mono_p1, mono_p2;
    always @(posedge pixel_clk) begin
        en_p1 <= ctrl_enable;  en_p2 <= en_p1;
        tp_p1 <= ctrl_testpat; tp_p2 <= tp_p1;
        ycs_p1 <= ctrl_yc_swap;   ycs_p2 <= ycs_p1;
        ccs_p1 <= ctrl_cbcr_swap; ccs_p2 <= ccs_p1;
        mono_p1 <= ctrl_mono;     mono_p2 <= mono_p1;
    end

    always @(posedge pixel_clk) pix_alive <= pix_alive + 1;

    reg [9:0] hcnt, vcnt;
    wire h_active = (hcnt < H_ACT);
    wire v_active = (vcnt < V_ACT);
    // gate with enable: otherwise DE sits asserted while the block is idle
    // (counters parked at 0,0 which is inside the active region)
    wire active   = h_active && v_active && en_p2;

    always @(posedge pixel_clk) begin
        if (!en_p2) begin
            hcnt <= 0; vcnt <= 0; frame_cnt_pix <= 0;
        end else begin
            if (hcnt == H_TOT-1) begin
                hcnt <= 0;
                if (vcnt == V_TOT-1) begin
                    vcnt <= 0;
                    frame_cnt_pix <= frame_cnt_pix + 1;
                end else
                    vcnt <= vcnt + 1;
            end else
                hcnt <= hcnt + 1;
        end
    end

    // negative-polarity syncs, registered
    always @(posedge pixel_clk) begin
        hdmi_hsync <= !(hcnt >= H_ACT+H_FP && hcnt < H_ACT+H_FP+H_SYNC);
        hdmi_vsync <= !(vcnt >= V_ACT+V_FP && vcnt < V_ACT+V_FP+V_SYNC);
        hdmi_de    <= active;
        vga_hsync  <= !(hcnt >= H_ACT+H_FP && hcnt < H_ACT+H_FP+H_SYNC);
        vga_vsync  <= !(vcnt >= V_ACT+V_FP && vcnt < V_ACT+V_FP+V_SYNC);
    end

    // =========================================================================
    // Line request toggling (pixel -> aclk)
    // =========================================================================
    // At the start of every line, request prefetch of the NEXT display line.
    reg        line_req_tgl;      // pixel domain
    reg [9:0]  line_req_num;      // quasi-static: written before toggle flips
    wire [9:0] next_line = (vcnt == V_TOT-1) ? 10'd0 : (vcnt + 10'd1);

    always @(posedge pixel_clk) begin
        if (!en_p2) begin
            line_req_tgl <= 1'b0; line_req_num <= 10'd0;
        end else if (hcnt == 10'd0 && next_line < V_ACT) begin
            line_req_num <= next_line;
            line_req_tgl <= ~line_req_tgl;
        end
    end

    // =========================================================================
    // Fetch FSM (aclk): line_req -> 20 x 16-beat bursts into line BRAM
    // =========================================================================
    reg t_s1, t_s2, t_s3;
    always @(posedge aclk) begin
        if (!aresetn) begin t_s1 <= 0; t_s2 <= 0; t_s3 <= 0; end
        else begin t_s1 <= line_req_tgl; t_s2 <= t_s1; t_s3 <= t_s2; end
    end
    wire new_req = (t_s2 != t_s3);

    localparam F_IDLE = 2'd0, F_AR = 2'd1, F_DATA = 2'd2;
    reg [1:0]  fstate;
    reg [9:0]  f_line;
    reg [4:0]  f_burst;                 // 0..19
    reg [8:0]  f_word;                  // 0..319 write index within the line
    reg [31:0] f_addr;
    reg        arvalid_q2;

    // line BRAM: 2 banks x 320 words (dual-clock: written @aclk, read @pixel)
    reg [31:0] linebuf [0:1023];
    reg        lb_we;
    reg [9:0]  lb_waddr;
    reg [31:0] lb_wdata;
    always @(posedge aclk) if (lb_we) linebuf[lb_waddr] <= lb_wdata;

    always @(posedge aclk) begin
        if (!aresetn) begin
            fstate <= F_IDLE; f_line <= 0; f_burst <= 0; f_word <= 0;
            f_addr <= 0; arvalid_q2 <= 0; fetch_overrun_set <= 0;
            lb_we <= 0; lb_waddr <= 0; lb_wdata <= 0;
        end else begin
            lb_we <= 1'b0;
            fetch_overrun_set <= 1'b0;

            case (fstate)
                F_IDLE: begin
                    if (new_req && ctrl_enable && !ctrl_testpat) begin
                        f_line  <= line_req_num;
                        f_burst <= 0;
                        f_word  <= 0;
                        f_addr  <= fb_base + line_req_num * (WORDS_PER_LINE*4);
                        arvalid_q2 <= 1'b1;
                        fstate  <= F_AR;
                    end
                end
                F_AR: begin
                    if (new_req) fetch_overrun_set <= 1'b1;  // fell behind
                    if (arvalid_q2 && m_axi_hp_arready) begin
                        arvalid_q2 <= 1'b0;
                        fstate <= F_DATA;
                    end
                end
                F_DATA: begin
                    if (new_req) fetch_overrun_set <= 1'b1;
                    if (m_axi_hp_rvalid) begin
                        lb_we    <= 1'b1;
                        lb_waddr <= {f_line[0], f_word};
                        lb_wdata <= m_axi_hp_rdata;
                        f_word   <= f_word + 1;
                        if (m_axi_hp_rlast) begin
                            if (f_burst == 5'd19) begin
                                fstate <= F_IDLE;
                            end else begin
                                f_burst <= f_burst + 1;
                                f_addr  <= f_addr + 32'd64;
                                arvalid_q2 <= 1'b1;
                                fstate  <= F_AR;
                            end
                        end
                    end
                end
                default: fstate <= F_IDLE;
            endcase
        end
    end

    assign m_axi_hp_arid    = {AXI_ID_W{1'b0}};
    assign m_axi_hp_araddr  = f_addr;
    assign m_axi_hp_arlen   = 8'd15;        // 16 beats
    assign m_axi_hp_arsize  = 3'b010;       // 4 bytes
    assign m_axi_hp_arburst = 2'b01;        // INCR
    assign m_axi_hp_arlock  = 2'b00;
    assign m_axi_hp_arcache = 4'b0011;
    assign m_axi_hp_arprot  = 3'b000;
    assign m_axi_hp_arqos   = 4'b0000;
    assign m_axi_hp_arvalid = arvalid_q2;
    assign m_axi_hp_rready  = 1'b1;

    // =========================================================================
    // Pixel datapath: line BRAM -> YCbCr 4:2:2 bus  (+ test pattern)
    // =========================================================================
    // Read one word ahead of consumption. Word w covers pixels 2w, 2w+1.
    reg [31:0] lb_rdata;
    wire [9:0] rd_addr = {vcnt[0], active ? hcnt[9:1] + 9'd0 : 9'd0};
    // prime word for the NEXT pixel pair: fetch when the upcoming pixel is even
    wire [9:0] rd_addr_next = {vcnt[0], hcnt[9:1] + 9'd1};
    always @(posedge pixel_clk) begin
        // register read: when consuming pixel 2w+1 (odd), fetch word w+1 so it
        // is ready for pixel 2w+2. During blanking, preload word 0 of the
        // NEXT line's bank (using vcnt[0] here served the PREVIOUS line's
        // data to pixel 0 — the classic off-by-one at the bank boundary).
        if (!h_active)
            lb_rdata <= linebuf[{next_line[0], 9'd0}];
        else if (hcnt[0])
            lb_rdata <= linebuf[rd_addr_next];
    end

    // YUYV byte order in the 32-bit word: [7:0]=Y0 [15:8]=Cb [23:16]=Y1 [31:24]=Cr
    wire [7:0] y_cur  = hcnt[0] ? lb_rdata[23:16] : lb_rdata[7:0];
    wire [7:0] c_cur  = (hcnt[0] ^ ccs_p2) ? lb_rdata[31:24] : lb_rdata[15:8];

    // test pattern: vertical color bars (YCbCr), 128-px wide
    reg [7:0] tp_y, tp_c;
    always @(*) begin
        case (hcnt[9:7])
            3'd0: begin tp_y = 8'd235; tp_c = hcnt[0] ? 8'd128 : 8'd128; end // white
            3'd1: begin tp_y = 8'd210; tp_c = hcnt[0] ? 8'd146 : 8'd16;  end // yellow
            3'd2: begin tp_y = 8'd145; tp_c = hcnt[0] ? 8'd34  : 8'd54;  end // green
            3'd3: begin tp_y = 8'd81;  tp_c = hcnt[0] ? 8'd240 : 8'd90;  end // red
            default: begin tp_y = 8'd41; tp_c = hcnt[0] ? 8'd110 : 8'd240; end // blue
        endcase
    end

    wire [7:0] out_y = tp_p2 ? tp_y : y_cur;
    // mono: put Y in the chroma slot too — every downstream channel then
    // carries luma, forcing R=G=B regardless of the ADV7511's (stubborn)
    // chroma/CSC interpretation.
    wire [7:0] out_c = mono_p2 ? out_y : (tp_p2 ? tp_c : c_cur);

    reg [15:0] hdmi_d_q;
    always @(posedge pixel_clk)
        hdmi_d_q <= active ? (ycs_p2 ? {out_c, out_y} : {out_y, out_c})
                           : 16'h0080;
    assign hdmi_d = hdmi_d_q;

    // VGA grayscale tap (Y upper nibble)
    reg [3:0] vga_q;
    always @(posedge pixel_clk) vga_q <= active ? out_y[7:4] : 4'd0;
    assign vga_r = vga_q;
    assign vga_g = vga_q;
    assign vga_b = vga_q;

    // =========================================================================
    // Forwarded pixel clock (inverted: rising edge lands mid data eye)
    // =========================================================================
`ifdef SIM_NO_ODDR
    assign hdmi_clk = ~pixel_clk;
`else
    ODDR #(
        .DDR_CLK_EDGE("SAME_EDGE"),
        .INIT(1'b0),
        .SRTYPE("SYNC")
    ) u_clk_fwd (
        .Q (hdmi_clk),
        .C (pixel_clk),
        .CE(1'b1),
        .D1(1'b0),      // inverted forward
        .D2(1'b1),
        .R (1'b0),
        .S (1'b0)
    );
`endif

endmodule
