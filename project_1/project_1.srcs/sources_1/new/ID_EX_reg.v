`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:57:02 PM
// Design Name: 
// Module Name: ID_EX_reg
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


module ID_EX_reg(Clk,Rst,PC_in,PC_out,ReadData1_in,ReadData1_out,ReadData2_in,ReadData2_out,SignExt_in,SignExt_out,RegWrite_in,RegWrite_out,ALUsrc_in,ALUsrc_out,
ALUOp_in,ALUOp_out,RegDest_in,RegDest_out,MemWrite_in,MemWrite_out,MemRead_in,MemRead_out,MemToReg_in,MemToReg_out, Branch_in, Branch_out,Instr20_16_in,Instr20_16_out, 
Instr15_11_in,Instr15_11_out, Instr26bit_in, Instr26bit_out, ra_in, ra_out, jr_in, jr_out, jump_target_in,jump_target_out,load_in,load_out,store_in,store_out,jal_in,jal_out,shift_mux_in, shift_mux_out);
    
    input Clk,Rst;
    input [31:0] PC_in, ReadData1_in, ReadData2_in, SignExt_in;
    input RegWrite_in, RegDest_in, MemWrite_in, MemRead_in,MemToReg_in,Branch_in;
    input[5:0] ALUOp_in;
    input[4:0] Instr20_16_in, Instr15_11_in;
    input [25:0] Instr26bit_in;
    input ra_in,jr_in,jump_target_in,jal_in;
    input [1:0] load_in,store_in,ALUsrc_in;
    input shift_mux_in;
    
    output reg [31:0] PC_out, ReadData1_out, ReadData2_out, SignExt_out;
    output reg RegWrite_out, RegDest_out, MemWrite_out, MemRead_out,MemToReg_out,Branch_out, shift_mux_out;
    output reg [5:0] ALUOp_out;
    output reg [4:0] Instr20_16_out, Instr15_11_out;
    output reg [25:0] Instr26bit_out;
    output reg ra_out,jr_out,jump_target_out,jal_out;
    output reg [1:0] load_out,store_out,ALUsrc_out;
    
    /* reg [31:0] PC_reg, ReadData1_reg, ReadData2_reg, SignExt_reg;
    reg RegWrite_reg, ALUsrc_reg, RegDest_reg, MemWrite_reg, MemRead_reg,MemToReg_reg,Branch_reg;
    reg [5:0] ALUOp_reg;
    reg [4:0] Instr20_16_reg, Instr15_11_reg;
    reg [25:0] Instr26bit_reg; */


    always @(posedge Clk)begin
        if (Rst) begin
            PC_out<=32'b0;
            ReadData1_out<=32'b0;
            ReadData2_out<=32'b0;
            SignExt_out<=32'b0;
            RegWrite_out<=0;
            ALUsrc_out<=0;
            RegDest_out<=0;
            MemWrite_out<=0;
            MemRead_out<=0;
            MemToReg_out<=0;
            Branch_out<=0;
            ALUOp_out<=6'b0;
            Instr20_16_out<=5'b0;
            Instr15_11_out<=5'b0;
            Instr26bit_out<=26'b0;
            ra_out<=0;
            jr_out<=0;
            jump_target_out<=0;
            load_out<=0;
            store_out<=0;
            jal_out<=0;
            shift_mux_out <=0;
        end
        else begin
            PC_out<=PC_in;
            ReadData1_out<=ReadData1_in;
            ReadData2_out<=ReadData2_in;
            SignExt_out<=SignExt_in;
            RegWrite_out<=RegWrite_in;
            ALUsrc_out<=ALUsrc_in;
            RegDest_out<=RegDest_in;
            MemWrite_out<=MemWrite_in;
            MemRead_out<=MemRead_in;
            MemToReg_out<=MemToReg_in;
            Branch_out<=Branch_in;
            ALUOp_out<=ALUOp_in;
            Instr20_16_out<=Instr20_16_in;
            Instr15_11_out<=Instr15_11_in;
            Instr26bit_out<=Instr26bit_in;
            ra_out<=ra_in;
            jr_out<=jr_in;
            jump_target_out<=jump_target_in;
            load_out<=load_in;
            store_out<=store_in;
            jal_out<=jal_in;
            shift_mux_out <= shift_mux_in;
        end
    end
    
   /* always @(negedge Clk)begin
        PC_out<=PC_reg;
        ReadData1_out<=ReadData1_reg;
        ReadData2_out<=ReadData2_reg;
        SignExt_out<=SignExt_reg;
        RegWrite_out<=RegWrite_reg;
        ALUsrc_out<=ALUsrc_reg;
        RegDest_out<=RegDest_reg;
        MemWrite_out<=MemWrite_reg;
        MemRead_out<=MemRead_reg;
        MemToReg_out<=MemToReg_reg;
        Branch_out<=Branch_reg;
        ALUOp_out<=ALUOp_reg;
        Instr20_16_out<=Instr20_16_reg;
        Instr15_11_out<=Instr15_11_reg;
        Instr26bit_out<=Instr26bit_reg;
    end */

endmodule