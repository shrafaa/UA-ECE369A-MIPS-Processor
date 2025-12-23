`timescale 1ns / 1ps


module PCSrcGenerator(
    
    input [31:0] ReadData1, ReadData2, imm32,
    
    input [1:0] ALUSrc,
    
    input branch,
    
    input [5:0] ALUOp,
    
    output reg PCSrc
    
    );
    
    
    reg [31:0] B;
    reg [31:0] Result;
    reg zero;
    
    always @(*) begin
    
        if (ALUSrc == 2'b00) begin
            B <= ReadData2;
        end
        else begin
            B <= imm32;
        end
    
        case(ALUOp)
        
            6'b100010: begin // beq  
            Result <= (ReadData1 - B); end
            6'b001000: begin // bgez  
            Result <= (ReadData1 < 0); end
            6'b001001: begin // bne 
            Result <= (ReadData1 == B); end
            6'b001010: begin // blez
            Result <= (ReadData1 > 0); end
            6'b001011: begin // bltz
            Result <= (ReadData1 >= 1); end
            6'b001111: begin // bgtz  
            Result <= (ReadData1 <= 0); end
        
            default:begin
                Result <= 32'bX; end
        
        endcase
        
        zero <= (Result == 0) ? 1 : 0;
        
        PCSrc <= zero & branch;
    
    end
    
    
    
endmodule
