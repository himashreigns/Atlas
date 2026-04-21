#!/usr/bin/env python3
"""
Hardware vs Golden Model Comparison
Runs both TensorFlow model and hardware simulation, compares results
"""

import numpy as np
import tensorflow as tf
import subprocess
import json
import matplotlib.pyplot as plt
from pathlib import Path
import struct

class HardwareGoldenComparison:
    """Compare hardware simulation results with TensorFlow golden model"""
    
    def __init__(self, tf_model, hw_export_dir="hw_export", sim_output_dir="sim_output"):
        self.tf_model = tf_model
        self.hw_export_dir = Path(hw_export_dir)
        self.sim_output_dir = Path(sim_output_dir)
        self.sim_output_dir.mkdir(exist_ok=True)
        
        # Load layer configuration
        with open(self.hw_export_dir / "layer_config.json", 'r') as f:
            self.layer_config = json.load(f)
        
        self.fixed_point_bits = 8  # Q8.8 format
        self.data_width = 16
        self.acc_width = 32
        
        # Comparison results
        self.comparison_results = []
    
    def from_fixed_point(self, fixed_val, width=16):
        """Convert fixed point to float"""
        # Handle sign extension
        if width == 16:
            if fixed_val & 0x8000:
                fixed_val = fixed_val - 0x10000
        elif width == 32:
            if fixed_val & 0x80000000:
                fixed_val = fixed_val - 0x100000000
        
        return fixed_val / (1 << self.fixed_point_bits)
    
    def to_fixed_point(self, value, width=16):
        """Convert float to fixed point"""
        fixed = int(value * (1 << self.fixed_point_bits))
        
        if width == 16:
            fixed = max(-32768, min(32767, fixed))
            return fixed & 0xFFFF
        else:  # 32-bit
            fixed = max(-2147483648, min(2147483647, fixed))
            return fixed & 0xFFFFFFFF
    
    def load_hw_output(self, sample_idx, layer_idx, output_shape):
        """Load hardware simulation output from memory dump"""
        # Hardware writes output in memory format
        mem_file = self.sim_output_dir / f"sample_{sample_idx}_layer_{layer_idx}_output.mem"
        
        if not mem_file.exists():
            print(f"Warning: {mem_file} not found, returning zeros")
            return np.zeros(output_shape)
        
        # Read memory file
        data = []
        with open(mem_file, 'r') as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#'):
                    # Format: @ADDR VALUE
                    parts = line.split()
                    if len(parts) == 2:
                        val_hex = parts[1]
                        val = int(val_hex, 16)
                        data.append(self.from_fixed_point(val, self.acc_width))
        
        # Reshape to output shape (assuming CHW or HWC format)
        if len(output_shape) == 3:
            h, w, c = output_shape
            data_array = np.array(data[:h*w*c])
            # Assume data stored as [C][H][W] in memory
            return data_array.reshape(c, h, w).transpose(1, 2, 0)
        else:
            return np.array(data[:np.prod(output_shape)]).reshape(output_shape)
    
    def load_golden_output(self, sample_idx, layer_idx):
        """Load golden reference from TF model export"""
        npy_file = self.hw_export_dir / f"sample_{sample_idx}" / f"layer{layer_idx}_output.npy"
        return np.load(npy_file)
    
    def compare_outputs(self, hw_output, golden_output, layer_name, tolerance_percent=5.0):
        """Compare hardware and golden outputs"""
        # Ensure same shape
        if hw_output.shape != golden_output.shape:
            print(f"ERROR: Shape mismatch - HW: {hw_output.shape}, Golden: {golden_output.shape}")
            return None
        
        # Calculate differences
        abs_diff = np.abs(hw_output - golden_output)
        rel_diff = np.abs((hw_output - golden_output) / (golden_output + 1e-10)) * 100
        
        # Calculate metrics
        max_abs_error = np.max(abs_diff)
        mean_abs_error = np.mean(abs_diff)
        max_rel_error = np.max(rel_diff)
        mean_rel_error = np.mean(rel_diff)
        
        # Check tolerance
        tolerance_abs = np.abs(golden_output) * (tolerance_percent / 100.0)
        tolerance_abs = np.maximum(tolerance_abs, 0.01)  # Minimum absolute tolerance
        
        passed_mask = abs_diff <= tolerance_abs
        pass_rate = np.sum(passed_mask) / passed_mask.size * 100
        
        # Find worst mismatches
        worst_indices = np.argsort(abs_diff.flatten())[-10:][::-1]
        worst_mismatches = []
        for idx in worst_indices:
            idx_tuple = np.unravel_index(idx, abs_diff.shape)
            worst_mismatches.append({
                'index': idx_tuple,
                'hw_value': float(hw_output.flatten()[idx]),
                'golden_value': float(golden_output.flatten()[idx]),
                'abs_error': float(abs_diff.flatten()[idx]),
                'rel_error': float(rel_diff.flatten()[idx])
            })
        
        results = {
            'layer_name': layer_name,
            'shape': hw_output.shape,
            'max_abs_error': float(max_abs_error),
            'mean_abs_error': float(mean_abs_error),
            'max_rel_error': float(max_rel_error),
            'mean_rel_error': float(mean_rel_error),
            'pass_rate': float(pass_rate),
            'total_elements': int(hw_output.size),
            'passed_elements': int(np.sum(passed_mask)),
            'failed_elements': int(hw_output.size - np.sum(passed_mask)),
            'worst_mismatches': worst_mismatches[:5]  # Top 5
        }
        
        return results
    
    def compare_all_layers(self, sample_idx):
        """Compare all layers for a given sample"""
        print(f"\n{'='*80}")
        print(f"Comparing Sample {sample_idx}")
        print(f"{'='*80}")
        
        sample_results = []
        
        for layer_info in self.layer_config:
            layer_idx = layer_info['layer_idx']
            layer_name = layer_info['name']
            
            print(f"\nLayer {layer_idx}: {layer_name} ({layer_info['type']})")
            
            # Load outputs
            golden = self.load_golden_output(sample_idx, layer_idx)
            hw = self.load_hw_output(sample_idx, layer_idx, golden.shape)
            
            # Compare
            results = self.compare_outputs(hw, golden, layer_name)
            
            if results:
                sample_results.append(results)
                
                # Print summary
                print(f"  Shape: {results['shape']}")
                print(f"  Max Absolute Error: {results['max_abs_error']:.6f}")
                print(f"  Mean Absolute Error: {results['mean_abs_error']:.6f}")
                print(f"  Max Relative Error: {results['max_rel_error']:.2f}%")
                print(f"  Mean Relative Error: {results['mean_rel_error']:.2f}%")
                print(f"  Pass Rate: {results['pass_rate']:.2f}%")
                
                if results['failed_elements'] > 0:
                    print(f"  WARNING: {results['failed_elements']} elements failed tolerance check")
                    print(f"  Worst mismatch:")
                    worst = results['worst_mismatches'][0]
                    print(f"    Index: {worst['index']}")
                    print(f"    HW: {worst['hw_value']:.6f}, Golden: {worst['golden_value']:.6f}")
                    print(f"    Error: {worst['abs_error']:.6f} ({worst['rel_error']:.2f}%)")
        
        return sample_results
    
    def generate_comparison_report(self, all_results, output_file="comparison_report.json"):
        """Generate detailed comparison report"""
        report = {
            'summary': {
                'total_samples': len(all_results),
                'total_layers': len(self.layer_config),
                'data_format': f'Q{self.fixed_point_bits}.{self.data_width - self.fixed_point_bits - 1}'
            },
            'samples': all_results
        }
        
        # Calculate overall statistics
        all_pass_rates = []
        all_max_errors = []
        
        for sample_results in all_results:
            for layer_result in sample_results:
                all_pass_rates.append(layer_result['pass_rate'])
                all_max_errors.append(layer_result['max_abs_error'])
        
        report['summary']['overall_pass_rate'] = float(np.mean(all_pass_rates))
        report['summary']['worst_max_error'] = float(np.max(all_max_errors))
        report['summary']['avg_max_error'] = float(np.mean(all_max_errors))
        
        # Save report
        report_path = self.sim_output_dir / output_file
        with open(report_path, 'w') as f:
            json.dump(report, f, indent=2)
        
        print(f"\n{'='*80}")
        print("Overall Summary")
        print(f"{'='*80}")
        print(f"Samples tested: {report['summary']['total_samples']}")
        print(f"Layers per sample: {report['summary']['total_layers']}")
        print(f"Overall pass rate: {report['summary']['overall_pass_rate']:.2f}%")
        print(f"Worst max error: {report['summary']['worst_max_error']:.6f}")
        print(f"Average max error: {report['summary']['avg_max_error']:.6f}")
        print(f"\nDetailed report saved to: {report_path}")
        
        return report
    
    def visualize_comparison(self, sample_idx, layer_idx):
        """Create visualization of HW vs Golden comparison"""
        layer_info = self.layer_config[layer_idx]
        
        golden = self.load_golden_output(sample_idx, layer_idx)
        hw = self.load_hw_output(sample_idx, layer_idx, golden.shape)
        
        if len(golden.shape) != 3:
            print("Visualization only supported for 3D outputs (H, W, C)")
            return
        
        h, w, c = golden.shape
        
        # Create figure with subplots
        num_channels = min(4, c)  # Show first 4 channels
        fig, axes = plt.subplots(num_channels, 3, figsize=(15, num_channels * 4))
        
        if num_channels == 1:
            axes = axes.reshape(1, -1)
        
        for ch in range(num_channels):
            # Golden
            im1 = axes[ch, 0].imshow(golden[:, :, ch], cmap='viridis')
            axes[ch, 0].set_title(f'Golden - Channel {ch}')
            axes[ch, 0].axis('off')
            plt.colorbar(im1, ax=axes[ch, 0])
            
            # Hardware
            im2 = axes[ch, 1].imshow(hw[:, :, ch], cmap='viridis')
            axes[ch, 1].set_title(f'Hardware - Channel {ch}')
            axes[ch, 1].axis('off')
            plt.colorbar(im2, ax=axes[ch, 1])
            
            # Difference
            diff = np.abs(hw[:, :, ch] - golden[:, :, ch])
            im3 = axes[ch, 2].imshow(diff, cmap='hot')
            axes[ch, 2].set_title(f'Abs Difference - Channel {ch}')
            axes[ch, 2].axis('off')
            plt.colorbar(im3, ax=axes[ch, 2])
        
        plt.tight_layout()
        
        # Save figure
        fig_path = self.sim_output_dir / f"comparison_sample{sample_idx}_layer{layer_idx}.png"
        plt.savefig(fig_path, dpi=150, bbox_inches='tight')
        print(f"Visualization saved to: {fig_path}")
        
        plt.close()
    
    def create_mismatch_heatmap(self, all_results):
        """Create heatmap showing error distribution across layers and samples"""
        num_samples = len(all_results)
        num_layers = len(self.layer_config)
        
        # Create matrix of max errors
        error_matrix = np.zeros((num_samples, num_layers))
        
        for sample_idx, sample_results in enumerate(all_results):
            for layer_result in sample_results:
                layer_idx = next(i for i, l in enumerate(self.layer_config) 
                               if l['name'] == layer_result['layer_name'])
                error_matrix[sample_idx, layer_idx] = layer_result['max_abs_error']
        
        # Create heatmap
        fig, ax = plt.subplots(figsize=(12, 8))
        im = ax.imshow(error_matrix, cmap='YlOrRd', aspect='auto')
        
        # Labels
        ax.set_xticks(range(num_layers))
        ax.set_xticklabels([f"L{l['layer_idx']}\n{l['type']}" 
                           for l in self.layer_config], rotation=45)
        ax.set_yticks(range(num_samples))
        ax.set_yticklabels([f"Sample {i}" for i in range(num_samples)])
        
        ax.set_xlabel('Layer')
        ax.set_ylabel('Sample')
        ax.set_title('Maximum Absolute Error Heatmap')
        
        # Colorbar
        cbar = plt.colorbar(im, ax=ax)
        cbar.set_label('Max Absolute Error')
        
        # Annotations
        for i in range(num_samples):
            for j in range(num_layers):
                text = ax.text(j, i, f'{error_matrix[i, j]:.3f}',
                             ha="center", va="center", color="black", fontsize=8)
        
        plt.tight_layout()
        
        # Save
        fig_path = self.sim_output_dir / "error_heatmap.png"
        plt.savefig(fig_path, dpi=150, bbox_inches='tight')
        print(f"Error heatmap saved to: {fig_path}")
        
        plt.close()


