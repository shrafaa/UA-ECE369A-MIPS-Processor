`timescale 1ns / 1ps


module ProgramCounter(Address, PCResult, Reset, Clk);

	input [31:0] Address;
	input Reset, Clk;

	output reg [31:0] PCResult;
 
    always @(posedge Clk) begin
        if (Reset) begin
            PCResult <= 0; end
        else
            PCResult <= Address;
        end
    
endmodule