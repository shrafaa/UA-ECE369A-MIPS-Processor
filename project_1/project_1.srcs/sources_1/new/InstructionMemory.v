`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:52:22 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] memory[0:1023]; 
    
    initial begin
        $readmemh("instmem.mem", memory, 0, 1023);
    end 
    
    always @* begin
    Instruction = memory[Address[11:2]]; 
    end
    
endmodule
