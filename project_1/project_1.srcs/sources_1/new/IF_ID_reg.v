`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:54:11 PM
// Design Name: 
// Module Name: IF_ID_reg
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


module IF_ID_reg(Clk,Rst,PC_in,PC_out,Instr_in,Instr_out);
    input Clk, Rst;
    input [31:0] PC_in;
    input [31:0] Instr_in;
    output reg [31:0] PC_out;
    output reg [31:0] Instr_out;
    
   /* reg [31:0] PC_reg;
    reg [31:0] Instr_reg; */
    
    always @(posedge Clk)begin
        if (Rst) begin
            PC_out <= 32'b0;
            Instr_out <= 32'b0;
        end
        else begin
            PC_out<=PC_in;
            Instr_out<=Instr_in;
        end
     end
     
   /*   always @(negedge Clk)begin
        if (Rst) begin
            PC_out <= 32'b0;
            Instr_out <= 32'b0;
        end
        else begin
            PC_out<=PC_reg;
            Instr_out<=Instr_reg;
        end
        
     end */
        
endmodule
