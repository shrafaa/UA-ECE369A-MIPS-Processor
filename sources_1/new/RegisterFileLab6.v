`timescale 1ns / 1ps

module RegisterFileLab6(

    input [4:0] ReadRegister1,
    input [4:0] ReadRegister2,
    input [4:0] WriteRegister,
    input [31:0] WriteData,
    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2,
    input RegWrite,
    input clk,
    input rst
    );
    
    reg [31:0] Registers [31:0];
    always @(posedge clk) begin
        if(RegWrite == 1) begin
            Registers[WriteRegister] <= WriteData; 
            end
        
        else begin
            if (rst) begin
                Registers[0] <= 0;
                Registers[1] <= 0;
                Registers[2] <= 0;
                Registers[3] <= 0;
                Registers[4] <= 0;
                Registers[5] <= 0;
                Registers[6] <= 0;
                Registers[7] <= 0;
                Registers[8] <= 0;
                Registers[9] <= 0;
                Registers[10] <= 0;
                Registers[11] <= 0;
                Registers[12] <= 0;
                Registers[13] <= 0;
                Registers[14] <= 0;
                Registers[15] <= 0;
                Registers[16] <= 0;
                Registers[17] <= 0;
                Registers[18] <= 0;
                Registers[19] <= 0;
                Registers[20] <= 0;
                Registers[21] <= 0;
                Registers[22] <= 0;
                Registers[23] <= 0;
                Registers[24] <= 0;
                Registers[25] <= 0;
                Registers[26] <= 0;
                Registers[27] <= 0;
                Registers[28] <= 0;
                Registers[29] <= 0;
                Registers[30] <= 0;
                Registers[31] <= 0;
            end
        end
    end
        
    always @(negedge clk) begin
        ReadData1 <= Registers[ReadRegister1];
        ReadData2 <= Registers[ReadRegister2];
    end
    
endmodule
