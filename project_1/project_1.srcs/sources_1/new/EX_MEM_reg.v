`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:03:13 PM
// Design Name: 
// Module Name: EX_MEM_reg
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


module EX_MEM_reg(Clk,Rst,PC_in, PC_out, jr_in,jr_out,Branch_in,Branch_out,MemWrite_in,MemWrite_out,MemRead_in,MemRead_out,RegWrite_in,RegWrite_out,
MemToReg_in,MemToReg_out,AddResult_in,AddResult_out,Zero_in,Zero_out,ALUResult_in,ALUResult_out,MUXResult_in,MUXResult_out,ReadData1_in,ReadData1_out,ReadData2_in,ReadData2_out,
ra_in, ra_out,load_in,load_out,store_in,store_out,jal_in,jal_out);

    input Clk,Rst;
    input [31:0]PC_in;
    input Branch_in,MemWrite_in,MemRead_in,RegWrite_in,MemToReg_in,Zero_in;
    input[31:0] AddResult_in,ALUResult_in,ReadData1_in, ReadData2_in;
    input [4:0] MUXResult_in;
    input ra_in,jal_in,jr_in;
    input [1:0] load_in,store_in;
    
    output reg Branch_out,MemWrite_out,MemRead_out,RegWrite_out,MemToReg_out,Zero_out;
    output reg [31:0] AddResult_out,ALUResult_out,ReadData1_out,ReadData2_out, PC_out;
    output reg [4:0] MUXResult_out;
    output reg ra_out,jal_out,jr_out;
    output reg [1:0] load_out,store_out;
    
   /* reg Branch_reg,MemWrite_reg,MemRead_reg,RegWrite_reg,MemToReg_reg,Zero_reg;
    reg [31:0] AddResult_reg,ALUResult_reg,ReadData2_reg;
    reg [4:0] MUXResult_reg;  */
    
    always @(posedge Clk) begin
        if (Rst) begin
            Branch_out<=0;
            MemWrite_out<=0;
            MemRead_out<=0;
            RegWrite_out<=0;
            MemToReg_out<=0;
            Zero_out<=0;
            AddResult_out<=32'b0;
            ALUResult_out<=32'b0;
            ReadData1_out<=32'b0;
            ReadData2_out<=32'b0;
            MUXResult_out<=5'b0;
            ra_out<=0;
            jr_out<=0;
            load_out<=0;
            store_out<=0;
            jal_out<=0;
            PC_out <= 32'b0;
        end
        else begin
            Branch_out<=Branch_in;
            MemWrite_out<=MemWrite_in;
            MemRead_out<=MemRead_in;
            RegWrite_out<=RegWrite_in;
            MemToReg_out<=MemToReg_in;
            Zero_out<=Zero_in;
            AddResult_out<=AddResult_in;
            ALUResult_out<=ALUResult_in;
            ReadData1_out<=ReadData1_in;
            ReadData2_out<=ReadData2_in;
            MUXResult_out<=MUXResult_in;
            ra_out<=ra_in;
            load_out<=load_in;
            store_out<=store_in;
            jal_out<=jal_in;
            jr_out<=jr_in;
            PC_out <= PC_in;
        end
    end
    
  /*  always @(negedge Clk) begin
        Branch_out<=Branch_reg;
        MemWrite_out<=MemWrite_reg;
        MemRead_out<=MemRead_reg;
        RegWrite_out<=RegWrite_reg;
        MemToReg_out<=MemToReg_reg;
        Zero_out<=Zero_reg;
        AddResult_out<=AddResult_reg;
        ALUResult_out<=ALUResult_reg;
        ReadData2_out<=ReadData2_reg;
        MUXResult_out<=MUXResult_reg;
    end */
   
endmodule
