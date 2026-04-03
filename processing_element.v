`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Processing Element for Systolic Array
// Educational Demo for Artix A7 100T
// 
// Each PE performs: output = (input_data × fixed_weight) + input_sum
// The result is passed to the next PE in the row (data_out) and 
// down to the PE below (sum_out)
//////////////////////////////////////////////////////////////////////////////////

module processing_element (
    input wire clk,
    input wire rst,
    input wire enable,          // Enable signal for step-by-step operation
    
    // Data flowing from left to right
    input wire [7:0] data_in,   // Input data from left neighbor
    output reg [7:0] data_out,  // Output data to right neighbor
    
    // Partial sums flowing top to bottom
    input wire [15:0] sum_in,   // Partial sum from above
    output reg [15:0] sum_out,  // Partial sum to below
    
    // Fixed weight for this PE (hardcoded for demo)
    input wire [7:0] fixed_weight,
    
    // Visualization output
    output wire [7:0] pe_activity  // Shows current multiplication result
    );
    
    // Internal registers
    reg [15:0] mult_result;
    reg [15:0] add_result;
    
    // Combinational multiplication
    always @(*) begin
        mult_result = data_in * fixed_weight;
    end
    
    // Sequential accumulation with enable
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 8'd0;
            sum_out <= 16'd0;
        end else if (enable) begin
            // Add multiplication result to incoming sum
            add_result = mult_result + sum_in;
            
            // Pass data to the right (with 1-cycle delay for visualization)
            data_out <= data_in;
            
            // Pass accumulated sum downward
            sum_out <= add_result;
        end
    end
    
    // Activity LED output (lower 8 bits of multiplication result)
    assign pe_activity = mult_result[7:0];
    
endmodule
