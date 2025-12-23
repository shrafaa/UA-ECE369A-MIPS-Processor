`timescale 1ns / 1ps

module Mux1Bit2To1(out, inA, inB, sel);

    output reg out;
    
    input inA;
    input inB;
    input sel;

    always @(sel, inA, inB) begin
        if (sel == 0) begin
            out <= inA; end
        else if (sel == 1) begin
            out <= inB; end
    end

endmodule
