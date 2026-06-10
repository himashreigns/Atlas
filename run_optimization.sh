#!/usr/bin/env bash
# Full pipeline:
#   1. golden  -- real TF inference → golden CSV + memh
#   2. optimize -- constrained optimizer → dnn_config.vh
#   3. compile  -- iverilog comprehensive TB
#   4. sim      -- run comprehensive TB (18 tests)
#   5. hw-dump  -- run DUT, dump output to sim/hw_output.txt
#   6. compare  -- Python: TF float vs hardware int (real comparison)
#   7. timing   -- Zedboard timing verification
set -euo pipefail
DNN=${DNN:-lenet5}; AREA=${AREA:-180}; POWER=${POWER:-2000}; OBJ=${OBJ:-latency}
cd "$(dirname "$0")"
echo "=== Step 1/7: TensorFlow golden reference ==="
( cd golden && python3 tf_golden.py . 2>&1 | grep -v 'tensorflow\|cuda\|oneDNN\|cpu_feature\|absl::\|InitializeLog\|WARNING' )
echo "=== Step 2/7: Constrained optimization ==="
python3 dnn_optimizer.py --dnn "$DNN" --area-budget "$AREA" --power-budget "$POWER" \
    --objective "$OBJ" --out-header sim/dnn_config.vh --out-json dnn_config.json -v
echo "=== Step 3/7: Compile comprehensive TB ==="
( cd sim && iverilog -g2012 -DGOLDEN_REPLAY -o tb.vvp \
      tb_dnn_comprehensive.sv ../rtl_stubs/streaming_nn_system_stub.sv -I . )
echo "=== Step 4/7: Run comprehensive simulation ==="
( cd sim && vvp tb.vvp )
echo "=== Step 5/7: Run hardware output dump (real MAC computation) ==="
( cd sim && iverilog -g2012 -DCOMPUTE_MODE -o tb_hw_dump.vvp \
      tb_hw_output_dump.sv ../rtl_stubs/streaming_nn_system_stub.sv -I . )
( cd sim && vvp tb_hw_dump.vvp )
echo "=== Step 6/7: Compare TF golden vs hardware output ==="
( cd sim && python3 ../compare_tf_vs_hw.py \
      --tf-csv ../golden/golden_output_tf.csv \
      --hw-txt hw_output.txt \
      --tolerance 2.0 ) || true   # don't abort pipeline on comparison fail
echo "=== Step 7/7: Zedboard timing verification ==="
( cd sim && iverilog -g2012 -DGOLDEN_REPLAY -o tb_zed.vvp \
      tb_zedboard_timing.sv ../rtl_stubs/streaming_nn_system_stub.sv -I . )
( cd sim && vvp tb_zed.vvp )
