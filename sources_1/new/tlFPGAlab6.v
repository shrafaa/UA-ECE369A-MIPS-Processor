`timescale 1ns / 1ps

// Percent Effort
// Rafael : 90%
// Joe    : 5%
// Andrew : 5%

module tlFPGAlab6(

    input Clk,
    input Reset,
    output [6:0] out7,
    output [7:0] en_out
    
    );
    
    wire Clkout;
    //wire [31:0] PCValue, WriteData;
    wire [31:0] v0, v1;
    
    Two4DigitDisplay t(Clk, v0[15:0], v1[15:0], out7, en_out);
    TopLevel tl(Clkout, Reset, v0, v1);
    ClkDiv c(Clk, 1'b0, Clkout);
    
endmodule
