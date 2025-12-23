`timescale 1ns / 1ps

module Hazard(

    input [4:0] rs,
    input [4:0] rt,
    input [4:0] FinalRegDst,
    input [4:0] FinalRegDst_EXMEM,
    input PCSrc,
    input jump,
    input jr,
    input branch,
    input branch_IDEX,
    input branch_EXMEM,
    input confirmBranching,
    input RegWrite_IDEX,
    input RegWrite_EXMEM,
    
    output reg zeroSignals,
    output reg PCWrite,
    output reg IFIDWrite,
    output reg flush,
    output reg [2:0] test

    );
    
    always @(*) begin
    
        zeroSignals = 0;
        PCWrite = 1;
        IFIDWrite = 1;
        flush = 0;
        test = 3'b110;
    
        if (PCSrc || jump || jr) begin
            zeroSignals = 0;
            PCWrite = 1;
            IFIDWrite = 0;
            flush = 0;
            test = 3'b000;
        end
        
        else if (branch && (RegWrite_IDEX || RegWrite_EXMEM)) begin
            zeroSignals = 1;
            PCWrite = 0;
            IFIDWrite = 0;
            flush = 0;
            test = 3'b001;
        end
        
        else if (branch_IDEX) begin
            zeroSignals = 1;
            PCWrite = 0;
            IFIDWrite = 0;
            if (confirmBranching) begin
                flush = 1;
            end
            else begin
                flush = 0;
            end
            test = 3'b010; // 2
        end
        
        else if (rs == FinalRegDst || rt == FinalRegDst)begin
            zeroSignals = 1;
            PCWrite = 0;
            IFIDWrite = 0;
            flush = 0;
            test = 3'b011;
        end
    
        else if (rs == FinalRegDst_EXMEM || rt == FinalRegDst_EXMEM)begin
            zeroSignals = 1;
            PCWrite = 0;
            IFIDWrite = 0;
            flush = 0;
            test = 3'b100;
        end
    
    end
    
endmodule
