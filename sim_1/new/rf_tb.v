`timescale 1ns / 1ps

module rf_tb(

    );
    
    reg [4:0] A, B;
    reg [4:0] C;
    reg [31:0] Cdata;
    reg sel;
    reg clk;
    wire [31:0] Adata, Bdata;
    
    rf a (A, B, C, Cdata, sel, clk, Adata, Bdata);
    
    initial begin
        clk <= 1;
        forever #20 clk <= ~clk;
    end
    
    initial begin
    
        sel <= 1;
        
        C <= 5'd0;
        Cdata <= 32'd10;
        
        A <= 5'd0;
        B <= 5'd10;
        
    end
    
endmodule
