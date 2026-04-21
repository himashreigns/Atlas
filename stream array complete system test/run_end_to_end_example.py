#!/usr/bin/env python3
"""
End-to-End Example: TensorFlow Model to Hardware Validation
Demonstrates the complete workflow with a simple MNIST-style CNN
"""

import tensorflow as tf
import numpy as np
from pathlib import Path
import sys

# Import our tools
from tf_to_hardware import TFModelToHardware, create_simple_test_model
from compare_hw_golden import HardwareGoldenComparison

def create_mnist_model():
    """Create a simple MNIST classifier"""
    model = tf.keras.Sequential([
        # Input: 28x28x1
        tf.keras.layers.Input(shape=(28, 28, 1), name='input'),
        
        # Layer 0: Conv 5x5, 1 -> 6 channels
        tf.keras.layers.Conv2D(
            filters=6,
            kernel_size=(5, 5),
            strides=(1, 1),
            padding='valid',
            activation=None,  # No activation for easier verification
            use_bias=True,
            name='conv_0',
            kernel_initializer='glorot_uniform'
        ),
        # Output: 24x24x6
        
        # Layer 1: MaxPool 2x2
        tf.keras.layers.MaxPooling2D(
            pool_size=(2, 2),
            strides=(2, 2),
            name='pool_0'
        ),
        # Output: 12x12x6
        
        # Layer 2: Conv 5x5, 6 -> 16 channels
        tf.keras.layers.Conv2D(
            filters=16,
            kernel_size=(5, 5),
            strides=(1, 1),
            padding='valid',
            activation=None,
            use_bias=True,
            name='conv_1',
            kernel_initializer='glorot_uniform'
        ),
        # Output: 8x8x16
        
        # Layer 3: MaxPool 2x2
        tf.keras.layers.MaxPooling2D(
            pool_size=(2, 2),
            strides=(2, 2),
            name='pool_1'
        ),
        # Output: 4x4x16 = 256 features
    ])
    
    return model


def train_simple_model(model, epochs=2):
    """Train model on synthetic data"""
    print("\n" + "="*80)
    print("Training Model on Synthetic Data")
    print("="*80)
    
    # Generate synthetic training data
    num_samples = 1000
    X_train = np.random.randn(num_samples, 28, 28, 1).astype(np.float32)
    y_train = np.random.randint(0, 10, num_samples)
    
    # Add a dense layer for classification
    full_model = tf.keras.Sequential([
        model,
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(10, activation='softmax')
    ])
    
    full_model.compile(
        optimizer='adam',
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )
    
    # Train briefly
    print(f"Training for {epochs} epochs...")
    full_model.fit(X_train, y_train, epochs=epochs, batch_size=32, verbose=1)
    
    # Return just the feature extraction part
    return model


def generate_hardware_config(layer_config):
    """Generate Verilog configuration snippet"""
    config = []
    
    config.append("// Auto-generated hardware configuration")
    config.append("// Update streaming_nn_pipeline.v with these parameters\n")
    
    for layer in layer_config:
        idx = layer['layer_idx']
        config.append(f"// Layer {idx}: {layer['name']} - {layer['type']}")
        config.append(f"streaming_nn_layer_stage #(")
        config.append(f"    .LAYER_TYPE(\"{layer['type']}\"),")
        config.append(f"    .N(8),")
        config.append(f"    .DATA_W(16),")
        config.append(f"    .ACC_W(32),")
        config.append(f"    .ADDR_W(10),")
        
        if layer['type'] == 'CONV':
            h, w, c = layer['output_shape'][1:4]
            config.append(f"    .IMG_ROWS({layer['input_shape'][1]}),")
            config.append(f"    .IMG_COLS({layer['input_shape'][2]}),")
            config.append(f"    .KERNEL_SIZE({layer['kernel_size']}),")
            config.append(f"    .STRIDE({layer['stride']}),")
            config.append(f"    .PADDING({layer['padding']}),")
            config.append(f"    .IN_CHANNELS({layer['in_channels']}),")
            config.append(f"    .OUT_CHANNELS({layer['out_channels']})")
        elif layer['type'] == 'POOL':
            config.append(f"    .IMG_ROWS({layer['input_shape'][1]}),")
            config.append(f"    .IMG_COLS({layer['input_shape'][2]}),")
            config.append(f"    .POOL_SIZE({layer['pool_size']}),")
            config.append(f"    .IN_CHANNELS({layer['in_channels']}),")
            config.append(f"    .OUT_CHANNELS({layer['out_channels']})")
        
        config.append(f") layer_{idx} (")
        config.append(f"    // ... port connections ...")
        config.append(f");\n")
    
    return "\n".join(config)


