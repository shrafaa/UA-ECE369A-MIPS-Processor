`timescale 1ns / 1ps

module ID_EX_regLab6(

    input clk,
    input rst,
    
    input zeroSignals,
    
    input [31:0] PCplus4_IFID,
    
    input [31:0] ReadData1,
    input [31:0] ReadData2,
    input [31:0] imm32,
    
    input [31:0] BranchAddress,
    input [31:0] JumpAddress,
    
    input RegWrite,
    input jump,
    input RegDst,
    input branch,
    input MemWrite,
    input MemRead,
    input MemToReg,
    input jr,
    input jal,
    input shift,
    input [5:0] ALUOp,
    input [1:0] load,
    input [1:0] store,
    input [1:0] ALUSrc,
    
    input [4:0] rt,
    input [4:0] rd,
    
    output reg [31:0] PCplus4_IDEX,
    
    output reg [31:0] ReadData1_IDEX,
    output reg [31:0] ReadData2_IDEX,
    output reg [31:0] imm32_IDEX,
    
    output reg [31:0] BranchAddress_IDEX,
    output reg [31:0] JumpAddress_IDEX,
    
    output reg RegWrite_IDEX,
    output reg jump_IDEX,
    output reg RegDst_IDEX,
    output reg branch_IDEX,
    output reg MemWrite_IDEX,
    output reg MemRead_IDEX,
    output reg MemToReg_IDEX,
    output reg jr_IDEX,
    output reg jal_IDEX,
    output reg shift_IDEX,
    output reg [5:0] ALUOp_IDEX,
    output reg [1:0] load_IDEX,
    output reg [1:0] store_IDEX,
    output reg [1:0] ALUSrc_IDEX,
    
    output reg [4:0] rt_IDEX,
    output reg [4:0] rd_IDEX
    
    );
    
    always @(posedge clk) begin
        
        if (rst) begin
            ReadData1_IDEX <= 0;
            ReadData2_IDEX <= 0;
            imm32_IDEX <= 0;
            
            BranchAddress_IDEX <= 0;
            JumpAddress_IDEX <= 0;
            
            RegWrite_IDEX <= 0;
            jump_IDEX <= 0;
            RegDst_IDEX <= 0;
            branch_IDEX <= 0;
            MemWrite_IDEX <= 0;
            MemRead_IDEX <= 0;
            MemToReg_IDEX <= 0;
            jr_IDEX <= 0;
            jal_IDEX <= 0;
            shift_IDEX <= 0;
            ALUOp_IDEX <= 0;
            load_IDEX <= 0;
            store_IDEX <= 0;
            ALUSrc_IDEX <= 0;
            
            rt_IDEX <= 0;
            rd_IDEX <= 0;
        end
        else begin
        
            ReadData1_IDEX <= ReadData1;
            ReadData2_IDEX <= ReadData2;
            imm32_IDEX <= imm32;
            
            BranchAddress_IDEX <= BranchAddress;
            JumpAddress_IDEX <= JumpAddress;
            
            rt_IDEX <= rt;
            rd_IDEX <= rd;
        
            if (zeroSignals) begin
                RegWrite_IDEX <= 0;
                jump_IDEX <= 0;
                RegDst_IDEX <= 0;
                branch_IDEX <= 0;
                MemWrite_IDEX <= 0;
                MemRead_IDEX <= 0;
                MemToReg_IDEX <= 0;
                jr_IDEX <= 0;
                jal_IDEX <= 0;
                shift_IDEX <= 0;
                ALUOp_IDEX <= 0;
                load_IDEX <= 0;
                store_IDEX <= 0;
                ALUSrc_IDEX <= 0;
            end
            else begin
                RegWrite_IDEX <= RegWrite;
                jump_IDEX <= jump;
                RegDst_IDEX <= RegDst;
                branch_IDEX <= branch;
                MemWrite_IDEX <= MemWrite;
                MemRead_IDEX <= MemRead;
                MemToReg_IDEX <= MemToReg;
                jr_IDEX <= jr;
                jal_IDEX <= jal;
                shift_IDEX <= shift;
                ALUOp_IDEX <= ALUOp;
                load_IDEX <= load;
                store_IDEX <= store;
                ALUSrc_IDEX <= ALUSrc;
            end
        end
        
    end
    
endmodule