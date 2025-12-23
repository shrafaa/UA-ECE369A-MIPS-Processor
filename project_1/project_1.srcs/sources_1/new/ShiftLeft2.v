`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:01:15 PM
// Design Name: 
// Module Name: ShiftLeft2
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


module ShiftLeft2(Shift_in,Shift_out);
    input [31:0] Shift_in;
    output reg [31:0] Shift_out;
    
    always @(*) begin
        Shift_out <= Shift_in << 2;
    end
    
endmodule