def main():
    print("="*80)
    print("End-to-End TensorFlow to Hardware Validation")
    print("="*80)
    
    # Step 1: Create and train model
    print("\nStep 1: Creating model...")
    model = create_mnist_model()
    
    # Initialize weights by doing a forward pass
    dummy_input = np.random.randn(1, 28, 28, 1).astype(np.float32)
    _ = model(dummy_input)
    
    print("\nModel architecture:")
    model.summary()
    
    # Optional: Train the model
    # model = train_simple_model(model, epochs=2)
    
    # Step 2: Export to hardware format
    print("\n" + "="*80)
    print("Step 2: Exporting to Hardware Format")
    print("="*80)
    
    exporter = TFModelToHardware(model, output_dir="hw_export")
    
    # Analyze model
    hw_layers = exporter.analyze_model()
    
    # Export weights
    exporter.export_weights()
    
    # Generate test vectors
    print("\nGenerating test vectors with diverse patterns...")
    test_outputs = exporter.generate_test_vectors(num_samples=5)
    
    # Generate testbench
    exporter.generate_verilog_testbench()
    
    # Step 3: Generate hardware configuration
    print("\n" + "="*80)
    print("Step 3: Generating Hardware Configuration")
    print("="*80)
    
    hw_config = generate_hardware_config(hw_layers)
    
    config_file = Path("hw_export") / "hardware_config.v"
    with open(config_file, 'w') as f:
        f.write(hw_config)
    
    print(f"Hardware configuration written to: {config_file}")
    print("\nConfiguration snippet:")
    print("-" * 80)
    print(hw_config[:500] + "...\n")
    
    # Step 4: Simulation instructions
    print("="*80)
    print("Step 4: Next Steps - Hardware Simulation")
    print("="*80)
    
    print("\n1. Update streaming_nn_pipeline.v with generated configuration")
    print("   File: hw_export/hardware_config.v")
    
    print("\n2. Compile the design:")
    print("   iverilog -g2012 -o sim \\")
    print("       streaming_row_buffer.v \\")
    print("       streaming_nn_layer_stage.v \\")
    print("       streaming_nn_pipeline.v \\")
    print("       streaming_nn_system.v \\")
    print("       nn_layer_control_unit.v \\")
    print("       mac_array_stage_with_bram.v \\")
    print("       mac_array.v \\")
    print("       mac_stage.v \\")
    print("       tb_hw_vs_golden.sv")
    
    print("\n3. Run simulation:")
    print("   vvp sim")
    
    print("\n4. Check results:")
    print("   - Look for 'Pass rate' in simulation output")
    print("   - Check for MISMATCH warnings")
    print("   - View waveforms: gtkwave hw_vs_golden.vcd")
    
    print("\n5. Run Python comparison for detailed analysis:")
    print("   python3 compare_hw_golden.py")
    
    # Step 5: Expected results
    print("\n" + "="*80)
    print("Expected Results")
    print("="*80)
    
    print("\nTest vectors generated:")
    print(f"  Sample 0: All zeros (sanity check)")
    print(f"  Sample 1: All ones")
    print(f"  Sample 2: Incremental pattern")
    print(f"  Sample 3-4: Random inputs")
    
    print("\nPer-layer output sizes:")
    for layer in hw_layers:
        shape = layer['output_shape'][1:]  # Remove batch dim
        size = np.prod(shape)
        print(f"  Layer {layer['layer_idx']} ({layer['type']}): "
              f"{shape} = {size} values")
    
    print("\nValidation criteria:")
    print("  ✓ Pass rate > 95% for each layer")
    print("  ✓ Max error < 0.1 (in floating point)")
    print("  ✓ No systematic bias (mean error ≈ 0)")
    
    # Step 6: Analysis example
    print("\n" + "="*80)
    print("Step 6: Analysis Example")
    print("="*80)
    
    print("\nAnalyzing first test sample...")
    
    # Show golden output statistics
    sample_0_dir = Path("hw_export") / "sample_0"
    for layer_idx, layer_info in enumerate(hw_layers):
        stats_file = sample_0_dir / f"layer{layer_idx}_stats.json"
        if stats_file.exists():
            import json
            with open(stats_file, 'r') as f:
                stats = json.load(f)
            print(f"\nLayer {layer_idx} ({layer_info['name']}):")
            print(f"  Output range: [{stats['min']:.4f}, {stats['max']:.4f}]")
            print(f"  Mean: {stats['mean']:.4f}")
            print(f"  Std: {stats['std']:.4f}")
    
    # Summary
    print("\n" + "="*80)
    print("Export Complete!")
    print("="*80)
    
    print("\nGenerated files:")
    print("  hw_export/")
    print("    ├── layer_config.json          - Layer specifications")
    print("    ├── hardware_config.v          - Verilog configuration")
    print("    ├── layer*_weights.mem         - Weight files")
    print("    ├── layer*_bias.mem            - Bias files")
    print("    ├── sample_*/")
    print("    │   ├── input.mem              - Test input")
    print("    │   ├── layer*_output.mem      - Golden outputs")
    print("    │   ├── layer*_output.npy      - NumPy format")
    print("    │   └── layer*_stats.json      - Statistics")
    print("    └── test_vectors_summary.json  - Test configuration")
    
    print("\nYou're ready to run hardware simulation!")
    print("Follow the steps above to validate your hardware implementation.")
    
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as e:
        print(f"\nERROR: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
