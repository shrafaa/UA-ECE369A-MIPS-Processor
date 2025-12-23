`timescale 1ns / 1ps


module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, Rst, ReadData1, ReadData2, v0, v1);

    input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    input [31:0] WriteData;
    input RegWrite, Clk, Rst;
    output reg [31:0] ReadData1, ReadData2;
    output reg [31:0] v0, v1;
    
    reg [31:0] Registers [31:0];
    
    integer i;
    
    initial begin
        for (i = 0; i < 32; i=i+1) begin
            Registers[i] <= 0;
        end
    end
        
    always @(negedge Clk) begin
        /*
        ReadData1 <= Registers[ReadRegister1];
        ReadData2 <= Registers[ReadRegister2];
        */
        if(RegWrite == 1) begin
        Registers[WriteRegister] <= WriteData; end
    end
    
    always @(*) begin
        ReadData1 <= Registers[ReadRegister1];
        ReadData2 <= Registers[ReadRegister2];
        v0 <= Registers[2];
        v1 <= Registers[3];
    end
       
        
endmodule