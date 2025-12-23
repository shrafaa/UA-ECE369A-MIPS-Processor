`timescale 1ns / 1ps

module Mux5Bit2To1(out, inA, inB, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input sel;

    always @(sel, inA, inB) begin
        if (sel == 0) begin
            out <= inA; end
        else begin
            out <= inB; end
    end

endmodule
