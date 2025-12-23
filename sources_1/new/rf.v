`timescale 1ns / 1ps


module rf(

    input [4:0] A, B,
    
    input [4:0] C,
    
    input [31:0] Cdata,
    
    input sel,
    
    input clk,
    
    output reg [31:0] Adata, Bdata

    );
    
    reg [31:0] Registers [31:0];
    integer i;
    
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            Registers[i] = 0;
        end
    end
    
    always @(posedge clk) begin
    
        if (sel) begin
            Registers[C] <= Cdata;
        end
    
    end
    
    always @(negedge clk) begin
    
        Adata <= Registers[A];
        Bdata <= Registers[B];
    
    end
    
endmodule
