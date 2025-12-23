`timescale 1ns / 1ps


module Mux32Bit2To1(out, inA, inB, sel);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;

    always @(sel, inA, inB) begin
        if (sel == 0) begin
            out <= inA; end
        else begin
            out <= inB; end
    end

endmodule
