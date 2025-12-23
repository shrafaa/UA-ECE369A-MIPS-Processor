`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 06:04:29 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    /* Please fill in the implementation here */
    reg [31:0] memory[0:1023];
    
    initial begin
    $readmemh("datamemory.mem", memory, 0,1023);
    end 
    
    
    always @(posedge Clk) begin
        if (MemWrite==1) begin
            memory[Address[11:2]] <= WriteData;
        end
    end
    always @* begin
        if (MemRead==1)begin
            ReadData=memory[Address[11:2]];
        end
        else begin
            ReadData=32'b0;
        end
    end
    
    
endmodule