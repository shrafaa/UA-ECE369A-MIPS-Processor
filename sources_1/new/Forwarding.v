`timescale 1ns / 1ps

module Forwarding(

    input RegWrite_EXMEM,
    input RegWrite_MEMWB,
    
    input [4:0] rd_EXMEM,
    input [4:0] rd_MEMWB,
    
    input [4:0] rs_IDEX,
    input [4:0] rt_IDEX,
    
    output reg [1:0] A,
    output reg [1:0] B

    );
    
    
    always @(*) begin
    
        A = 0;
        B = 0;
    
        // Forward from memory to execution input 1
        if (RegWrite_EXMEM && (rd_EXMEM != 0) && (rd_EXMEM == rs_IDEX)) begin
            A = 1;
        end
        
        // Forward from write back to execution input 1
        else if (RegWrite_MEMWB && (rd_MEMWB != 0) && (rd_MEMWB == rs_IDEX)) begin
            A = 2;
        end
        
        // Forward from memory to execution input 1
        if (RegWrite_EXMEM && (rd_EXMEM != 0) && (rd_EXMEM == rt_IDEX)) begin
            B = 1;
        end
        
        // Forward from write back to execution input 2
        else if (RegWrite_MEMWB && (rd_MEMWB != 0) && (rd_MEMWB == rt_IDEX)) begin
            B = 2;
        end
    
    end
    
    
endmodule
