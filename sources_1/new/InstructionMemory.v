`timescale 1ns / 1ps


module InstructionMemory(Address, Instruction); 

    input [31:0] Address;

    output reg [31:0] Instruction;
    
    reg [31:0] memory[0:1023]; 
    
    initial begin
        $readmemh("instrmem.mem", memory, 0, 1023);
    end 
    
    always @* begin
        Instruction = memory[Address[11:2]]; 
    end
    
endmodule
