`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:53:27 PM
// Design Name: 
// Module Name: PCAdder
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


module PCAdder(PCResult, PCAddResult);

    input [31:0] PCResult;

    output [31:0] PCAddResult;

    /* Please fill in the implementation here... */
    assign PCAddResult = PCResult + 4; //assign b/c combinational logic, based on input
    
endmodule
