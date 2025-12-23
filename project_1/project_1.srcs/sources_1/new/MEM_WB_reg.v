`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:05:07 PM
// Design Name: 
// Module Name: MEM_WB_reg
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


module MEM_WB_reg(Clk,Rst,RegWrite_in,RegWrite_out,MemToReg_in,MemToReg_out,MemData_in,MemData_out,
MUXResult_in,MUXResult_out,RegDestResult_in,RegDestResult_out,ra_in, ra_out);
    input Clk,Rst;
    input RegWrite_in,MemToReg_in;
    input [31:0] MemData_in, MUXResult_in;
    input [4:0] RegDestResult_in;
    input ra_in;
    
    output reg RegWrite_out, MemToReg_out;
    output reg [31:0] MemData_out, MUXResult_out;
    output reg [4:0] RegDestResult_out;
    output reg ra_out;
    
    always @(posedge Clk) begin
        if (Rst) begin
            RegWrite_out<=0;
            MemToReg_out<=0;
            MemData_out<=32'b0;
            RegDestResult_out<=5'b0;
            MUXResult_out<=32'b0;
            ra_out<=0;
        end
        else begin
            RegWrite_out<=RegWrite_in;
            MemToReg_out<=MemToReg_in;
            MemData_out<=MemData_in;
            RegDestResult_out<=RegDestResult_in;
            MUXResult_out<=MUXResult_in;
            ra_out<=ra_in;
        end
        
    end



endmodule