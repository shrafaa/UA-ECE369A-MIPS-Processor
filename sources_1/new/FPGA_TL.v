`timescale 1ns / 1ps


module FPGA_TL(

    input Clk, Reset,
    output [6:0] out7,
    output [7:0] en_out

    );
    
    wire Clkout;
    wire [31:0] PCValue, WriteData;
    
    Two4DigitDisplay t (Clk, PCValue[15:0], WriteData[15:0], out7, en_out);
    TopLevel a (Clkout, Reset, PCValue, WriteData);
    ClkDiv c (Clk, 1'b0, Clkout);
    
endmodule
