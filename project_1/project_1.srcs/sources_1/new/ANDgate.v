`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:03:52 PM
// Design Name: 
// Module Name: ANDgate
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


module ANDgate(Branch, zero, out);
    input Branch, zero; 
    output reg out;
    
    always @(*) begin
    if (Branch == 1 && zero == 1) begin
        out = 1; end
    else begin
        out = 0; end
        end
        
     
   
endmodule
