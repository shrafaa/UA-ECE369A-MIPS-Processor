`timescale 1ns / 1ps



module ID_EX_reg(

    input clk, rst, controlMux,
    
    // New PC Address
    input [31:0] PCplus4_IFID,
    input [25:0] target,
    
    // Control Signals
    input RegWrite, jump, RegDst, Branch, MemWrite, MemRead, MemToReg, jr, jal, shift,
    input [1:0] ALUSrc, store, load,
    input [5:0] ALUOp,
    
    // Register File Outputs
    input [31:0] ReadData1, ReadData2,
    
    // Sign Extension Output
    input [31:0] imm32,
    
    // Potential Write Register Addresses
    input [4:0] rs, rt, rd,
    
    // Next Stage New PC Address
    output reg [31:0] PCplus4_IDEX,
    output reg [25:0] target_IDEX,
    
    // Next Stage control signals
    output reg RegWrite_IDEX, jump_IDEX, RegDst_IDEX, Branch_IDEX, MemWrite_IDEX, MemRead_IDEX, MemToReg_IDEX, jr_IDEX, jal_IDEX, shift_IDEX,
    output reg [1:0] ALUSrc_IDEX, store_IDEX, load_IDEX,
    output reg [5:0] ALUOp_IDEX,
    
    // Next Stage Register File Outputs
    output reg [31:0] ReadData1_IDEX, ReadData2_IDEX,
    
    // Next Stage Sign Extension Outputs
    output reg [31:0] imm32_IDEX,
    
    // Next Stage Potential Write Register Addresses
    output reg [4:0] rs_IDEX, rt_IDEX, rd_IDEX

    );
    
    always @(posedge clk) begin
    
        if (rst) begin
            
            // Control Signals
            RegWrite_IDEX <= 0;
            jump_IDEX <= 0;
            RegDst_IDEX <= 0;
            Branch_IDEX <= 0;
            MemWrite_IDEX <= 0;
            MemRead_IDEX <= 0;
            MemToReg_IDEX <= 0;
            jr_IDEX <= 0;
            jal_IDEX <= 0;
            shift_IDEX <= 0;
            ALUSrc_IDEX <= 0;
            store_IDEX <= 0;
            load_IDEX <= 0;
            ALUOp_IDEX <= 0;
            
            // Register File Outputs
            ReadData1_IDEX <= 0;
            ReadData2_IDEX <= 0;
            
            // Sign Extension Outputs
            imm32_IDEX <= 0;
            
            // Potential Write Register Addresses
            rs_IDEX <= 0;
            rt_IDEX <= 0;
            rd_IDEX <= 0;
            
            // New PC Address
            PCplus4_IDEX <= 0;
            target_IDEX <= 0;
        
        end
        
        else begin
            
            if (controlMux) begin
                RegWrite_IDEX <= 0;
                jump_IDEX <= 0;
                RegDst_IDEX <= 0;
                Branch_IDEX <= 0;
                MemWrite_IDEX <= 0;
                MemRead_IDEX <= 0;
                MemToReg_IDEX <= 0;
                jr_IDEX <= 0;
                jal_IDEX <= 0;
                shift_IDEX <= 0;
                ALUSrc_IDEX <= 0;
                store_IDEX <= 0;
                load_IDEX <= 0;
                ALUOp_IDEX <= 0;
            end
            else begin
                RegWrite_IDEX <= RegWrite;
                jump_IDEX <= jump;
                RegDst_IDEX <= RegDst;
                Branch_IDEX <= Branch;
                MemWrite_IDEX <= MemWrite;
                MemRead_IDEX <= MemRead;
                MemToReg_IDEX <= MemToReg;
                jr_IDEX <= jr;
                jal_IDEX <= jal;
                shift_IDEX <= shift;
                ALUSrc_IDEX <= ALUSrc;
                store_IDEX <= store;
                load_IDEX <= load;
                ALUOp_IDEX <= ALUOp;
            end
            // Register File Outputs
            ReadData1_IDEX <= ReadData1;
            ReadData2_IDEX <= ReadData2;
            
            // Sign Extension Outputs
            imm32_IDEX <= imm32;
            
            // Potential Write Register Addresses
            rs_IDEX <= rs;
            rt_IDEX <= rt;
            rd_IDEX <= rd;
            
            // New PC Address
            PCplus4_IDEX <= PCplus4_IFID;
            target_IDEX <= target;
        
        end    
    
    end
    
endmodule
