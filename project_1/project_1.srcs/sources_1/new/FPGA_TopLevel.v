`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 09:53:55 PM
// Design Name: 
// Module Name: FPGA_TopLevel
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

module FPGA_TopLevel(Clk, Reset, out7, en_out);
input Clk;
input Reset;
output [6:0] out7;
output [7:0] en_out;
wire Clkout;
wire [31:0] PCValue, WriteData;


Two4DigitDisplay s(Clk,PCValue[15:0],WriteData[15:0],out7,en_out);
TopLevel a(Clkout, Reset, PCValue, WriteData);
ClkDiv r(Clk, 1'b0, Clkout);

endmodule

