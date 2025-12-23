`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 05:54:51 PM
// Design Name: 
// Module Name: RegisterFile
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

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);

	/* Please fill in the implementation here... */
    input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    input [31:0] WriteData;
    input RegWrite, Clk;
    output reg [31:0] ReadData1, ReadData2;
    
    reg [31:0] Registers [31:0]; //test 32, 32bit regs
    
    
    integer i;
    
    /*
    initial begin
        for (i = 0; i < 32; i = i + 1)
            Registers[i] = i;  // Initialize all registers to 0
    end
    
    */
    
    always @(posedge Clk) begin
    if(RegWrite == 1) begin
        Registers[WriteRegister] <= WriteData; end
    end
        
    always @(negedge Clk) begin
        ReadData1 <= Registers[ReadRegister1];
        ReadData2 <= Registers[ReadRegister2];
    end
       
        
endmodule

