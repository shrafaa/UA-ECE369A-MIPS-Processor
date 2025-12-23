`timescale 1ns / 1ps


module ShiftLeft2(Shift_in,Shift_out);
    input [31:0] Shift_in;
    output reg [31:0] Shift_out;
    
    always @(*) begin
        Shift_out <= Shift_in << 2;
    end
    
endmodule
