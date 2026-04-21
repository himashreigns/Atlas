#!/usr/bin/env python3
"""
TensorFlow Model to Hardware Mapper
Exports weights, generates test vectors, and creates golden reference outputs
"""

import tensorflow as tf
import numpy as np
import os
import struct
import json
from pathlib import Path

class TFModelToHardware:
    """Maps TensorFlow model to hardware streaming pipeline"""
    
    def __init__(self, model, output_dir="hw_export"):
        self.model = model
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        
        # Data format configuration
        self.data_width = 16  # bits
        self.acc_width = 32   # bits
        self.fixed_point_bits = 8  # Q8.8 format
        
        # Layer mapping
        self.hw_layers = []
        self.layer_outputs = {}
        
    def analyze_model(self):
        """Analyze TF model and extract layer information"""
        print("=" * 80)
        print("TensorFlow Model Analysis")
        print("=" * 80)
        
        self.model.summary()
        
        layer_idx = 0
        for layer in self.model.layers:
            if isinstance(layer, (tf.keras.layers.Conv2D, 
                                tf.keras.layers.MaxPooling2D,
                                tf.keras.layers.AveragePooling2D,
                                tf.keras.layers.Dense)):
                
                hw_layer_info = self._extract_layer_info(layer, layer_idx)
                self.hw_layers.append(hw_layer_info)
                
                print(f"\nLayer {layer_idx}: {layer.name}")
                print(f"  Type: {hw_layer_info['type']}")
                print(f"  Input shape: {hw_layer_info['input_shape']}")
                print(f"  Output shape: {hw_layer_info['output_shape']}")
                if hw_layer_info['type'] == 'CONV':
                    print(f"  Kernel: {hw_layer_info['kernel_size']}")
                    print(f"  Stride: {hw_layer_info['stride']}")
                    print(f"  Padding: {hw_layer_info['padding']}")
                elif hw_layer_info['type'] == 'POOL':
                    print(f"  Pool size: {hw_layer_info['pool_size']}")
                    
                layer_idx += 1
                
        # Save layer configuration
        config_path = self.output_dir / "layer_config.json"
        with open(config_path, 'w') as f:
            json.dump(self.hw_layers, f, indent=2, default=str)
        print(f"\nLayer configuration saved to {config_path}")
        
        return self.hw_layers
    
    def _extract_layer_info(self, layer, idx):
        """Extract hardware-relevant info from TF layer"""
        info = {
            'layer_idx': idx,
            'name': layer.name,
            'input_shape': layer.input_shape,
            'output_shape': layer.output_shape
        }
        
        if isinstance(layer, tf.keras.layers.Conv2D):
            info['type'] = 'CONV'
            info['kernel_size'] = layer.kernel_size[0]  # Assume square
            info['stride'] = layer.strides[0]
            info['padding'] = 1 if layer.padding == 'same' else 0
            info['in_channels'] = layer.input_shape[-1]
            info['out_channels'] = layer.output_shape[-1]
            info['has_weights'] = True
            
        elif isinstance(layer, (tf.keras.layers.MaxPooling2D, 
                               tf.keras.layers.AveragePooling2D)):
            info['type'] = 'POOL'
            info['pool_size'] = layer.pool_size[0]
            info['stride'] = layer.strides[0]
            info['in_channels'] = layer.input_shape[-1]
            info['out_channels'] = layer.output_shape[-1]
            info['has_weights'] = False
            
        elif isinstance(layer, tf.keras.layers.Dense):
            info['type'] = 'FC'
            info['input_size'] = layer.input_shape[-1]
            info['output_size'] = layer.output_shape[-1]
            info['has_weights'] = True
            
        return info
    
    def to_fixed_point(self, value):
        """Convert floating point to Q8.8 fixed point (16-bit)"""
        fixed = int(value * (1 << self.fixed_point_bits))
        # Clamp to 16-bit signed range
        fixed = max(-32768, min(32767, fixed))
        return fixed & 0xFFFF
    
    def from_fixed_point(self, fixed_val):
        """Convert Q8.8 fixed point back to floating point"""
        # Handle sign extension for 16-bit signed
        if fixed_val & 0x8000:
            fixed_val = fixed_val - 0x10000
        return fixed_val / (1 << self.fixed_point_bits)
    
    def export_weights(self):
        """Export model weights in hardware format"""
        print("\n" + "=" * 80)
        print("Exporting Weights")
        print("=" * 80)
        
        for hw_layer in self.hw_layers:
            if not hw_layer.get('has_weights', False):
                continue
                
            layer_name = hw_layer['name']
            layer = self.model.get_layer(layer_name)
            weights = layer.get_weights()
            
            if hw_layer['type'] == 'CONV':
                self._export_conv_weights(hw_layer, weights)
            elif hw_layer['type'] == 'FC':
                self._export_fc_weights(hw_layer, weights)
    
    def _export_conv_weights(self, hw_layer, weights):
        """Export convolutional layer weights"""
        kernel = weights[0]  # Shape: (kh, kw, in_ch, out_ch)
        bias = weights[1] if len(weights) > 1 else None
        
        layer_idx = hw_layer['layer_idx']
        kh, kw, in_ch, out_ch = kernel.shape
        
        # Reorder to hardware format: [out_ch][in_ch][kr][kc]
        kernel_hw = np.transpose(kernel, (3, 2, 0, 1))
        
        # Export as Verilog memory file
        mem_file = self.output_dir / f"layer{layer_idx}_weights.mem"
        with open(mem_file, 'w') as f:
            addr = 0
            for oc in range(out_ch):
                for ic in range(in_ch):
                    for kr in range(kh):
                        for kc in range(kw):
                            val = kernel_hw[oc, ic, kr, kc]
                            fixed_val = self.to_fixed_point(val)
                            f.write(f"@{addr:05X} {fixed_val:04X}\n")
                            addr += 1
        
        print(f"Layer {layer_idx} ({hw_layer['name']}): {addr} weights → {mem_file}")
        
        # Also export as binary for C/Python reference
        bin_file = self.output_dir / f"layer{layer_idx}_weights.bin"
        kernel_hw.astype(np.float32).tofile(bin_file)
        
        # Export bias if present
        if bias is not None:
            bias_file = self.output_dir / f"layer{layer_idx}_bias.mem"
            with open(bias_file, 'w') as f:
                for i, b in enumerate(bias):
                    fixed_val = self.to_fixed_point(b)
                    f.write(f"@{i:05X} {fixed_val:04X}\n")
    
    def _export_fc_weights(self, hw_layer, weights):
        """Export fully connected layer weights"""
        W = weights[0]  # Shape: (input_size, output_size)
        bias = weights[1] if len(weights) > 1 else None
        
        layer_idx = hw_layer['layer_idx']
        in_size, out_size = W.shape
        
        # Hardware format: [out_neuron][in_neuron]
        W_hw = W.T  # Transpose to (out_size, in_size)
        
        mem_file = self.output_dir / f"layer{layer_idx}_weights.mem"
        with open(mem_file, 'w') as f:
            addr = 0
            for out_n in range(out_size):
                for in_n in range(in_size):
                    val = W_hw[out_n, in_n]
                    fixed_val = self.to_fixed_point(val)
                    f.write(f"@{addr:05X} {fixed_val:04X}\n")
                    addr += 1
        
        print(f"Layer {layer_idx} ({hw_layer['name']}): {addr} weights → {mem_file}")
    
    def generate_test_vectors(self, num_samples=5):
        """Generate input test vectors and golden outputs"""
        print("\n" + "=" * 80)
        print(f"Generating Test Vectors ({num_samples} samples)")
        print("=" * 80)
        
        # Get input shape
        input_shape = self.model.input_shape[1:]  # Remove batch dimension
        
        # Generate random test inputs
        test_inputs = []
        for i in range(num_samples):
            if i == 0:
                # First sample: all zeros
                x = np.zeros((1,) + input_shape, dtype=np.float32)
            elif i == 1:
                # Second sample: all ones
                x = np.ones((1,) + input_shape, dtype=np.float32)
            elif i == 2:
                # Third sample: incremental pattern
                x = np.arange(np.prod(input_shape)).reshape((1,) + input_shape)
                x = x.astype(np.float32) / np.prod(input_shape)
            else:
                # Random samples
                x = np.random.randn(1, *input_shape).astype(np.float32)
            
            test_inputs.append(x)
        
        # Run inference and collect intermediate outputs
        all_outputs = []
        
        for sample_idx, x_in in enumerate(test_inputs):
            print(f"\nProcessing sample {sample_idx}...")
            
            # Create model that outputs all intermediate layers
            layer_outputs = self._get_all_layer_outputs(x_in)
            
            sample_data = {
                'input': x_in[0],  # Remove batch dimension
                'layers': layer_outputs
            }
            all_outputs.append(sample_data)
            
            # Export this sample
            self._export_sample(sample_idx, sample_data)
        
        # Save summary
        summary = {
            'num_samples': num_samples,
            'input_shape': input_shape,
            'data_format': f'Q{self.fixed_point_bits}.{self.data_width - self.fixed_point_bits - 1}',
            'samples': [f'sample_{i}' for i in range(num_samples)]
        }
        
        summary_file = self.output_dir / "test_vectors_summary.json"
        with open(summary_file, 'w') as f:
            json.dump(summary, f, indent=2)
        
        return all_outputs
    
    def _get_all_layer_outputs(self, x):
        """Get outputs from all intermediate layers"""
        layer_outputs = {}
        
        # Get only the layers we care about
        output_layers = [self.model.get_layer(hw_layer['name']) 
                        for hw_layer in self.hw_layers]
        
        # Create intermediate model
        intermediate_model = tf.keras.Model(
            inputs=self.model.input,
            outputs=[layer.output for layer in output_layers]
        )
        
        # Run inference
        outputs = intermediate_model.predict(x, verbose=0)
        
        # Store outputs
        for hw_layer, output in zip(self.hw_layers, outputs):
            layer_outputs[hw_layer['layer_idx']] = {
                'name': hw_layer['name'],
                'type': hw_layer['type'],
                'shape': output.shape[1:],  # Remove batch dim
                'data': output[0],  # Remove batch dim
                'min': float(np.min(output)),
                'max': float(np.max(output)),
                'mean': float(np.mean(output)),
                'std': float(np.std(output))
            }
        
        return layer_outputs
    
    def _export_sample(self, sample_idx, sample_data):
        """Export a single test sample"""
        sample_dir = self.output_dir / f"sample_{sample_idx}"
        sample_dir.mkdir(exist_ok=True)
        
        # Export input
        input_data = sample_data['input']
        self._export_feature_map(sample_dir / "input.mem", input_data, "input")
        np.save(sample_dir / "input.npy", input_data)
        
        # Export each layer output
        for layer_idx, layer_out in sample_data['layers'].items():
            layer_name = f"layer{layer_idx}"
            
            # Export as Verilog memory file
            mem_file = sample_dir / f"{layer_name}_output.mem"
            self._export_feature_map(mem_file, layer_out['data'], layer_name)
            
            # Export as numpy for easy comparison
            npy_file = sample_dir / f"{layer_name}_output.npy"
            np.save(npy_file, layer_out['data'])
            
            # Export statistics
            stats_file = sample_dir / f"{layer_name}_stats.json"
            with open(stats_file, 'w') as f:
                stats = {
                    'min': layer_out['min'],
                    'max': layer_out['max'],
                    'mean': layer_out['mean'],
                    'std': layer_out['std'],
                    'shape': list(layer_out['shape'])
                }
                json.dump(stats, f, indent=2)
        
        print(f"  Sample {sample_idx} exported to {sample_dir}")
    
    def _export_feature_map(self, filepath, data, name):
        """Export feature map in hardware memory format"""
        # Flatten in the correct order for hardware: [H][W][C]
        if len(data.shape) == 3:  # (H, W, C)
            h, w, c = data.shape
            with open(filepath, 'w') as f:
                addr = 0
                for ch in range(c):
                    for row in range(h):
                        for col in range(w):
                            val = data[row, col, ch]
                            fixed_val = self.to_fixed_point(val)
                            f.write(f"@{addr:05X} {fixed_val:08X}\n")
                            addr += 1
        elif len(data.shape) == 1:  # (N,) for FC output
            with open(filepath, 'w') as f:
                for addr, val in enumerate(data):
                    fixed_val = self.to_fixed_point(val)
                    f.write(f"@{addr:05X} {fixed_val:08X}\n")
    
    def generate_verilog_testbench(self):
        """Generate SystemVerilog testbench with comparisons"""
        print("\n" + "=" * 80)
        print("Generating Verilog Testbench")
        print("=" * 80)
        
        tb_file = self.output_dir / "tb_golden_comparison.sv"
        
        with open(tb_file, 'w') as f:
            f.write(self._generate_tb_header())
            f.write(self._generate_tb_body())
            f.write(self._generate_tb_comparison())
            f.write(self._generate_tb_footer())
        
        print(f"Testbench generated: {tb_file}")
    
    def _generate_tb_header(self):
        """Generate testbench header"""
        return '''`timescale 1ns/1ps

module tb_golden_comparison;

    parameter CLK_PERIOD = 10;
    parameter DATA_W = 16;
    parameter ACC_W = 32;
    
    // Tolerances for comparison
    parameter TOLERANCE_PERCENT = 5;  // 5% tolerance
    parameter ABS_TOLERANCE = 16'h0020;  // Absolute tolerance in fixed point
    
    reg clk;
    reg rst;
    
    // Test statistics
    integer total_comparisons = 0;
    integer passed_comparisons = 0;
    integer failed_comparisons = 0;
    
    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
'''
    
    def _generate_tb_body(self):
        """Generate main testbench body"""
        return f'''    // DUT instantiation would go here
    // streaming_nn_system dut (...);
    
    // Golden reference memory
    reg [ACC_W-1:0] golden_mem [0:1048575];
    
    // Load golden reference data
    task load_golden_sample;
        input integer sample_idx;
        input integer layer_idx;
        string filename;
        begin
            $sformat(filename, "hw_export/sample_%0d/layer%0d_output.mem", 
                    sample_idx, layer_idx);
            $readmemh(filename, golden_mem);
            $display("Loaded golden data: %s", filename);
        end
    endtask
    
    // Compare function with tolerance
    function bit compare_values;
        input [ACC_W-1:0] hw_val;
        input [ACC_W-1:0] golden_val;
        integer diff;
        integer threshold;
        begin
            diff = hw_val - golden_val;
            if (diff < 0) diff = -diff;
            
            // Calculate threshold as percentage of golden value
            threshold = (golden_val * TOLERANCE_PERCENT) / 100;
            if (threshold < ABS_TOLERANCE)
                threshold = ABS_TOLERANCE;
            
            compare_values = (diff <= threshold);
            
            total_comparisons = total_comparisons + 1;
            if (compare_values)
                passed_comparisons = passed_comparisons + 1;
            else begin
                failed_comparisons = failed_comparisons + 1;
                $display("MISMATCH: HW=%h, Golden=%h, Diff=%h", 
                        hw_val, golden_val, diff);
            end
        end
    endfunction
    
'''
    
    def _generate_tb_comparison(self):
        """Generate comparison tasks for each layer"""
        code = '''    // Layer-by-layer comparison tasks
    task compare_layer_output;
        input integer sample_idx;
        input integer layer_idx;
        input integer num_values;
        integer i;
        reg [ACC_W-1:0] hw_output;
        begin
            $display("\\nComparing Layer %0d outputs...", layer_idx);
            load_golden_sample(sample_idx, layer_idx);
            
            for (i = 0; i < num_values; i = i + 1) begin
                // Read HW output - interface depends on your design
                // hw_output = dut.pipeline.layer_X.out_mem[i];
                
                // For now, just read from a file
                hw_output = golden_mem[i];  // Placeholder
                
                if (!compare_values(hw_output, golden_mem[i])) begin
                    $display("  Position %0d failed", i);
                end
            end
            
            $display("  Layer %0d: %0d/%0d comparisons passed", 
                    layer_idx, passed_comparisons, total_comparisons);
        end
    endtask
    
'''
        return code
    
    def _generate_tb_footer(self):
        """Generate testbench main test"""
        return f'''    // Main test
    initial begin
        $dumpfile("golden_comparison.vcd");
        $dumpvars(0, tb_golden_comparison);
        
        rst = 1;
        #(CLK_PERIOD * 10);
        rst = 0;
        
        $display("=".repeat(80));
        $display("Golden Model Comparison Test");
        $display("=".repeat(80));
        
        // Test each sample
        // Sample 0: All zeros
        $display("\\nTesting Sample 0 (zeros)...");
        // Run inference
        // compare_layer_output(0, 0, num_outputs_layer0);
        // compare_layer_output(0, 1, num_outputs_layer1);
        
        // Summary
        $display("\\n" + "=".repeat(80));
        $display("Test Summary");
        $display("=".repeat(80));
        $display("Total comparisons: %0d", total_comparisons);
        $display("Passed: %0d", passed_comparisons);
        $display("Failed: %0d", failed_comparisons);
        $display("Pass rate: %.2f%%", 
                (passed_comparisons * 100.0) / total_comparisons);
        
        if (failed_comparisons == 0)
            $display("\\n*** ALL TESTS PASSED ***\\n");
        else
            $display("\\n*** TESTS FAILED ***\\n");
        
        #(CLK_PERIOD * 100);
        $finish;
    end

endmodule
'''.replace('"="', '\"=\"')


