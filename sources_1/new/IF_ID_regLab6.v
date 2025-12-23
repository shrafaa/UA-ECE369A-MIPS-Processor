`timescale 1ns / 1ps


module IF_ID_regLab6(

    input clk, rst,
    
    input [31:0] PCplus4,
    
    input [31:0] Instruction,
    
    input IFIDWrite,
    
    input flush,
    
    output reg [31:0] PCplus4_IFID,
    
    output reg [31:0] Instruction_IFID

    );
    
    always @(posedge clk) begin
    
        if (rst || flush) begin
        
            PCplus4_IFID <= 0;
            Instruction_IFID <= 0;
        
        end
        
        else if (IFIDWrite) begin
        
                PCplus4_IFID <= PCplus4;
                Instruction_IFID <= Instruction;
        
        end
    
    end
    
endmodule
