`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2025 11:55:38 AM
// Design Name: 
// Module Name: TopLevelLab6_tb
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


module TopLevelLab6_tb(

    );
    
    reg rst, clk;
    
    wire [31:0] PCValue;
    
    wire [31:0] WriteData;
    
    wire [31:0] v0, v1;
    
    //wire [31:0] ALUResult;
    
    //wire [31:0] Instruction_IFID;
    
    //wire [31:0] ForwardInputA;
    
    //wire [31:0] ForwardInputB;
    
    //wire [31:0] ALUInput2;
    
    //wire PCWrite;
    //wire IFIDWrite;
    //wire flush;
    //wire controlMux;
    
    //wire [31:0] imm32_IDEX;
    
    //wire [31:0] shamt;
    
    //wire [31:0] ReadData1_IDEX;
    //wire [31:0] ReadData2_IDEX;
    
    //wire [31:0] ReadData1;
    //wire [31:0] ReadData2;
    
    /*
    TopLevel toplevel (clk, rst, PCValue, WriteData, ALUResult, Instruction_IFID, ForwardInputA, ForwardInputB,
                    ALUInput2, PCWrite, IFIDWrite, flush, controlMux,
                    imm32_IDEX, shamt, ReadData1_IDEX, ReadData2_IDEX,
                    ReadData1, ReadData2);
    */
    
    TopLevel toplevel (clk, rst, PCValue, WriteData, v0, v1);
    
    initial begin
        clk <= 1;
        forever #20 clk <= ~clk;
    end
    
    initial begin
        rst <= 1;
    end
    
    
    always @(posedge clk) begin
    
        rst <= 0;
        
    
    end
    
endmodule
