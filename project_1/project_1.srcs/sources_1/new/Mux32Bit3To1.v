`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:00:26 PM
// Design Name: 
// Module Name: Mux32Bit3To1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux32Bit3To1(out, inA, inB, inC, sel);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [1:0] sel;

    /* Fill in the implementation here ... */ 
    always @(sel, inA, inB, inC) begin
    if (sel == 0) begin
    out <= inA; end
    else if (sel == 1) begin
    out <= inB; end
    else if (sel == 2) begin
    out <= inC; end
    end

endmodule
