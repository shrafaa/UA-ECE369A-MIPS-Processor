`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 09:43:42 PM
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(Clk, Rst, ClkOut);
   input Clk, Rst;
   output reg ClkOut;
  //to create 1 Hz clock from 100-MHz on the board
  parameter DivVal = 50000000;  
   reg [25:0] DivCnt;
   reg ClkInt;
	
   always @(posedge Clk) begin
      if( Rst == 1 )begin
         DivCnt <= 0;
         ClkOut <= 0;
         ClkInt <= 0;
      end
      else begin
         if( DivCnt == DivVal ) begin
            	ClkOut <= ~ClkInt;
            	ClkInt <= ~ClkInt;
            	DivCnt <= 0;
         end
         else begin
            	ClkOut <= ClkInt;
            	ClkInt <= ClkInt;
            	DivCnt <= DivCnt + 1;
         end
      end
   end
endmodule