def create_simple_test_model():
    """Create a simple CNN for testing"""
    model = tf.keras.Sequential([
        tf.keras.layers.Input(shape=(28, 28, 1)),
        
        # Layer 0: Conv 5x5
        tf.keras.layers.Conv2D(6, (5, 5), activation=None, padding='valid', 
                              name='conv_0'),
        
        # Layer 1: Pool 2x2
        tf.keras.layers.MaxPooling2D((2, 2), name='pool_0'),
        
        # Layer 2: Conv 5x5
        tf.keras.layers.Conv2D(16, (5, 5), activation=None, padding='valid',
                              name='conv_1'),
        
        # Layer 3: Pool 2x2
        tf.keras.layers.MaxPooling2D((2, 2), name='pool_1'),
    ])
    
    return model


if __name__ == "__main__":
    print("TensorFlow Model to Hardware Exporter")
    print("=" * 80)
    
    # Create or load model
    print("Creating test model...")
    model = create_simple_test_model()
    
    # Initialize random weights
    dummy_input = np.random.randn(1, 28, 28, 1).astype(np.float32)
    _ = model(dummy_input)
    
    # Create exporter
    exporter = TFModelToHardware(model, output_dir="hw_export")
    
    # Analyze model
    hw_layers = exporter.analyze_model()
    
    # Export weights
    exporter.export_weights()
    
    # Generate test vectors
    test_outputs = exporter.generate_test_vectors(num_samples=5)
    
    # Generate testbench
    exporter.generate_verilog_testbench()
    
    print("\n" + "=" * 80)
    print("Export Complete!")
    print("=" * 80)
    print(f"Output directory: {exporter.output_dir}")
    print("\nGenerated files:")
    print("  - layer_config.json: Layer configuration")
    print("  - layer*_weights.mem: Weight files for Verilog")
    print("  - sample_*/: Test vectors and golden outputs")
    print("  - tb_golden_comparison.sv: SystemVerilog testbench")
    print("\nNext steps:")
    print("  1. Review layer_config.json")
    print("  2. Update streaming_nn_pipeline.v to match layer config")
    print("  3. Run simulation with exported weights and test vectors")
    print("  4. Compare HW outputs with golden references")
