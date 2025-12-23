`timescale 1ns / 1ps


module EX_MEM_reg(

    input clk, rst,
    
    // New PC Addresses Inputs
    input [31:0] BranchingAddress, ReadData1_IDEX, JumpAddr,
    
    // Control Signals Inputs
    input Zero, jump_IDEX, jr_IDEX, branch_IDEX, MemRead_IDEX, MemWrite_IDEX, jal_IDEX, RegWrite_IDEX, MemToReg_IDEX,
    input [1:0] store_IDEX, load_IDEX,
    
    // Write Content Inputs
    input [31:0] PCplus4_IDEX, ALUResult, ReadData2_IDEX,
    
    // Write Address
    input [4:0] RegDstMuxOutput,
    
    // New PC Addresses Outputs
    output reg [31:0] BranchingAddress_EXMEM, ReadData1_EXMEM, JumpAddr_EXMEM,
    
    // Control Signals Outputs
    output reg Zero_EXMEM, jump_EXMEM, jr_EXMEM, branch_EXMEM, MemRead_EXMEM, MemWrite_EXMEM, jal_EXMEM, RegWrite_EXMEM, MemToReg_EXMEM,
    output reg [1:0] store_EXMEM, load_EXMEM,
    
    // Write Content Outputs
    output reg [31:0] PCplus4_EXMEM, ALUResult_EXMEM, ReadData2_EXMEM,
    
    // Write Address
    output reg [4:0] RegDstMuxOutput_EXMEM
    
    );
    
    always @(posedge clk) begin
    
        if (rst) begin
        
            BranchingAddress_EXMEM <= 0;
            ReadData1_EXMEM <= 0;
            JumpAddr_EXMEM <= 0;
            
            Zero_EXMEM <= 0;
            jump_EXMEM <= 0;
            jr_EXMEM <= 0;
            branch_EXMEM <= 0;
            MemRead_EXMEM <= 0;
            MemWrite_EXMEM <= 0;
            jal_EXMEM <= 0;
            RegWrite_EXMEM <= 0;
            MemToReg_EXMEM <= 0;
            store_EXMEM <= 0;
            load_EXMEM <= 0;
            
            PCplus4_EXMEM <= 0;
            ALUResult_EXMEM <= 0;
            ReadData2_EXMEM <= 0;
                        
            RegDstMuxOutput_EXMEM <= 0;
            
        end
        
        else begin
        
            BranchingAddress_EXMEM <= BranchingAddress;
            ReadData1_EXMEM <= ReadData1_IDEX;
            JumpAddr_EXMEM <= JumpAddr;
            
            Zero_EXMEM <= Zero;
            jump_EXMEM <= jump_IDEX;
            jr_EXMEM <= jr_IDEX;
            branch_EXMEM <= branch_IDEX;
            MemRead_EXMEM <= MemRead_IDEX;
            MemWrite_EXMEM <= MemWrite_IDEX;
            jal_EXMEM <= jal_IDEX;
            RegWrite_EXMEM <= RegWrite_IDEX;
            MemToReg_EXMEM <= MemToReg_IDEX;
            store_EXMEM <= store_IDEX;
            load_EXMEM <= load_IDEX;
            
            PCplus4_EXMEM <= PCplus4_IDEX;
            ALUResult_EXMEM <= ALUResult;
            ReadData2_EXMEM <= ReadData2_IDEX;
            
            RegDstMuxOutput_EXMEM <= RegDstMuxOutput;
            
        end
    
    end
    
endmodule

