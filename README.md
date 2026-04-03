# Systolic Array Visualization for Artix A7 100T

## Educational Demo: Fixed-Weight Systolic Array

This project demonstrates a **4x4 systolic array** with fixed weights, designed to help students visualize how data flows through processing elements in a systolic architecture.

## Features

- **4x4 Processing Element Grid**: Each PE multiplies incoming data with a fixed weight and accumulates results
- **LED Visualization**: 
  - Row LEDs show input data propagation
  - Column LEDs show partial sum accumulation
  - Grid LEDs show active PEs
- **Configurable Fixed Weights**: Pre-loaded weights for demonstration
- **Step-by-Step Operation**: Clock-based visualization of data flow

## Hardware Requirements

- Digilent Nexys A7 100T (or compatible Artix A7 100T board)
- 16 LEDs for PE grid visualization
- 8 LEDs for input/output visualization
- 2 buttons: reset and step/enable
- 1 switch bank for input data selection

## Architecture Overview

```
Inputs → [PE00] → [PE01] → [PE02] → [PE03] → Outputs
          ↓         ↓         ↓         ↓
        [PE10] → [PE11] → [PE12] → [PE13]
          ↓         ↓         ↓         ↓
        [PE20] → [PE21] → [PE22] → [PE23]
          ↓         ↓         ↓         ↓
        [PE30] → [PE31] → [PE32] → [PE33]
```

Each PE performs: `output = (input × fixed_weight) + accumulated_sum`

## Files

- `top.v`: Top-level module with I/O mapping
- `systolic_array.v`: 4x4 systolic array instantiation
- `processing_element.v`: Individual PE with multiplier and accumulator
- `constraints.xdc`: Pin constraints for Nexys A7 100T

## How It Works

1. **Input Data**: Enters from the left side of each row
2. **Fixed Weights**: Pre-stored in each PE (visible in code comments)
3. **Data Flow**: 
   - Data moves right through each row
   - Partial sums move down through each column
   - Results accumulate at the bottom
4. **Visualization**: LEDs light up to show active data paths and computations

## Usage for Teaching

1. **Reset**: Clear all accumulators
2. **Clock Cycles**: Watch data propagate through the array
3. **Observe**: 
   - How data moves systematically (like a heartbeat - "systolic")
   - How partial sums accumulate
   - Parallel computation across all PEs

## Fixed Weights Example

The demo uses a simple matrix multiplication pattern:
- Weight Matrix: 4x4 with values 1-16
- Input Vector: 4 elements
- Output: Matrix-vector multiplication result

## Building

Use Vivado to synthesize and implement:
```bash
vivado -mode batch -source build.tcl
```

Or open `project.xpr` in Vivado GUI.
