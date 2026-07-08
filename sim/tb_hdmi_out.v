// tb_hdmi_out.v — verify the scanout core: timing geometry, line fetch via a
// realistic bursty AXI memory model, pixel data correctness, register access.
// Runs a shrunken frame (H unchanged, few active lines) for sim speed.
`timescale 1ns/1ps

module tb_hdmi_out;
    reg aclk = 0;      always #10 aclk = ~aclk;       // 50 MHz
    reg pixel_clk = 0; always #20 pixel_clk = ~pixel_clk; // 25 MHz
    reg aresetn = 0;

    // Shrunken frame: 8 active lines, tiny blanking
    localparam V_ACT_T = 8, V_FP_T = 2, V_SYNC_T = 2, V_BP_T = 3;
    localparam H_ACT = 640, H_TOT = 800;
    localparam V_TOT = V_ACT_T + V_FP_T + V_SYNC_T + V_BP_T;

    // AXI-Lite
    reg [15:0] awaddr = 0;  reg awvalid = 0;  wire awready;
    reg [31:0] wdata = 0;   reg wvalid = 0;   wire wready;
    wire [1:0] bresp;       wire bvalid;      reg bready = 1;
    reg [15:0] araddr = 0;  reg arvalid = 0;  wire arready;
    wire [31:0] rdata;      wire [1:0] rresp; wire rvalid; reg rready = 1;

    // AXI4 read master
    wire [5:0]  arid;   wire [31:0] axi_araddr; wire [7:0] arlen;
    wire [2:0]  arsize; wire [1:0]  arburst;    wire arvalid_m;
    reg         arready_m = 0;
    reg  [31:0] axi_rdata = 0; reg rlast = 0; reg rvalid_m = 0;
    wire        rready_m;

    wire        hdmi_clk;  wire [15:0] hdmi_d;
    wire        hdmi_de, hdmi_hsync, hdmi_vsync;
    wire        hdmi_scl, hdmi_sda;
    wire [3:0]  vga_r, vga_g, vga_b;
    wire        vga_hsync, vga_vsync;

    hdmi_out #(
        .V_ACT(V_ACT_T), .V_FP(V_FP_T), .V_SYNC(V_SYNC_T), .V_BP(V_BP_T)
    ) dut (
        .aclk(aclk), .aresetn(aresetn), .pixel_clk(pixel_clk),
        .s_axi_lite_awaddr(awaddr), .s_axi_lite_awprot(3'd0),
        .s_axi_lite_awvalid(awvalid), .s_axi_lite_awready(awready),
        .s_axi_lite_wdata(wdata), .s_axi_lite_wstrb(4'hF),
        .s_axi_lite_wvalid(wvalid), .s_axi_lite_wready(wready),
        .s_axi_lite_bresp(bresp), .s_axi_lite_bvalid(bvalid),
        .s_axi_lite_bready(bready),
        .s_axi_lite_araddr(araddr), .s_axi_lite_arprot(3'd0),
        .s_axi_lite_arvalid(arvalid), .s_axi_lite_arready(arready),
        .s_axi_lite_rdata(rdata), .s_axi_lite_rresp(rresp),
        .s_axi_lite_rvalid(rvalid), .s_axi_lite_rready(rready),
        .m_axi_hp_arid(arid), .m_axi_hp_araddr(axi_araddr),
        .m_axi_hp_arlen(arlen), .m_axi_hp_arsize(arsize),
        .m_axi_hp_arburst(arburst), .m_axi_hp_arlock(), .m_axi_hp_arcache(),
        .m_axi_hp_arprot(), .m_axi_hp_arqos(),
        .m_axi_hp_arvalid(arvalid_m), .m_axi_hp_arready(arready_m),
        .m_axi_hp_rid(6'd0), .m_axi_hp_rdata(axi_rdata), .m_axi_hp_rresp(2'd0),
        .m_axi_hp_rlast(rlast), .m_axi_hp_rvalid(rvalid_m),
        .m_axi_hp_rready(rready_m),
        .hdmi_clk(hdmi_clk), .hdmi_d(hdmi_d), .hdmi_de(hdmi_de),
        .hdmi_hsync(hdmi_hsync), .hdmi_vsync(hdmi_vsync),
        .hdmi_scl(hdmi_scl), .hdmi_sda(hdmi_sda),
        .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b),
        .vga_hsync(vga_hsync), .vga_vsync(vga_vsync)
    );

    // ---- AXI memory model: variable AR delay, 16-beat bursts ---------------
    // FB word (line L, word W): Y0=2W, Cb=L, Y1=2W+1, Cr=~L  (all mod 256)
    localparam [31:0] FB = 32'h1010_0000;
    reg [31:0] burst_addr;
    integer beat, ar_delay;
    integer errors = 0;

    always @(posedge aclk) begin
        if (arvalid_m && !arready_m && ar_delay == 0)
            ar_delay <= 1 + ($urandom % 8);
    end

    initial begin
        ar_delay = 0;
        forever begin
            @(posedge aclk);
            if (arvalid_m && !arready_m) begin
                repeat (1 + ($urandom % 6)) @(posedge aclk);
                arready_m <= 1;
                burst_addr = axi_araddr;
                @(posedge aclk);
                arready_m <= 0;
                if (arlen != 8'd15) begin
                    $display("ERROR: arlen=%0d", arlen); errors = errors + 1;
                end
                for (beat = 0; beat < 16; beat = beat + 1) begin
                    // occasional gap in R stream (rvalid must drop, else the
                    // always-ready consumer would eat the stale beat twice)
                    if (($urandom % 4) == 0) begin
                        rvalid_m <= 0;
                        @(posedge aclk);
                    end
                    rvalid_m <= 1;
                    rlast    <= (beat == 15);
                    axi_rdata <= fbword(burst_addr + beat*4);
                    @(posedge aclk);
                    while (!rready_m) @(posedge aclk);
                end
                rvalid_m <= 0; rlast <= 0;
            end
        end
    end

    function [31:0] fbword(input [31:0] addr);
        reg [31:0] off; reg [9:0] line; reg [8:0] word;
        reg [7:0] y0, y1, cb, cr;
        begin
            off  = addr - FB;
            line = off / 1280;
            word = (off % 1280) / 4;
            y0 = word * 2;
            y1 = word * 2 + 1;
            cb = line[7:0];
            cr = 8'hFF ^ line[7:0];
            fbword = {cr, y1, cb, y0};
        end
    endfunction

    // ---- AXI-Lite helpers ----------------------------------------------------
    task axil_wr(input [15:0] a, input [31:0] d);
        begin
            @(negedge aclk);
            awaddr <= a; awvalid <= 1; wdata <= d; wvalid <= 1;
            wait (bvalid);
            @(negedge aclk);
            awvalid <= 0; wvalid <= 0;
            wait (!bvalid);
        end
    endtask
    task axil_rd(input [15:0] a, output [31:0] d);
        begin
            @(negedge aclk);
            araddr <= a; arvalid <= 1;
            wait (rvalid);
            d = rdata;
            @(negedge aclk);
            arvalid <= 0;
            wait (!rvalid);
        end
    endtask

    // ---- pixel checker --------------------------------------------------------
    // Count DE cycles per line; hdmi_d is registered together with DE, so when
    // DE=1 the bus carries pixel x = (#DE cycles seen this line).
    integer x_pos = 0;
    integer line_no = -1;   // display line counter (increments on DE rising)
    reg de_d = 0;
    integer checked = 0;

    always @(posedge pixel_clk) begin
        de_d <= hdmi_de;
        if (hdmi_de && !de_d) begin
            line_no = line_no + 1;
            x_pos = 0;
        end
        if (hdmi_de) begin
            // check a sparse sample of pixels on lines 2..5 (fetch settled)
            if (line_no >= 2 && line_no <= 5 && (x_pos % 97) == 0) begin
                if (hdmi_d[15:8] !== ((x_pos) & 8'hFF)) begin
                    $display("ERROR: line %0d x %0d Y=%02x exp %02x",
                             line_no, x_pos, hdmi_d[15:8], x_pos & 8'hFF);
                    errors = errors + 1;
                end else
                    checked = checked + 1;
                // chroma: even px = Cb = line, odd px = Cr = ~line
                if (hdmi_d[7:0] !== ((x_pos % 2) ? (8'hFF ^ line_no[7:0])
                                                 : line_no[7:0])) begin
                    $display("ERROR: line %0d x %0d C=%02x", line_no, x_pos,
                             hdmi_d[7:0]);
                    errors = errors + 1;
                end else
                    checked = checked + 1;
            end
            x_pos = x_pos + 1;
        end
    end

    // ---- geometry checker ------------------------------------------------------
    integer hs_lo = 0, de_per_line = 0;
    reg hs_d = 1;
    always @(posedge pixel_clk) begin
        hs_d <= hdmi_hsync;
        if (!hdmi_hsync) hs_lo = hs_lo + 1;
        if (hdmi_hsync && !hs_d) begin
            if (hs_lo != 96) begin
                $display("ERROR: hsync width %0d (exp 96)", hs_lo);
                errors = errors + 1;
            end
            hs_lo = 0;
        end
    end

    // ---- main ------------------------------------------------------------------
    reg [31:0] rd;
    initial begin
        #200 aresetn = 1;
        #100;

        // register sanity
        axil_wr(16'h0004, FB);
        axil_rd(16'h0004, rd);
        if (rd !== FB) begin $display("ERROR: FB rb %08x", rd); errors = errors + 1; end

        // I2C bit-bang: drive SDA low, read it back
        axil_wr(16'h000C, 32'h1);
        axil_rd(16'h000C, rd);
        if (rd[8] !== 1'b0) begin $display("ERROR: sda_in=%b", rd[8]); errors = errors + 1; end
        axil_wr(16'h000C, 32'h0);

        // enable scanout
        axil_wr(16'h0000, 32'h1);

        // run ~4 shrunken frames
        #(40 * H_TOT * V_TOT * 4);

        // frame counter must be advancing
        axil_rd(16'h0008, rd);
        if (rd[15:8] < 2) begin
            $display("ERROR: frame counter %0d", rd[15:8]); errors = errors + 1;
        end
        if (rd[0]) begin
            $display("ERROR: fetch overrun flagged"); errors = errors + 1;
        end

        if (checked < 20) begin
            $display("ERROR: only %0d pixel checks ran", checked);
            errors = errors + 1;
        end

        if (errors == 0)
            $display("*** TB_HDMI RESULT: PASS (%0d pixel checks, frames=%0d) ***",
                     checked, rd[15:8]);
        else
            $display("*** TB_HDMI RESULT: %0d ERRORS ***", errors);
        $finish;
    end

    initial begin
        #100000000;
        $display("*** TIMEOUT ***");
        $finish;
    end

    // weak pull-ups on the I2C nets (board has real ones)
    pullup(hdmi_scl);
    pullup(hdmi_sda);
endmodule
