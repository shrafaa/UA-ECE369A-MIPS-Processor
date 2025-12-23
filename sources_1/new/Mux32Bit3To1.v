`timescale 1ns / 1ps

module Mux32Bit3To1(out, inA, inB, inC, sel);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [1:0] sel;

    always @(sel, inA, inB, inC) begin
        if (sel == 0) begin
            out <= inA; end
        else if (sel == 1) begin
            out <= inB; end
        else if (sel == 2) begin
            out <= inC; end
    end

endmodule
