# Teaching Guide: Systolic Array Visualization

## Introduction for Students

A **systolic array** is a parallel computing architecture where data flows rhythmically through a grid of processing elements (PEs), similar to how blood pumps through the heart's chambers (hence "systolic" - relating to contraction/pumping).

## Key Concepts

### 1. Data Flow Pattern
- **Horizontal**: Input data enters from the left and moves right through each row
- **Vertical**: Partial sums enter from the top and accumulate downward
- **Synchronized**: All PEs operate in lockstep on each clock cycle

### 2. Processing Element Operation
Each PE performs this simple operation:
```
output = (input_data × fixed_weight) + partial_sum_in
```

Then it passes:
- `input_data` → to the right neighbor
- `output` → to the PE below

### 3. Fixed Weights Demo
In our demo, each PE has a pre-programmed weight:
```
Row 0: [1,  2,  3,  4 ]
Row 1: [5,  6,  7,  8 ]
Row 2: [9,  10, 11, 12]
Row 3: [13, 14, 15, 16]
```

## Classroom Demonstration Steps

### Step 1: Reset the Array
- Press the center reset button
- All LEDs should turn off
- All accumulators are cleared

### Step 2: Set Input Values
Use the slide switches to set input values:
- SW[7:0]: Input for rows 0 and 2
- SW[15:8]: Input for rows 1 and 3

**Try these examples:**
- Set all switches to 0x01 (value = 1)
- Set all switches to 0x02 (value = 2)
- Create a pattern like 0x0F (value = 15)

### Step 3: Step Through Computation
- Press the UP button to advance one clock cycle
- Watch LEDs light up as data propagates
- Observe the wave-like pattern across the array

### Step 4: Observe Results
After 4+ clock cycles:
- The bottom outputs contain the final accumulated results
- Each column has computed: Σ(input × weight) for that column

## Example Calculation

With input = 1 for all rows:

**Column 0 Result:**
- PE(0,0): 1 × 1 = 1
- PE(1,0): 1 × 5 = 5, sum = 1 + 5 = 6
- PE(2,0): 1 × 9 = 9, sum = 6 + 9 = 15
- PE(3,0): 1 × 13 = 13, sum = 15 + 13 = 28

**Final output for column 0 = 28**

Students can verify: 1×(1+5+9+13) = 1×28 = 28 ✓

## Discussion Points

### Why Systolic Arrays?
1. **Parallelism**: All 16 PEs compute simultaneously
2. **Efficiency**: No need to fetch weights from memory repeatedly
3. **Scalability**: Easy to extend to larger arrays (e.g., 16×16, 256×256)
4. **Regular Structure**: Simple routing, good for VLSI implementation

### Real-World Applications
- **Neural Networks**: Matrix multiplication in AI accelerators
- **Signal Processing**: Convolution operations
- **Computer Graphics**: Transform matrices
- **Scientific Computing**: Linear algebra operations

### Comparison to Traditional Approaches
| Traditional CPU | Systolic Array |
|----------------|----------------|
| Sequential execution | Parallel execution |
| Fetch weight from memory each time | Weight stored locally |
| One multiply-add per cycle | N×M multiply-adds per cycle |
| Complex control logic | Simple, regular control |

## Extension Exercises

### Exercise 1: Predict the Output
Given specific switch settings, have students calculate expected LED patterns before pressing the button.

### Exercise 2: Trace Data Flow
Draw the array on paper and trace how a single input value propagates through all PEs over multiple cycles.

### Exercise 3: Modify Weights
Challenge advanced students to modify the Verilog code to use different weight patterns (e.g., all 2s, or powers of 2).

### Exercise 4: Calculate Throughput
- How many multiplications occur per clock cycle?
- How does this compare to a sequential CPU?
- What's the speedup factor?

## Common Student Questions

**Q: Why do we need the enable signal?**
A: It slows down the computation so we can observe it with LEDs. In real applications, it would run at full clock speed.

**Q: What happens if we change the input mid-computation?**
A: New data enters the array while old data is still processing. This is called "pipelining" - multiple data sets can be in flight simultaneously!

**Q: Why are the weights fixed?**
A: For this demo, fixed weights simplify the design. In real neural network accelerators, weights can be loaded from memory before computation begins.

**Q: How big are systolic arrays in real chips?**
A: Modern AI accelerators use arrays as large as 128×128 or even 256×256 PEs! Google's TPU uses a 128×128 systolic array.

## Assessment Ideas

1. **Prediction Test**: Show switch settings, ask students to predict LED states after N cycles
2. **Timing Diagram**: Draw the wave propagation pattern over 8 clock cycles
3. **Design Question**: How would you modify the array to support 8-bit outputs instead of 16-bit?
4. **Application Essay**: Research and describe one real-world application of systolic arrays
