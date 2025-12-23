`timescale 1ns / 1ps


// MIPS 5 Stage Datapath with hazard detection unit


module tl6(

    input clk, rst,
    
    output [31:0] PCValue,
    output [31:0] WriteData

    );
    
    // InstructionFetch Wires
    
    wire [31:0] Address;
    //wire [31:0] PCValue;
    wire PCWrite;
    wire [31:0] Instruction;
    wire [31:0] PCplus4;
    wire IFIDWrite;
    
    // IFID reg Wires
    
    wire [31:0] PCplus4_IFID;
    wire [31:0] Instruction_IFID;
    
    // InstructionDecode Wires
    
    wire RegWrite;
    wire jump;
    wire RegDst;
    wire Branch;
    wire MemWrite;
    wire MemRead;
    wire MemToReg;
    wire jr;
    wire jal;
    wire shift;
    wire [5:0] ALUOp;
    wire [1:0] load;
    wire [1:0] store;
    wire [1:0] ALUSrc;
    wire [4:0] ReadRegister1;
    assign ReadRegister1 = Instruction_IFID[25:21];
    wire [4:0] ReadRegister2;
    assign ReadRegister2 = Instruction_IFID[20:16];
    wire [4:0] WriteRegister; 
    //wire [31:0] WriteData;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire RegWrite_MEMWB;
    wire [31:0] imm32;
    wire [31:0] imm32sll2;
    wire [31:0] BranchAddress;
    wire [31:0] JumpAddress;
    wire zeroSignals;
    wire flush;
    wire [2:0] hazardTest;
    
    
    // IDEX wires
    
    wire [31:0] PCplus4_IDEX;
    wire [31:0] BranchAddress_IDEX;
    wire [31:0] JumpAddress_IDEX;
    wire RegWrite_IDEX;
    wire jump_IDEX;
    wire RegDst_IDEX;
    wire Branch_IDEX;
    wire MemWrite_IDEX;
    wire MemRead_IDEX;
    wire MemToReg_IDEX;
    wire jr_IDEX;
    wire jal_IDEX;
    wire shift_IDEX;
    wire [1:0] ALUSrc_IDEX;
    wire [1:0] store_IDEX;
    wire [1:0] load_IDEX;
    wire [5:0] ALUOp_IDEX;
    wire [31:0] ReadData1_IDEX;
    wire [31:0] ReadData2_IDEX;
    wire [31:0] imm32_IDEX;
    wire [4:0] rt_IDEX;
    wire [4:0] rd_IDEX;
    
    // Execution Wires
    
    wire [31:0] ALUInput1;
    wire [31:0] ALUInput2;
    wire [31:0] ALUresult;
    wire zero;
    wire [4:0] PotentialRegDst;
    wire [4:0] FinalRegDst;
    wire [31:0] JoAoutput;
    
    // EXMEM wires
    
    wire [31:0] JumpAddress_EXMEM;
    wire [31:0] BranchingAddress_EXMEM;
    wire [31:0] ReadData1_EXMEM;
    wire [31:0] JumpAddr_EXMEM;
    wire [31:0] JoAoutput_EXMEM;
    wire Zero_EXMEM;
    wire jump_EXMEM;
    wire jr_EXMEM;
    wire branch_EXMEM;
    wire MemRead_EXMEM;
    wire jal_EXMEM;
    wire RegWrite_EXMEM;
    wire MemToReg_EXMEM;
    wire [1:0] store_EXMEM;
    wire [1:0] load_EXMEM;
    wire [31:0] PCplus4_EXMEM;
    wire [31:0] ALUResult_EXMEM;
    wire [31:0] ReadData2_EXMEM;
    wire [4:0] RegDstMuxOutput_EXMEM;
    
    // Memory Wires
    
    wire PCSrc;
    wire [31:0] PAddr1;
    wire [31:0] PAddr2;
    wire [31:0] StoreMuxOutput;
    wire [31:0] ReadData;
    wire [31:0] LoadMuxOutput;
    
    // testing wires
    
    wire confirmBranchSignal;
    assign confirmBranchSingal = (Branch_IDEX && zero) || jump_IDEX || jr_IDEX;
    
    wire [31:0] LoadMuxOutput_MEMWB;
    wire [31:0] JoAoutput_MEMWB;
    //wire RegWrite_MEMWB;
    //wire MemToReg_MEMWB;
    
    // InstructionFetch Start                                             _______________
    
    ProgramCounterLab6 programcounter (
            .PCWrite(PCWrite),          // signal that allows writes
            .Address(Address),          // next address in programcounter
            .clk(clk),                  // clk
            .rst(rst),                  // rst
            .PCResult(PCValue));         // output next address in programcounter
            
    InstructionMemory instructionmemory (
            .Address(PCValue),
            .Instruction(Instruction));
    
    PCAdder pcadder (
            .PCResult(PCValue),
            .PCAddResult(PCplus4));
   
            
    // InstructionFetch End
    
    IF_ID_regLab6 ifid(
            .clk(clk),
            .rst(rst),
            .PCplus4(PCplus4),
            .Instruction(Instruction),
            .flush(flush),
            .IFIDWrite(IFIDWrite),
            .PCplus4_IFID(PCplus4_IFID),
            .Instruction_IFID(Instruction_IFID));                                              
    
    // Instruction Decode Start
    
    Controller controller (
            .Instruction(Instruction_IFID),
            .RegWrite(RegWrite),
            .jump_target(jump),
            .RegDst(RegDst),
            .Branch(Branch),
            .MemWrite(MemWrite),
            .MemRead(MemRead),
            .MemToReg(MemToReg),
            .jr(jr),
            .jal(jal),
            .shift_mux(shift),
            .ALUOp(ALUOp),
            .load(load),
            .store(store),
            .ALUSrc(ALUSrc)
            );
            
     RegisterFile registerfileLab6 (
            .ReadRegister1(ReadRegister1),
            .ReadRegister2(ReadRegister2),
            .WriteRegister(WriteRegister),
            .WriteData(WriteData),
            .ReadData1(ReadData1),
            .ReadData2(ReadData2),
            .RegWrite(RegWrite_MEMWB),    
            .Clk(clk),
            .Rst(rst));
    
    SignExtension signextension (
            .in(Instruction_IFID[15:0]),
            .out(imm32));
    
    ShiftLeft2 shiftleft2 (
            .Shift_in(imm32),
            .Shift_out(imm32sll2));
    
    Adder adder (
            .A(imm32sll2),
            .B(PCplus4_IFID),
            .AddResult(BranchAddress));
    
    CreateJumporJALAddress makejumpaddr(
            .target(Instruction_IFID[25:0]),
            .PCplus4(PCplus4_IFID),
            .out(JumpAddress));
    
    
    Hazard hazarddetection (
            .rs(Instruction_IFID[25:21]),
            .rt(Instruction_IFID[20:16]),
            .FinalRegDst(FinalRegDst),
            .FinalRegDst_EXMEM(FinalRegDst_EXMEM),
            .PCSrc(PCSrc),
            .jump(jump_EXMEM),
            .jr(jr_EXMEM),
            .branch(Branch),
            .branch_IDEX(Branch_IDEX),
            .branch_EXMEM(branch_EXMEM),
            .RegWrite_IDEX(RegWrite_IDEX),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .zeroSignals(zeroSignals),
            .PCWrite(PCWrite),
            .IFIDWrite(IFIDWrite),
            .flush(flush),
            .test(hazardTest));
    
    // Instruction Decode End
    
    ID_EX_regLab6 idex (
            .clk(clk),
            .rst(rst),
            
            .zeroSignals(zeroSignals),
            .ReadData1(ReadData1),
            .ReadData2(ReadData2),
            .imm32(imm32),
            .BranchAddress(BranchAddress),
            .JumpAddress(JumpAddress),
            .RegWrite(RegWrite),
            .jump(jump),
            .RegDst(RegDst),
            .branch(Branch),
            .MemWrite(MemWrite),
            .MemRead(MemRead),
            .MemToReg(MemToReg),
            .jr(jr),
            .jal(jal),
            .shift(shift),
            .ALUOp(ALUOp),
            .load(load),
            .store(store),
            .ALUSrc(ALUSrc),
            .rt(rt),
            .rd(rd),
            
            .PCplus4_IDEX(PCplus4_IDEX),
            .ReadData1_IDEX(ReadData1_IDEX),
            .ReadData2_IDEX(ReadData2_IDEX),
            .imm32_IDEX(imm32_IDEX),
            .BranchAddress_IDEX(BranchAddress_IDEX),
            .JumpAddress_IDEX(JumpAddress_IDEX),
            .RegWrite_IDEX(RegWrite_IDEX),
            .jump_IDEX(jump_IDEX),
            .RegDst_IDEX(RegDst_IDEX),
            .branch_IDEX(Branch_IDEX),
            .MemWrite_IDEX(MemWrite_IDEX),
            .MemRead_IDEX(MemRead_IDEX),
            .MemToReg_IDEX(MemToReg_IDEX),
            .jr_IDEX(jr_IDEX),
            .jal_IDEX(jal_IDEX),
            .shift_IDEX(shift_IDEX),
            .ALUOp_IDEX(ALUOp_IDEX),
            .load_IDEX(load_IDEX),
            .store_IDEX(store_IDEX),
            .ALUSrc_IDEX(ALUSrc_IDEX),
            .rt_IDEX(rt_IDEX),
            .rd_IDEX(rd_IDEX));
            
    // Execution Start
    
    Mux32Bit2To1 ShiftMux (
            .out(ALUInput1),
            .inA(ReadData1_IDEX),
            .inB(ReadData2_IDEX),
            .sel(shift_IDEX));
    
    Mux32Bit3To1 ALUSrcMux (
            .out(ALUInput2),
            .inA(ReadData2_IDEX),
            .inB(imm32_IDEX),
            .inC({27'b0, imm32_IDEX[10:6]}),
            .sel(ALUSrc_IDEX));
            
    ALU32Bit alu (
            .ALUControl(ALUOp_IDEX),
            .A(ALUInput1),
            .B(ALUInput2),
            .ALUResult(ALUresult),
            .Zero(zero));
    
    Mux5Bit2To1 RegDstMux (
            .out(PotentialRegDst),
            .inA(rt_IDEX),
            .inB(rd_IDEX),
            .sel(RegDst_IDEX));
    
    Mux5Bit2To1 JALorRegDstMux (
            .out(FinalRegDst),
            .inA(PotentialRegDst),
            .inB(5'd31),
            .sel(jal_IDEX));
    
    
    Mux32Bit2To1 JALorALU (
            .out(JoAoutput),
            .inA(ALUresult),
            .inB(PCplus4_IDEX),
            .sel(jal_IDEX));
    
    // Execution End
    
    EX_MEM_reg exmem (
            .clk(clk),
            .rst(rst),
            .ReadData1_IDEX(ReadData1_IDEX),
            .ReadData2_IDEX(ReadData2_IDEX),
            .zero(zero),
            .JoAoutput(JoAoutput),
            .FinalRegDst(FinalRegDst),
            .BranchingAddress_IDEX(BranchingAddress_IDEX),
            .JumpAddress_IDEX(JumpAddress_IDEX),
            .RegWrite_IDEX(RegWrite_IDEX),
            .jump_IDEX(jump_IDEX),
            .branch_IDEX(Branch_IDEX),
            .MemWrite_IDEX(MemWrite_IDEX),
            .MemRead_IDEX(MemRead_IDEX),
            .MemToReg_IDEX(MemToReg_IDEX),
            .jr_IDEX(jr_IDEX),
            .jal_IDEX(jal_IDEX),
            .load_IDEX(load_IDEX),
            .store_IDEX(store_IDEX),
            
            .ReadData1_EXMEM(ReadData1_EXMEM),
            .ReadData2_EXMEM(ReadData2_EXMEM),
            .zero_EXMEM(zero_EXMEM),
            .JoAoutput_EXMEM(JoAoutput_EXMEM),
            .FinalRegDst_EXMEM(FinalRegDst_EXMEM),
            .BranchingAddress_EXMEM(BranchingAddress_EXMEM),
            .JumpAddress_EXMEM(JumpAddress_EXMEM),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .jump_EXMEM(jump_EXMEM),
            .branch_EXMEM(branch_EXMEM),
            .MemWrite_EXMEM(MemWrite_EXMEM),
            .MemRead_EXMEM(MemRead_EXMEM),
            .MemToReg_EXMEM(MemToReg_EXMEM),
            .jr_EXMEM(jr_EXMEM),
            .jal_EXMEM(jal_EXMEM),
            .load_EXMEM(load_EXMEM),
            .store_EXMEM(store_EXMEM));
    
    // Memory Start
    
    
    ANDgate andg (
            .Branch(branch_EXMEM),
            .zero(Zero_EXMEM),
            .out(PCSrc));
    
   
    Mux32Bit2To1 PCSrcMUX(
            .out(PAddr1),
            .inA(PCplus4),
            .inB(BranchingAddress_EXMEM),
            .sel(PCSrc));
            
    
    Mux32Bit2To1 jMux (
            .out(PAddr2),
            .inA(PAddr1),
            .inB(JumpAddress_EXMEM),
            .sel(jump_EXMEM));
    
    Mux32Bit2To1 jrMux (
            .out(Address),
            .inA(PAddr2),
            .inB(ReadData1_EXMEM),
            .sel(jr_EXMEM));
    
    
    Mux32Bit3To1 StoreMux (
            .out(StoreMuxOutput),
            .inA(ReadData2_EXMEM),
            .inB({{16{ReadData2_EXMEM[15]}}, ReadData2_EXMEM[15:0]}),
            .inC({{24{ReadData2_EXMEM[7]}}, ReadData2_EXMEM[7:0]}),
            .sel(store));
    
    
    DataMemory datamememory (
            .Address(JoAOutput_EXMEM),
            .WriteData(StoreMuxOutput),
            .Clk(clk),
            .MemWrite(MemWrite_EXMEM),
            .MemRead(MemRead_EXMEM),
            .ReadData(ReadData));
    
    
    Mux32Bit3To1 LoadMux (
            .out(LoadMuxOutput),
            .inA(ReadData),
            .inB({{16{ReadData[15]}}, ReadData[15:0]}),
            .inC({{24{ReadData[7]}}, ReadData[7:0]}),
            .sel(load_EXMEM));
    
    // Memory End
    
    
    
    MEM_WB_reg memwb (
            .clk(clk),
            .rst(rst),
            .JoAoutput_EXMEM(JoAoutput_EXMEM),
            .LoadMuxOutput(LoadMuxOutput),
            .FinalRegDst_EXMEM(FinalRegDst_EXMEM),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .MemToReg_EXMEM(MemToReg_EXMEM),
            
            .LoadMuxOutput_MEMWB(LoadMuxOutput_MEMWB),
            .JoAoutput_MEMWB(JoAoutput_MEMWB),
            .WriteRegister(WriteRegister),
            .RegWrite_MEMWB(RegWrite_MEMWB),
            .MemToReg_MEMWB(MemToReg_MEMWB));
    
    // WriteBack Start
    
    Mux32Bit2To1 MemToRegMux (
            .out(WriteData),
            .inA(LoadMuxOutput_MEMWB),
            .inB(JoAoutput_MEMWB),
            .sel(MemToReg_MEMWB));
    
    // WriteBack End
    
endmodule