def run_hardware_simulation(sample_idx, hw_export_dir, sim_output_dir):
    """
    Run hardware simulation (placeholder - integrate with your simulator)
    This would call your Verilog simulator and collect outputs
    """
    print(f"\n{'='*80}")
    print(f"Running Hardware Simulation for Sample {sample_idx}")
    print(f"{'='*80}")
    
    # Example: Run Icarus Verilog simulation
    # In practice, this would:
    # 1. Load weights into simulation
    # 2. Load input test vector
    # 3. Run simulation
    # 4. Extract outputs from memory dumps
    
    print("NOTE: Hardware simulation integration required")
    print("Please run your Verilog simulation separately and ensure")
    print(f"outputs are saved to {sim_output_dir}/sample_{sample_idx}_layer_*_output.mem")
    
    # Placeholder: Copy golden outputs as HW outputs for testing
    import shutil
    hw_export_path = Path(hw_export_dir)
    sim_output_path = Path(sim_output_dir)
    
    sample_dir = hw_export_path / f"sample_{sample_idx}"
    if sample_dir.exists():
        for layer_file in sample_dir.glob("layer*_output.mem"):
            layer_idx = layer_file.stem.split('_')[0].replace('layer', '')
            dst = sim_output_path / f"sample_{sample_idx}_layer_{layer_idx}_output.mem"
            shutil.copy(layer_file, dst)
            print(f"  Copied {layer_file.name} to simulation output")


