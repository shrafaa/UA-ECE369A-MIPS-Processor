`timescale 1ns / 1ps

module tlFPGAlab6(

    input Clk,
    input Reset
    
    );
    
    wire Clkout;
    wire [31:0] PCValue, WriteData;
    
    Two4DigitDisplay t(Clk, PCValue[15:0], WriteData[15:0], out7, en_out);
    TopLevel tl(Clkout, Reset, PCValue, WriteData);
    ClkDiv c(Clk, 1'b0, Clkout);
    
endmodule
