`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 08:29:51 AM
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(

    input clk, rst,
    
    input [31:0] PCResult_IDEX,
    
    output reg [31:0] PCResult_EXMEM

    );
    
    
    always @(posedge clk) begin
    
        if (rst) begin
        
            PCResult_EXMEM <= 0;
            
        end
        
        else begin
        
            PCResult_EXMEM <= PCResult_IDEX;
            
        end
    
    end
    
    
endmodule
