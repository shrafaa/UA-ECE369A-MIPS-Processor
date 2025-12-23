`timescale 1ns / 1ps


module ProgramCounterLab6(

    input [31:0] Address,
    input rst, clk,
    
    input PCWrite,
    
    output reg [31:0] PCResult
    
    );
    
    always @(posedge clk) begin
    
        if (rst) begin
            PCResult <= 0;
        end
        
        else begin
            if (PCWrite) begin
                PCResult <= Address;
            end
        end
 
    end
    
endmodule
