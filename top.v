`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Top-Level Module for Systolic Array Visualization
// Educational Demo for Digilent Nexys A7 100T
// 
// This module connects the systolic array to board I/O:
// - Switches: Input data selection
// - Buttons: Reset and Enable
// - LEDs: PE activity visualization
//////////////////////////////////////////////////////////////////////////////////

module top (
    input wire clk,           // 100MHz system clock
    input wire btn_cpu_rst,   // Center button (reset)
    input wire btn_up,        // Up button (enable/step)
    
    // Slide switches for input data
    input wire [15:0] sw,
    
    // LEDs for visualization
    output wire [15:0] led,   // PE activity (simplified)
    output wire [7:0] an,     // Anode control (disabled)
    output wire [7:0] dp,     // Decimal points (disabled)
    output wire [6:0] seg     // 7-segment display (unused)
    );
    
    // Clock divider for slow demonstration (100MHz -> ~10Hz)
    reg [24:0] clk_div = 25'd0;
    wire slow_clk = clk_div[24];
    
    always @(posedge clk) begin
        clk_div <= clk_div + 25'd1;
    end
    
    // Synchronize buttons
    reg btn_rst_sync = 1'b0;
    reg btn_en_sync = 1'b0;
    
    always @(posedge slow_clk) begin
        btn_rst_sync <= btn_cpu_rst;
        btn_en_sync <= btn_up;
    end
    
    // Internal signals
    wire [7:0] row_data_in [3:0];
    wire [7:0] row_data_out [3:0];
    wire [15:0] col_sum_out [3:0];
    wire [7:0] pe_activity [3:0][3:0];
    
    // Map switches to input data (4 inputs, 8 bits each)
    assign row_data_in[0] = sw[7:0];
    assign row_data_in[1] = sw[15:8];
    assign row_data_in[2] = sw[7:0];   // Reuse for demo
    assign row_data_in[3] = sw[15:8];  // Reuse for demo
    
    // Instantiate systolic array
    systolic_array u_systolic (
        .clk(slow_clk),
        .rst(btn_rst_sync),
        .enable(btn_en_sync),
        .row_data_in(row_data_in),
        .row_data_out(row_data_out),
        .col_sum_out(col_sum_out),
        .pe_activity(pe_activity)
    );
    
    // Simplified LED output (show first 4 PEs activity as example)
    // In real demo, you could multiplex or use more LEDs
    assign led[3:0] = pe_activity[0][0][3:0];
    assign led[7:4] = pe_activity[0][1][3:0];
    assign led[11:8] = pe_activity[1][0][3:0];
    assign led[15:12] = pe_activity[1][1][3:0];
    
    // Disable displays
    assign an = 8'b11111111;
    assign dp = 8'b11111111;
    assign seg = 7'b0000000;
    
endmodule
