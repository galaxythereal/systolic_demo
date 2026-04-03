`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 4x4 Systolic Array
// Educational Demo for Artix A7 100T
// 
// This module instantiates a 4x4 grid of processing elements.
// Data flows from left to right, partial sums flow from top to bottom.
// Fixed weights are hardcoded for each PE position.
//////////////////////////////////////////////////////////////////////////////////

module systolic_array (
    input wire clk,
    input wire rst,
    input wire enable,
    
    // Input data for each row (4 rows)
    input wire [7:0] row_data_in [3:0],
    
    // Output data from each row (rightmost PEs)
    output wire [7:0] row_data_out [3:0],
    
    // Output sums from bottom row (4 columns)
    output wire [15:0] col_sum_out [3:0],
    
    // PE activity LEDs (16 PEs, each has 8-bit activity)
    output wire [7:0] pe_activity [3:0][3:0]
    );
    
    // Internal wires for data flow between PEs
    wire [7:0] data_internal [3:0][2:0];     // Data between PEs in each row
    wire [15:0] sum_internal [2:0][3:0];     // Sums between PEs in each column
    
    // Fixed weights for each PE (row, col)
    // Using simple pattern: weight = row*4 + col + 1
    // PE(0,0)=1, PE(0,1)=2, PE(0,2)=3, PE(0,3)=4
    // PE(1,0)=5, PE(1,1)=6, etc.
    wire [7:0] weights [3:0][3:0];
    
    assign weights[0][0] = 8'd1;
    assign weights[0][1] = 8'd2;
    assign weights[0][2] = 8'd3;
    assign weights[0][3] = 8'd4;
    assign weights[1][0] = 8'd5;
    assign weights[1][1] = 8'd6;
    assign weights[1][2] = 8'd7;
    assign weights[1][3] = 8'd8;
    assign weights[2][0] = 8'd9;
    assign weights[2][1] = 8'd10;
    assign weights[2][2] = 8'd11;
    assign weights[2][3] = 8'd12;
    assign weights[3][0] = 8'd13;
    assign weights[3][1] = 8'd14;
    assign weights[3][2] = 8'd15;
    assign weights[3][3] = 8'd16;
    
    // Row 0
    processing_element pe_0_0 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(row_data_in[0]),
        .data_out(data_internal[0][0]),
        .sum_in(16'd0),  // Top row has zero input sum
        .sum_out(sum_internal[0][0]),
        .fixed_weight(weights[0][0]),
        .pe_activity(pe_activity[0][0])
    );
    
    processing_element pe_0_1 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[0][0]),
        .data_out(data_internal[0][1]),
        .sum_in(16'd0),
        .sum_out(sum_internal[0][1]),
        .fixed_weight(weights[0][1]),
        .pe_activity(pe_activity[0][1])
    );
    
    processing_element pe_0_2 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[0][1]),
        .data_out(data_internal[0][2]),
        .sum_in(16'd0),
        .sum_out(sum_internal[0][2]),
        .fixed_weight(weights[0][2]),
        .pe_activity(pe_activity[0][2])
    );
    
    processing_element pe_0_3 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[0][2]),
        .data_out(row_data_out[0]),
        .sum_in(16'd0),
        .sum_out(sum_internal[0][3]),
        .fixed_weight(weights[0][3]),
        .pe_activity(pe_activity[0][3])
    );
    
    // Row 1
    processing_element pe_1_0 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(row_data_in[1]),
        .data_out(data_internal[1][0]),
        .sum_in(sum_internal[0][0]),
        .sum_out(sum_internal[1][0]),
        .fixed_weight(weights[1][0]),
        .pe_activity(pe_activity[1][0])
    );
    
    processing_element pe_1_1 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[1][0]),
        .data_out(data_internal[1][1]),
        .sum_in(sum_internal[0][1]),
        .sum_out(sum_internal[1][1]),
        .fixed_weight(weights[1][1]),
        .pe_activity(pe_activity[1][1])
    );
    
    processing_element pe_1_2 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[1][1]),
        .data_out(data_internal[1][2]),
        .sum_in(sum_internal[0][2]),
        .sum_out(sum_internal[1][2]),
        .fixed_weight(weights[1][2]),
        .pe_activity(pe_activity[1][2])
    );
    
    processing_element pe_1_3 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[1][2]),
        .data_out(row_data_out[1]),
        .sum_in(sum_internal[0][3]),
        .sum_out(sum_internal[1][3]),
        .fixed_weight(weights[1][3]),
        .pe_activity(pe_activity[1][3])
    );
    
    // Row 2
    processing_element pe_2_0 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(row_data_in[2]),
        .data_out(data_internal[2][0]),
        .sum_in(sum_internal[1][0]),
        .sum_out(sum_internal[2][0]),
        .fixed_weight(weights[2][0]),
        .pe_activity(pe_activity[2][0])
    );
    
    processing_element pe_2_1 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[2][0]),
        .data_out(data_internal[2][1]),
        .sum_in(sum_internal[1][1]),
        .sum_out(sum_internal[2][1]),
        .fixed_weight(weights[2][1]),
        .pe_activity(pe_activity[2][1])
    );
    
    processing_element pe_2_2 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[2][1]),
        .data_out(data_internal[2][2]),
        .sum_in(sum_internal[1][2]),
        .sum_out(sum_internal[2][2]),
        .fixed_weight(weights[2][2]),
        .pe_activity(pe_activity[2][2])
    );
    
    processing_element pe_2_3 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[2][2]),
        .data_out(row_data_out[2]),
        .sum_in(sum_internal[1][3]),
        .sum_out(sum_internal[2][3]),
        .fixed_weight(weights[2][3]),
        .pe_activity(pe_activity[2][3])
    );
    
    // Row 3
    processing_element pe_3_0 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(row_data_in[3]),
        .data_out(data_internal[3][0]),
        .sum_in(sum_internal[2][0]),
        .sum_out(col_sum_out[0]),
        .fixed_weight(weights[3][0]),
        .pe_activity(pe_activity[3][0])
    );
    
    processing_element pe_3_1 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[3][0]),
        .data_out(data_internal[3][1]),
        .sum_in(sum_internal[2][1]),
        .sum_out(col_sum_out[1]),
        .fixed_weight(weights[3][1]),
        .pe_activity(pe_activity[3][1])
    );
    
    processing_element pe_3_2 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[3][1]),
        .data_out(data_internal[3][2]),
        .sum_in(sum_internal[2][2]),
        .sum_out(col_sum_out[2]),
        .fixed_weight(weights[3][2]),
        .pe_activity(pe_activity[3][2])
    );
    
    processing_element pe_3_3 (
        .clk(clk), .rst(rst), .enable(enable),
        .data_in(data_internal[3][2]),
        .data_out(row_data_out[3]),
        .sum_in(sum_internal[2][3]),
        .sum_out(col_sum_out[3]),
        .fixed_weight(weights[3][3]),
        .pe_activity(pe_activity[3][3])
    );
    
endmodule
