`timescale 1ns / 1ps


module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	
    input [31:0] WriteData; 
    input Clk;
    input MemWrite; 		 
    input MemRead; 			

    output reg[31:0] ReadData; 

    reg [31:0] memory[0:17000];
    
    initial begin
        $readmemh("datamem.mem", memory, 0,17000);
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
