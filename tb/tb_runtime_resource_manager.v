`timescale 1ns/1ps
// ===========================================================================
// Testbench for runtime_resource_manager
//
// Parameters used:
//   MAX_LAYERS=4, TOTAL_MAC_UNITS=16, TOTAL_BRAM_BLOCKS=8
//
// Port-width helpers (W = param, N = MAX_LAYERS or 8 phases):
//   layer i ops       = layer_ops      [i*16 +: 16]
//   layer i data_size = layer_data_size[i*16 +: 16]
//   layer i mac_alloc = layer_mac_alloc[i*8  +: 8 ]
//   layer i mem_alloc = layer_mem_alloc[i*8  +: 8 ]
//   phase p mask      = phase_layer_mask[p*ML +: ML]
//
// Key behavioural notes captured in tests:
//   - available_macs/mem never actually decrements (NBA read-old-value quirk),
//     so calculate_*_allocation always sees full resource counts.
//   - In ALLOC_DONE, estimated_cycles is the LAST phase's max (multi-NBA,
//     last write wins); for single-phase runs it equals max layer cycles.
// ===========================================================================

module tb_runtime_resource_manager;

    // -----------------------------------------------------------------------
    // DUT parameters
    // -----------------------------------------------------------------------
    localparam ML   = 4;   // MAX_LAYERS
    localparam TMAC = 16;  // TOTAL_MAC_UNITS
    localparam TBRAM = 8;  // TOTAL_BRAM_BLOCKS

    // -----------------------------------------------------------------------
    // Clock
    // -----------------------------------------------------------------------
    reg clk;
    initial clk = 0;
    always #5 clk = ~clk;

    // -----------------------------------------------------------------------
    // DUT I/O
    // -----------------------------------------------------------------------
    reg              rrm_rst;
    reg  [ML-1:0]    rrm_layer_valid;
    reg  [2*ML-1:0]  rrm_layer_type;
    reg  [16*ML-1:0] rrm_layer_ops;
    reg  [16*ML-1:0] rrm_layer_data_size;

    wire [8*ML-1:0]  rrm_layer_mac_alloc;
    wire [8*ML-1:0]  rrm_layer_mem_alloc;
    wire [7:0]       rrm_num_phases;
    wire [ML*8-1:0]  rrm_phase_mask;
    wire             rrm_alloc_ready;
    wire [15:0]      rrm_mac_eff;
    wire [15:0]      rrm_mem_eff;
    wire [31:0]      rrm_est_cycles;

    runtime_resource_manager #(
        .TOTAL_MAC_UNITS  (TMAC),
        .TOTAL_BRAM_BLOCKS(TBRAM),
        .MAX_LAYERS       (ML)
    ) dut (
        .clk               (clk),
        .rst               (rrm_rst),
        .layer_valid       (rrm_layer_valid),
        .layer_type        (rrm_layer_type),
        .layer_ops         (rrm_layer_ops),
        .layer_data_size   (rrm_layer_data_size),
        .layer_mac_alloc   (rrm_layer_mac_alloc),
        .layer_mem_alloc   (rrm_layer_mem_alloc),
        .num_execution_phases(rrm_num_phases),
        .phase_layer_mask  (rrm_phase_mask),
        .allocation_ready  (rrm_alloc_ready),
        .mac_efficiency    (rrm_mac_eff),
        .mem_efficiency    (rrm_mem_eff),
        .estimated_cycles  (rrm_est_cycles)
    );

    // -----------------------------------------------------------------------
    // Pass/fail counters
    // -----------------------------------------------------------------------
    integer pass_count;
    integer fail_count;

    task check;
        input [127:0] name;
        input [63:0]  got;
        input [63:0]  expected;
        begin
            if (got !== expected) begin
                $display("FAIL  [%s]  got=%0d  expected=%0d", name, got, expected);
                fail_count = fail_count + 1;
            end else begin
                $display("PASS  [%s]", name);
                pass_count = pass_count + 1;
            end
        end
    endtask

    // -----------------------------------------------------------------------
    // Helpers
    // -----------------------------------------------------------------------

    // Apply reset (3 clocks) then deassert
    task do_reset;
        begin
            rrm_rst          = 1;
            rrm_layer_valid  = 0;
            rrm_layer_type   = 0;
            rrm_layer_ops    = 0;
            rrm_layer_data_size = 0;
            repeat(3) @(posedge clk);
            @(negedge clk);
            rrm_rst = 0;
        end
    endtask

    // Set one layer's inputs; clear other layers
    task set_layer;
        input integer  idx;
        input [15:0]   ops;
        input [15:0]   data_size;
        input [1:0]    ltype;
        begin
            rrm_layer_valid = 0;
            rrm_layer_ops   = 0;
            rrm_layer_data_size = 0;
            rrm_layer_type  = 0;
            rrm_layer_valid[idx]            = 1;
            rrm_layer_ops[idx*16 +: 16]     = ops;
            rrm_layer_data_size[idx*16 +: 16] = data_size;
            rrm_layer_type[idx*2 +: 2]      = ltype;
        end
    endtask

    // Set two layers' inputs; clear rest
    task set_two_layers;
        input integer  i0;
        input [15:0]   ops0, ds0;
        input integer  i1;
        input [15:0]   ops1, ds1;
        begin
            rrm_layer_valid = 0;
            rrm_layer_ops   = 0;
            rrm_layer_data_size = 0;
            rrm_layer_type  = 0;
            rrm_layer_valid[i0]             = 1;
            rrm_layer_ops[i0*16 +: 16]      = ops0;
            rrm_layer_data_size[i0*16 +: 16] = ds0;
            rrm_layer_valid[i1]             = 1;
            rrm_layer_ops[i1*16 +: 16]      = ops1;
            rrm_layer_data_size[i1*16 +: 16] = ds1;
        end
    endtask

    // Wait until allocation_ready goes high (or timeout)
    task wait_alloc;
        integer t;
        begin
            t = 300;
            while (!rrm_alloc_ready && t > 0) begin
                @(posedge clk);
                t = t - 1;
            end
            @(negedge clk);  // settle outputs
            if (t == 0)
                $display("TIMEOUT: allocation_ready never asserted");
        end
    endtask

    // -----------------------------------------------------------------------
    // TEST SUITE
    // -----------------------------------------------------------------------

    initial begin
        pass_count = 0;
        fail_count = 0;

        // ==================================================================
        // TC1: Reset – stays idle, allocation_ready deasserted
        // ==================================================================
        $display("\n--- TC1: Reset / idle ---");
        do_reset;
        @(negedge clk);
        check("TC1_alloc_ready_low", rrm_alloc_ready, 1'b0);

        // ==================================================================
        // TC2: Single compute-bound layer – minimum MAC allocation
        //   ops=2000, data_size=100
        //   priority: 2000 > 100*4=400 -> compute-bound (200)
        //   mac:  ideal=2000/1000=2 < 4 -> minimum 4
        //   mem:  data_size=100 < 10000 -> needed=3
        //   schedule: 4+3 fits in one phase
        //   balance:  max=min=2000, avg=2000;
        //             2000 < 1600? No. 2000 > 2400? No. No change.
        //   estimated_cycles = 2000 (last NBA in single-phase loop)
        // ==================================================================
        $display("\n--- TC2: Single compute-bound layer ---");
        do_reset;
        set_layer(0, 16'd2000, 16'd100, 2'b00);
        wait_alloc;

        check("TC2_alloc_ready",   rrm_alloc_ready,               1'b1);
        check("TC2_mac_alloc_0",   rrm_layer_mac_alloc[0*8 +: 8], 8'd4);
        check("TC2_mem_alloc_0",   rrm_layer_mem_alloc[0*8 +: 8], 8'd3);
        check("TC2_num_phases",    rrm_num_phases,                 8'd1);
        check("TC2_phase0_mask",   rrm_phase_mask[0*ML +: ML],    4'b0001);
        check("TC2_mac_eff",       rrm_mac_eff,                    16'd10000);
        check("TC2_mem_eff",       rrm_mem_eff,                    16'd10000);
        check("TC2_est_cycles",    rrm_est_cycles,                 32'd2000);

        // ==================================================================
        // TC3: Single memory-bound layer
        //   ops=500, data_size=1000
        //   priority: 500 > 1000*4=4000? No -> memory-bound (100)
        //   mac:  ideal=500/1000=0 < 4 -> minimum 4
        //   mem:  1000 < 10000 -> needed=3
        // ==================================================================
        $display("\n--- TC3: Single memory-bound layer ---");
        do_reset;
        set_layer(0, 16'd500, 16'd1000, 2'b00);
        wait_alloc;

        check("TC3_alloc_ready",   rrm_alloc_ready,               1'b1);
        check("TC3_mac_alloc_0",   rrm_layer_mac_alloc[0*8 +: 8], 8'd4);
        check("TC3_mem_alloc_0",   rrm_layer_mem_alloc[0*8 +: 8], 8'd3);
        check("TC3_num_phases",    rrm_num_phases,                 8'd1);
        check("TC3_est_cycles",    rrm_est_cycles,                 32'd500);

        // ==================================================================
        // TC4: MAC allocation capped at TOTAL_MAC_UNITS
        //   ops=20000: ideal=20 > 16 -> capped to 16
        // ==================================================================
        $display("\n--- TC4: MAC cap (ideal > available) ---");
        do_reset;
        set_layer(0, 16'd20000, 16'd100, 2'b00);
        wait_alloc;

        check("TC4_mac_alloc_capped", rrm_layer_mac_alloc[0*8 +: 8], 8'd16);
        check("TC4_num_phases",       rrm_num_phases,                 8'd1);

        // ==================================================================
        // TC5: Large data_size triggers extra BRAM allocation
        //   data_size=15000 > 10000 -> needed_mem = 3+2 = 5
        // ==================================================================
        $display("\n--- TC5: Large data_size -> 5 BRAMs ---");
        do_reset;
        set_layer(0, 16'd100, 16'd15000, 2'b00);
        wait_alloc;

        check("TC5_mem_alloc_large", rrm_layer_mem_alloc[0*8 +: 8], 8'd5);
        check("TC5_mac_alloc_min",   rrm_layer_mac_alloc[0*8 +: 8], 8'd4);

        // ==================================================================
        // TC6: Two layers fit in the same phase
        //   Layer 0: ops=1000, data_size=100 -> mac=4, mem=3
        //   Layer 1: ops=2000, data_size=100 -> mac=4, mem=3
        //   Combined: MAC=8 <= 16, BRAM=6 <= 8 -> one phase
        //   estimated_cycles: max in last (and only) iteration = max(1000,2000)=2000
        // ==================================================================
        $display("\n--- TC6: Two layers in one phase ---");
        do_reset;
        set_two_layers(0, 16'd1000, 16'd100, 1, 16'd2000, 16'd100);
        wait_alloc;

        check("TC6_num_phases",    rrm_num_phases,                 8'd1);
        check("TC6_mac_alloc_0",   rrm_layer_mac_alloc[0*8 +: 8], 8'd4);
        // Layer 1 (compute=2000) > avg*1.2=1800 -> slow -> +4 -> 4+4=8
        check("TC6_mac_alloc_1",   rrm_layer_mac_alloc[1*8 +: 8], 8'd8);
        check("TC6_phase0_has_L0", rrm_phase_mask[0*ML + 0],      1'b1);
        check("TC6_phase0_has_L1", rrm_phase_mask[0*ML + 1],      1'b1);

        // ==================================================================
        // TC7: Two layers split into two phases (MAC budget exceeded)
        //   Layer 0: ops=16000 -> mac=16 (capped, fills the budget)
        //   Layer 1: ops=6000  -> mac=6  (available_macs still 16 due to NBA
        //             read-old-value, but phase_macs=16+6=22 > 16 -> new phase)
        //   Layer 0 -> phase 0, Layer 1 -> phase 1
        //   estimated_cycles: last-NBA-wins over 2 phases:
        //     phase0 max = layer_compute_cycles[0] = 16000
        //     phase1 max = layer_compute_cycles[1] = 6000
        //     last NBA: estimated_cycles = 0 + 6000 = 6000
        // ==================================================================
        $display("\n--- TC7: Two phases (MAC budget split) ---");
        do_reset;
        set_two_layers(0, 16'd16000, 16'd100, 1, 16'd6000, 16'd100);
        wait_alloc;

        check("TC7_num_phases",    rrm_num_phases,                 8'd2);
        check("TC7_mac_alloc_0",   rrm_layer_mac_alloc[0*8 +: 8], 8'd16);
        check("TC7_mac_alloc_1",   rrm_layer_mac_alloc[1*8 +: 8], 8'd6);
        check("TC7_phase0_has_L0", rrm_phase_mask[0*ML + 0],      1'b1);
        check("TC7_phase0_no_L1",  rrm_phase_mask[0*ML + 1],      1'b0);
        check("TC7_phase1_no_L0",  rrm_phase_mask[1*ML + 0],      1'b0);
        check("TC7_phase1_has_L1", rrm_phase_mask[1*ML + 1],      1'b1);
        check("TC7_est_cycles",    rrm_est_cycles,                 32'd6000);

        // ==================================================================
        // TC8: BRAM budget split into two phases
        //   Layer 0: data_size=15000 -> mem=5  mac=4
        //   Layer 1: data_size=15000 -> mem=5  mac=4
        //   Combined BRAM: 5+5=10 > 8 -> cannot share a phase
        // ==================================================================
        $display("\n--- TC8: Two phases (BRAM budget split) ---");
        do_reset;
        set_two_layers(0, 16'd100, 16'd15000, 1, 16'd100, 16'd15000);
        wait_alloc;

        check("TC8_num_phases",    rrm_num_phases,                 8'd2);
        check("TC8_mem_alloc_0",   rrm_layer_mem_alloc[0*8 +: 8], 8'd5);
        check("TC8_mem_alloc_1",   rrm_layer_mem_alloc[1*8 +: 8], 8'd5);
        check("TC8_phase0_has_L0", rrm_phase_mask[0*ML + 0],      1'b1);
        check("TC8_phase1_has_L1", rrm_phase_mask[1*ML + 1],      1'b1);

        // ==================================================================
        // TC9: Non-layer-0 slot used (layer 2 only)
        //   Ensures layer index is correctly decoded even for middle slots
        // ==================================================================
        $display("\n--- TC9: Non-zero layer slot (layer 2) ---");
        do_reset;
        set_layer(2, 16'd3000, 16'd200, 2'b01);   // POOL layer
        wait_alloc;

        check("TC9_alloc_ready",   rrm_alloc_ready,               1'b1);
        check("TC9_mac_alloc_2",   rrm_layer_mac_alloc[2*8 +: 8], 8'd4);
        check("TC9_mem_alloc_2",   rrm_layer_mem_alloc[2*8 +: 8], 8'd3);
        check("TC9_phase0_has_L2", rrm_phase_mask[0*ML + 2],      1'b1);
        check("TC9_phase0_no_L0",  rrm_phase_mask[0*ML + 0],      1'b0);
        check("TC9_phase0_no_L1",  rrm_phase_mask[0*ML + 1],      1'b0);

        // ==================================================================
        // TC10: Balance rebalances a slow layer upward
        //   Layer 0: ops=5000, data_size=100 -> mac=5, compute_cycles=5000
        //   Layer 1: ops=1000, data_size=100 -> mac=4 (min), compute_cycles=1000
        //   Both fit in phase 0 (MAC: 5+4=9 <= 16, BRAM: 3+3=6 <= 8)
        //   balance: max=5000, min=1000, avg=3000
        //     Layer 0: 5000 > 3000*1.2=3600 -> slow, add 4 -> mac_alloc[0] = 5+4 = 9
        //     Layer 1: 1000 < 3000*0.8=2400 -> fast, mac>4, reduce:
        //              4 - (4/4)=4-1=3 -> mac_alloc[1] = 3
        // ==================================================================
        $display("\n--- TC10: Balance rebalances allocations ---");
        do_reset;
        set_two_layers(0, 16'd5000, 16'd100, 1, 16'd1000, 16'd100);
        wait_alloc;

        check("TC10_mac_alloc_0_slow",  rrm_layer_mac_alloc[0*8 +: 8], 8'd9);
        // Layer 1 mac=4 (min); reduction guard is >4, not >=4 -> stays at 4
        check("TC10_mac_alloc_1_fast",  rrm_layer_mac_alloc[1*8 +: 8], 8'd4);
        check("TC10_one_phase",         rrm_num_phases,                 8'd1);

        // ==================================================================
        // Final report
        // ==================================================================
        $display("\n=========================================");
        if (fail_count == 0)
            $display("ALL %0d TESTS PASSED", pass_count);
        else
            $display("%0d PASSED  |  %0d FAILED", pass_count, fail_count);
        $display("=========================================\n");
        $finish;
    end

    initial begin
        #200000;
        $display("WATCHDOG: simulation timed out");
        $finish;
    end

endmodule
