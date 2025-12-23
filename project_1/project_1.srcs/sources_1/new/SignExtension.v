`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:55:34 PM
// Design Name: 
// Module Name: SignExtension
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output [31:0] out;
    
    /* Fill in the implementation here ... */
    assign out = {{16{in[15]}}, in};
    //repeats MSB(most significant bit) 16 times for two's complement

endmodule