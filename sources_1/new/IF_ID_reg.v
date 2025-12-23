`timescale 1ns / 1ps


module IF_ID_reg(

    input clk, rst,
    
    input [31:0] PCplus4,
    
    input [31:0] Instruction,
    
    output reg [31:0] PCplus4_IFID,
    
    output reg [31:0] Instruction_IFID

    );
    
    always @(posedge clk) begin
    
        if (rst) begin
        
            PCplus4_IFID <= 0;
            Instruction_IFID <= 0;
        
        end
        
        else begin
        
            PCplus4_IFID <= PCplus4;
            Instruction_IFID <= Instruction;
        
        end
    
    end
    
    
endmodule
