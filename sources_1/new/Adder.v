`timescale 1ns / 1ps

module Adder(A, B, AddResult

    );
    
    input [31:0] A;
    input [31:0] B;
    output [31:0] AddResult;
    
    assign AddResult = A + B;
    
    
endmodule
