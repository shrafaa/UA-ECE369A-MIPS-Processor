`timescale 1ns / 1ps

module CreateJumporJALAddress(

    input [25:0] target,
    input [31:0] PCplus4,
    
    output [31:0] out

    );
    
    wire [27:0] shiftedTarget = {target, 2'b00};
    assign out = {PCplus4[31:28], shiftedTarget};
    
endmodule
