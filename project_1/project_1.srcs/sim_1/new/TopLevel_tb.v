`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2025 07:20:35 PM
// Design Name: 
// Module Name: TopLevel_tb
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


module TopLevel_tb(); 
    // Test inputs
    reg Rst, Clk;

    // IF Stage outputs
    wire [31:0] PCValue;
    wire [31:0] WriteData;
    /*
    wire [31:0] PCResult;
    wire [31:0] Instruction;
    wire [31:0] PCAddress;

    // ID Stage outputs
    wire [31:0] InstructionID;
    wire [31:0] PCResultID;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [4:0]  WB_reg;
    wire [31:0] SignExtend;
    wire [5:0]  ALUOp;
    wire Branch, RegWrite, Jump_Target, ALUSrc, RegDst, MemWrite;
    wire MemRead, MemToReg, Jr, Ra, Jal;
    wire [1:0] Store, Load;

    // EX Stage outputs
    wire [4:0] Instruction_20_16_EX;
    wire [4:0] Instruction_15_11_EX;
    wire [25:0] Instruction_25_0_EX;
    wire [31:0] PCResult_EX;
    wire [31:0] ReadData1_EX;
    wire [31:0] ReadData2_EX;
    wire [31:0] SignExtend_EX;
    wire [5:0] ALUOp_EX;
    wire Branch_EX, RegWrite_EX, Jump_Target_EX, ALUSrc_EX, RegDst_EX;
    wire MemWrite_EX, MemRead_EX, MemToReg_EX, Jr_EX, Ra_EX, Jal_EX;
    wire [1:0] Store_EX, Load_EX;
    wire [4:0] RegDestMuxResult;
    wire [31:0] jump_targetMuxResult;
    wire [31:0] ALUResult;
    wire [31:0] shiftResult;
    wire [31:0] ALUSrcMuxResult;
    wire ALUZero;
    wire [31:0] AddResult;

    // MEM Stage outputs
    wire [31:0] Jr_Or_Not;
    wire Branch_output;
    wire Branch_MEM;
    wire MemWrite_MEM;
    wire MemRead_MEM;
    wire RegWrite_MEM;
    wire MemToReg_MEM;
    wire [31:0] AddResult_MEM;
    wire ALUZero_MEM;
    wire [31:0] ALUResult_MEM;
    wire [4:0] RegDestMuxResult_MEM;
    wire [31:0] ReadData2_MEM;
    wire [31:0] ReadData1_MEM;
    wire Ra_MEM;
    wire [1:0] Load_MEM;
    wire [1:0] Store_MEM;
    wire Jal_MEM;
    wire Jr_MEM;
    wire [31:0] loadMuxResult;
    wire [31:0] storeMuxResult;
    wire [31:0] jalMuxResult;
    wire [31:0] MemData_MEM;

    // WB Stage outputs
    wire Ra_WB;
    wire RegWrite_WB;
    wire MemToReg_WB;
    wire [31:0] jalMuxResult_WB;
    wire [31:0] MemData_WB;
    wire [4:0] RegDestMuxResult_WB;
    wire [31:0] jump_targetMuxResult2; */

    TopLevel u0(
        // Inputs
        .Clk(Clk),
        .Rst(Rst),
        .PCValue(PCValue),
        .WriteData(WriteData)
        
       
        
        /*
        // IF Stage
        
        .PCResult(PCResult),
        .Instruction(Instruction),
        .PCAddress(PCAddress),
        
        // ID Stage
        .InstructionID(InstructionID),
        .PCResultID(PCResultID),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .WB_reg(WB_reg),
        .SignExtend(SignExtend),
        .ALUOp(ALUOp),
        .Branch(Branch),
        .RegWrite(RegWrite),
        .Jump_Target(Jump_Target),
        .ALUSrc(ALUSrc),
        .RegDst(RegDst),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .MemToReg(MemToReg),
        .Jr(Jr),
        .Ra(Ra),
        .Jal(Jal),
        .Store(Store),
        .Load(Load),
        
        // EX Stage
        .Instruction_20_16_EX(Instruction_20_16_EX),
        .Instruction_15_11_EX(Instruction_15_11_EX),
        .Instruction_25_0_EX(Instruction_25_0_EX),
        .PCResult_EX(PCResult_EX),
        .ReadData1_EX(ReadData1_EX),
        .ReadData2_EX(ReadData2_EX),
        .SignExtend_EX(SignExtend_EX),
        .ALUOp_EX(ALUOp_EX),
        .Branch_EX(Branch_EX),
        .RegWrite_EX(RegWrite_EX),
        .Jump_Target_EX(Jump_Target_EX),
        .ALUSrc_EX(ALUSrc_EX),
        .RegDst_EX(RegDst_EX),
        .MemWrite_EX(MemWrite_EX),
        .MemRead_EX(MemRead_EX),
        .MemToReg_EX(MemToReg_EX),
        .Jr_EX(Jr_EX),
        .Ra_EX(Ra_EX),
        .Jal_EX(Jal_EX),
        .Store_EX(Store_EX),
        .Load_EX(Load_EX),
        .RegDestMuxResult(RegDestMuxResult),
        .jump_targetMuxResult(jump_targetMuxResult),
        .ALUResult(ALUResult),
        .shiftResult(shiftResult),
        .ALUSrcMuxResult(ALUSrcMuxResult),
        .ALUZero(ALUZero),
        .AddResult(AddResult),
        
        // MEM Stage
        .Jr_Or_Not(Jr_Or_Not),
        .Branch_output(Branch_output),
        .Branch_MEM(Branch_MEM),
        .MemWrite_MEM(MemWrite_MEM),
        .MemRead_MEM(MemRead_MEM),
        .RegWrite_MEM(RegWrite_MEM),
        .MemToReg_MEM(MemToReg_MEM),
        .AddResult_MEM(AddResult_MEM),
        .ALUZero_MEM(ALUZero_MEM),
        .ALUResult_MEM(ALUResult_MEM),
        .RegDestMuxResult_MEM(RegDestMuxResult_MEM),
        .ReadData2_MEM(ReadData2_MEM),
        .ReadData1_MEM(ReadData1_MEM),
        .Ra_MEM(Ra_MEM),
        .Load_MEM(Load_MEM),
        .Store_MEM(Store_MEM),
        .Jal_MEM(Jal_MEM),
        .Jr_MEM(Jr_MEM),
        .loadMuxResult(loadMuxResult),
        .storeMuxResult(storeMuxResult),
        .jalMuxResult(jalMuxResult),
        .MemData_MEM(MemData_MEM),
        
        // WB Stage
        
        .Ra_WB(Ra_WB),
        .RegWrite_WB(RegWrite_WB),
        .MemToReg_WB(MemToReg_WB),
        .jalMuxResult_WB(jalMuxResult_WB),
        .MemData_WB(MemData_WB), 
        .RegDestMuxResult_WB(RegDestMuxResult_WB) */
    );
    
 
    // Clock generation
    initial begin
        Clk <= 1;
        forever #100 Clk <= ~Clk;
    end

    // Reset logic with a delay
    initial begin
        Rst <= 1;      // Assert reset
       
    end

    // Display results at every positive clock edge
    always @(posedge Clk) begin
    #200
        Rst <= 0;
       
       
            $display("\n=== Time %0t ns ===", $time);
            $display("\n PCValue = %d WriteData = %d", PCValue, WriteData);
   
   /*     
        // IF Stage
        $display("\nIF Stage:");
        $display("PCValue=%h, PCResult=%h, Instruction=%h, PCAddress=%h",
                 PCValue, PCResult, Instruction, PCAddress);
        
        // ID Stage
        $display("\nID Stage:");
        $display("InstructionID=%h, PCResultID=%h, ReadData1=%h, ReadData2=%h",
                 InstructionID, PCResultID, ReadData1, ReadData2);
        $display("SignExtend=%h, ALUOp=%h, Control Signals: Branch=%b RegWrite=%b Jump_Target=%b",
                 SignExtend, ALUOp, Branch, RegWrite, Jump_Target);
        
        // EX Stage
        $display("\nEX Stage:");
        $display("ALUResult=%h, ALUZero=%b, AddResult=%h",
                 ALUResult, ALUZero, AddResult);
        $display("ReadData1_EX=%h, ReadData2_EX=%h, SignExtend_EX=%h",
                 ReadData1_EX, ReadData2_EX, SignExtend_EX);
        
        // MEM Stage
        $display("\nMEM Stage:");
        $display("Branch_output=%h, ALUResult_MEM=%h, MemData_MEM=%h",
                 Branch_output, ALUResult_MEM, MemData_MEM);
        $display("Jr_Or_Not=%h, loadMuxResult=%h, storeMuxResult=%h",
                 Jr_Or_Not, loadMuxResult, storeMuxResult);
        
        // WB Stage
        $display("\nWB Stage:");
        $display("WriteData=%h, RegDestMuxResult_WB=%h, MemData_WB=%h",
                 WriteData, RegDestMuxResult_WB, MemData_WB); */
    end

endmodule