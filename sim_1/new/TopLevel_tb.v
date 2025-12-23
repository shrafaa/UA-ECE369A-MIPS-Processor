`timescale 1ns / 1ps


module TopLevel_tb();

    reg rst, clk;
    
    wire [31:0] PCValue;
    
    wire [31:0] WriteData;
    
    TopLevel toplevel (clk, rst, PCValue, WriteData);
    
    initial begin
        clk <= 1;
        forever #20 clk <= ~clk;
    end
    
    initial begin
        rst <= 1;
    end
    
    always @(posedge clk) begin
    
        rst <= 0;
    
    end

endmodule