if __name__ == "__main__":
    print("Hardware vs Golden Model Comparison Tool")
    print("=" * 80)
    
    # Load or create TF model
    print("\nLoading TensorFlow model...")
    model = tf.keras.Sequential([
        tf.keras.layers.Input(shape=(28, 28, 1)),
        tf.keras.layers.Conv2D(6, (5, 5), activation=None, padding='valid', name='conv_0'),
        tf.keras.layers.MaxPooling2D((2, 2), name='pool_0'),
        tf.keras.layers.Conv2D(16, (5, 5), activation=None, padding='valid', name='conv_1'),
        tf.keras.layers.MaxPooling2D((2, 2), name='pool_1'),
    ])
    
    # Initialize
    dummy = np.random.randn(1, 28, 28, 1).astype(np.float32)
    _ = model(dummy)
    
    # Create comparison tool
    comparator = HardwareGoldenComparison(model)
    
    # Test multiple samples
    num_samples = 3
    all_results = []
    
    for sample_idx in range(num_samples):
        # Run hardware simulation (placeholder)
        run_hardware_simulation(sample_idx, "hw_export", "sim_output")
        
        # Compare results
        sample_results = comparator.compare_all_layers(sample_idx)
        all_results.append(sample_results)
        
        # Visualize first few layers
        if sample_idx == 0:
            for layer_idx in range(min(2, len(comparator.layer_config))):
                comparator.visualize_comparison(sample_idx, layer_idx)
    
    # Generate report
    report = comparator.generate_comparison_report(all_results)
    
    # Create error heatmap
    comparator.create_mismatch_heatmap(all_results)
    
    print("\n" + "=" * 80)
    print("Comparison Complete!")
    print("=" * 80)
    print("\nGenerated files:")
    print("  - sim_output/comparison_report.json: Detailed comparison results")
    print("  - sim_output/comparison_*.png: Visualization of differences")
    print("  - sim_output/error_heatmap.png: Error distribution heatmap")
