`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:51:52 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(Address, PCResult, Reset, Clk);

	input [31:0] Address;
	input Reset, Clk;

	output reg [31:0] PCResult;
 
    /* Please fill in the implementation here... */
    always @(posedge Clk) begin //sequential based on clock signal
    if (Reset) begin
    PCResult <= 0; end //Result goes back to original address
    else
    PCResult <= Address;
    end
    
endmodule
