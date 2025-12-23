`timescale 1ns / 1ps

module topLevelLab6(

    input clk, rst,
    
    output [31:0] PCValue,
    
    output [31:0] WriteData
                
    );
    
    // Instruction Fetch Wires
    wire [31:0] PCplus4;
    wire [31:0] Address;
    wire [31:0] Instruction;
    wire [31:0] PCplus4_IFID;
    wire [31:0] Instruction_IFID;
    
    // Instruction Decode Wires
    wire RegWrite;
    wire jump;
    wire [1:0]ALUSrc;
    wire [5:0] ALUOp;
    wire RegDst;
    wire Branch;
    wire MemWrite;
    wire MemRead;
    wire MemToReg;
    wire jr;
    wire [1:0] store;
    wire [1:0] load;
    wire jal;
    wire shift;
    wire [4:0] ReadRegister1;
    assign ReadRegister1 = Instruction_IFID[25:21];
    wire [4:0] ReadRegister2;
    assign ReadRegister2 = Instruction_IFID[20:16];
    wire [4:0] WriteRegister;
    wire RegWrite_MEMWB;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] imm32;
    wire [25:0] target; // for j and jal instruction
    assign target = Instruction_IFID[25:0];
    wire [4:0] rt, rd;
    wire PCWrite; // From Hazard Detection Unit
    wire IFIDWrite; // From Hazard Detection Unit
    wire ControlMux; // From Hazard Detection Unit
    assign rt = Instruction_IFID[20:16];
    assign rd = Instruction_IFID[15:11];
    // Mux for JAL instruction
    wire JAL_regWriteOutput;
    wire [4:0] WriteAddress_fromJALmux;
    wire [31:0] WriteContent_fromJALmux;
    wire [31:0] PCplus4_IDEX;
    wire [25:0] target_IDEX;
    wire RegWrite_IDEX;
    wire jump_IDEX;
    wire [1:0]ALUSrc_IDEX;
    wire [5:0] ALUOp_IDEX;
    wire RegDst_IDEX;
    wire Branch_IDEX;
    wire MemWrite_IDEX;
    wire MemRead_IDEX;
    wire MemToReg_IDEX;
    wire jr_IDEX;
    wire ra_IDEX;
    wire [1:0] store_IDEX;
    wire [1:0] load_IDEX;
    wire jal_IDEX;
    wire shift_IDEX;
    wire [31:0] ReadData1_IDEX;
    wire [31:0] ReadData2_IDEX;
    wire [31:0] imm32_IDEX;
    wire [4:0] rt_IDEX;
    wire [4:0] rd_IDEX;
    
    // Execution Wires
    wire [4:0] RegDstMuxOutput;
    wire [31:0] ShiftMuxOutput;
    wire [31:0] shamt;
    assign shamt = {27'b0, imm32_IDEX[10:6]};
    wire [31:0] ALUInput2;
    wire [31:0] AfterShiftLeft2;
    wire [31:0] BranchingAddress;
    wire [31:0] JumpAddr;
    wire [31:0] ALUResult;
    wire zero;
    wire [31:0] BranchingAddress_EXMEM;
    wire [31:0] ReadData1_EXMEM;
    wire [31:0] ReadData2_EXMEM;
    wire [31:0] JumpAddr_EXMEM;
    wire Zero_EXMEM;
    wire jump_EXMEM;
    wire jr_EXMEM;
    wire branch_EXMEM;
    wire MemRead_EXMEM;
    wire MemWrite_EXMEM;
    wire jal_EXMEM;
    wire RegWrite_EXMEM;
    wire MemToReg_EXMEM;
    wire [1:0] store_EXMEM;
    wire [1:0] load_EXMEM;
    wire [31:0] PCplus4_EXMEM;
    wire [31:0] ALUResult_EXMEM;
    wire [4:0] RegDstMuxOutput_EXMEM;
    
    // Memory Wires
    wire PCSrc;
    wire [31:0] PCSrcMuxOut;
    wire [31:0] JMuxout;
    wire [31:0] StoreMuxOutput;
    wire [4:0] JAL_RDMux_output;
    wire [31:0] JAL_WDMux_Output;
    wire [31:0] MemReadData;
    wire [31:0] LoadMuxOutput;
    wire [31:0] LoadMuxOutput_MEMWB;
    wire [31:0] JAL_WDMux_Output_MEMWB;
    wire MemToReg_MEMWB;
    
    /*__________________________________________________________________________*/
    // Instruction Fetch
    /*__________________________________________________________________________*/
        
    
    // Initialize the Program Counter with stalling capabilites
    ProgramCounterLab6 programcounter (
            .Address(Address),
            .PCResult(PCValue),
            .clk(clk),
            .rst(rst),
            .PCWrite(PCWrite));
            
    // Initialize Instruction Memory
    InstructionMemory instructionmemory (
            .Address(PCValue),
            .Instruction(Instruction));
    
    // Initialize Program Counter Adder
    PCAdder pcadder (
            .PCResult(PCValue),
            .PCAddResult(PCplus4));
    
    /*__________________________________________________________________________*/
    // Instruction Fetch End
    /*__________________________________________________________________________*/
    
    IF_ID_regLab6 ifidreg (
            .clk(clk),
            .rst(rst),
            .IFIDWrite(IFIDWrite),
            .PCplus4(PCplus4),
            .Instruction(Instruction),
            .PCplus4_IFID(PCplus4_IFID),
            .Instruction_IFID(Instruction_IFID));
            
    /*__________________________________________________________________________*/
    // Instruction Decode
    /*__________________________________________________________________________*/
    
    // Initialize the Hazard Detection Unit
    HazardDetection hazarddetection (
            .rs_IFID(ReadRegister1),
            .rt_IFID(ReadRegister2),
            .rd_IDEX(RegDstMuxOutput),
            .rd_EXMEM(JAL_RDMux_output),
            .rd_WB(WriteRegister),
            .RegWrite_IDEX(RegWrite_IDEX),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .RegWrite_WB(RegWrite_MEMWB),
            .PCWrite(PCWrite),
            .IFIDWrite(IFIDWrite),
            .ControlMux(ControlMux));    
        
    // Initialize the controller
    Controller controller (
            // Inputs
            .Instruction(Instruction_IFID),
            // Outputs
            .RegWrite(RegWrite),
            .jump_target(jump),
            .ALUSrc(ALUSrc),
            .ALUOp(ALUOp),
            .RegDst(RegDst),
            .Branch(Branch),
            .MemWrite(MemWrite),
            .MemRead(MemRead),
            .MemToReg(MemToReg),
            .jr(jr),
            .store(store),
            .load(load),
            .jal(jal),
            .shift_mux(shift));
            
    
    // Initialize the Register File
    RegisterFile registerfile (
            .ReadRegister1(ReadRegister1),
            .ReadRegister2(ReadRegister2),
            .WriteRegister(WriteAddress_fromJALmux),
            .WriteData(WriteContent_fromJALmux),
            .RegWrite(JAL_regWriteOutput),
            .Clk(clk),
            .Rst(rst),
            .ReadData1(ReadData1),
            .ReadData2(ReadData2));
            
    // Initialize the SignExtender
    SignExtension signextension (
            .in(Instruction_IFID[15:0]),
            .out(imm32));
    
    // Branching Logic in the Instruction Decode Stage
    
    // Shift imm32 left twice for branching address and then add with PCplus4
    wire [31:0] afterShiftLeft2ID;
    ShiftLeft2 shiftleft2branchingID (
            .Shift_in(imm32),
            .Shift_out(afterShiftLeft2ID));
    
    wire [31:0] BranchingAddressID;
    Adder branchingadder (
            .A(afterShiftLeft2ID),
            .B(PCplus4_IFID),
            .AddResult(BranchingAddressID));
    
    // Determine PCSrcMux
    wire PCSrcID;
    
    PCSrcGenerator pcsrcgen (
            .ReadData1(ReadData1),
            .ReadData2(ReadData2),
            .imm32(imm32),
            .ALUOp(ALUOp),
            .branch(Branch),
            .ALUSrc(ALUSrc),
            .PCSrc(PCSrcID));
    
    // Create the jump address
    wire [31:0] jumpAddressID;
    CreateJumporJALAddress createadd(
            .target(target),
            .PCplus4(PCplus4_IFID),
            .out(jumpAddressID));
            
    
    
    Mux1Bit2To1 JALregwrite (
            .out(JAL_regWriteOutput),
            .inA(RegWrite_MEMWB),
            .inB(1'b1),
            .sel(jal));
            
   
    Mux5Bit2To1 JALWriteAddressMux (
            .out(WriteAddress_fromJALmux),
            .inA(WriteRegister),
            .inB(5'd31),
            .sel(jal));
    
    
    Mux32Bit2To1 JALWriteDataMux (
            .out(WriteContent_fromJALmux),
            .inA(WriteData),
            .inB(PCplus4_IFID),
            .sel(jal));
    
            
    /*__________________________________________________________________________*/
    // Instruction Decode End
    /*__________________________________________________________________________*/
    
    
    ID_EX_regLab6 idexreg (
            .clk(clk),
            .rst(rst),
            .ControlMux(ControlMux),
            
            // Address Inputs
            .PCplus4_IFID(PCplus4_IFID),
            .target(target),
            
            // Control Signal Inputs
            .RegWrite(RegWrite),
            .jump(jump),
            .RegDst(RegDst),
            .Branch(Branch),
            .MemWrite(MemWrite),
            .MemRead(MemRead),
            .MemToReg(MemToReg),
            .jr(jr),
            .jal(jal),
            .shift(shift),
            .ALUSrc(ALUSrc),
            .store(store),
            .load(load),
            .ALUOp(ALUOp),
            
            // Inputs from the Register File
            .ReadData1(ReadData1),
            .ReadData2(ReadData2),
            
            // Inputs from the Sign Extension
            .imm32(imm32),
            
            // Inputs for potential Write Addresses
            .rt(rt),
            .rd(rd),
            
            // Address Outputs
            .PCplus4_IDEX(PCplus4_IDEX),
            .target_IDEX(target_IDEX),
            
            // Control Signal Outputs
            .RegWrite_IDEX(RegWrite_IDEX),
            .jump_IDEX(jump_IDEX),
            .RegDst_IDEX(RegDst_IDEX),
            .Branch_IDEX(Branch_IDEX),
            .MemWrite_IDEX(MemWrite_IDEX),
            .MemRead_IDEX(MemRead_IDEX),
            .MemToReg_IDEX(MemToReg_IDEX),
            .jr_IDEX(jr_IDEX),
            .jal_IDEX(jal_IDEX),
            .shift_IDEX(shift_IDEX),
            .ALUSrc_IDEX(ALUSrc_IDEX),
            .store_IDEX(store_IDEX),
            .load_IDEX(load_IDEX),
            .ALUOp_IDEX(ALUOp_IDEX),
            
            // Inputs from the Register File
            .ReadData1_IDEX(ReadData1_IDEX),
            .ReadData2_IDEX(ReadData2_IDEX),
            
            // Inputs from the Sign Extension
            .imm32_IDEX(imm32_IDEX),
            
            // Inputs for potential Write Addresses
            .rt_IDEX(rt_IDEX),
            .rd_IDEX(rd_IDEX));
            
    /*__________________________________________________________________________*/
    // Execution
    /*__________________________________________________________________________*/
    
    
    // RegDst Mux
    Mux5Bit2To1 regdstmux (
            .out(RegDstMuxOutput),
            .inA(rt_IDEX),
            .inB(rd_IDEX),
            .sel(RegDst_IDEX));
    
    // Shift Mux
    Mux32Bit2To1 shiftmux (
            .out(ShiftMuxOutput),
            .inA(ReadData1_IDEX),
            .inB(ReadData2_IDEX),
            .sel(shift_IDEX));    
    
    // ALUSrc Mux
    Mux32Bit3To1 ALUSrcMux (
            .out(ALUInput2),
            .inA(ReadData2_IDEX),
            .inB(imm32_IDEX),
            .inC(shamt),
            .sel(ALUSrc_IDEX));
    
    // Shifting the branching address
    ShiftLeft2 shiftleft2branching (
            .Shift_in(imm32_IDEX),
            .Shift_out(AfterShiftLeft2));
    
    // Adding Branching Address with PCplus4
    Adder adder (
            .A(PCplus4_IDEX),
            .B(AfterShiftLeft2),
            .AddResult(BranchingAddress));
        
    CreateJumporJALAddress createaddress(
            .target(target_IDEX),
            .PCplus4(PCplus4_IDEX),
            .out(JumpAddr));
    
    
    ALU32Bit alu (
            .ALUControl(ALUOp_IDEX),
            .A(ShiftMuxOutput),
            .B(ALUInput2),
            .ALUResult(ALUResult),
            .Zero(zero));
    
    /*__________________________________________________________________________*/
    // Execution End
    /*__________________________________________________________________________*/
    
       
    EX_MEM_reg exmemreg (
            .clk(clk),
            .rst(rst),
            
            // Address Inputs
            .BranchingAddress(BranchingAddress),
            .ReadData1_IDEX(ReadData1_IDEX),
            .JumpAddr(JumpAddr),
            
            // Control Signal Inputs
            .Zero(zero),
            .jump_IDEX(jump_IDEX),
            .jr_IDEX(jr_IDEX),
            .branch_IDEX(Branch_IDEX),
            .MemRead_IDEX(MemRead_IDEX),
            .MemWrite_IDEX(MemWrite_IDEX),
            .jal_IDEX(jal_IDEX),
            .RegWrite_IDEX(RegWrite_IDEX),
            .MemToReg_IDEX(MemToReg_IDEX),
            .store_IDEX(store_IDEX),
            .load_IDEX(load_IDEX),
            
            // Write Content Inputs
            .PCplus4_IDEX(PCplus4_IDEX),
            .ALUResult(ALUResult),
            .ReadData2_IDEX(ReadData2_IDEX),
            
            // WriteAddress
            .RegDstMuxOutput(RegDstMuxOutput),
            
            // Address Outputs
            .BranchingAddress_EXMEM(BranchingAddress_EXMEM),
            .ReadData1_EXMEM(ReadData1_EXMEM),
            .JumpAddr_EXMEM(JumpAddr_EXMEM),
            
            // Control Signal Outputs
            .Zero_EXMEM(Zero_EXMEM),
            .jump_EXMEM(jump_EXMEM),
            .jr_EXMEM(jr_EXMEM),
            .branch_EXMEM(branch_EXMEM),
            .MemRead_EXMEM(MemRead_EXMEM),
            .MemWrite_EXMEM(MemWrite_EXMEM),
            .jal_EXMEM(jal_EXMEM),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .MemToReg_EXMEM(MemToReg_EXMEM),
            .store_EXMEM(store_EXMEM),
            .load_EXMEM(load_EXMEM),
            
            // Write Content Outputs
            .PCplus4_EXMEM(PCplus4_EXMEM),
            .ALUResult_EXMEM(ALUResult_EXMEM),
            .ReadData2_EXMEM(ReadData2_EXMEM),
            
            // Write Address
            .RegDstMuxOutput_EXMEM(RegDstMuxOutput_EXMEM));
    
    /*__________________________________________________________________________*/
    // Memory
    /*__________________________________________________________________________*/
    
    // Generate PCSrc signal
    ANDgate andgate (
        .Branch(branch_EXMEM),
        .zero(Zero_EXMEM),
        .out(PCSrc));
    
    // Mux to select the next address of the program counter // This mux was edited for Lab6
    Mux32Bit2To1 PCSrcMux (
            .out(PCSrcMuxOut),
            .inA(PCplus4),
            .inB(BranchingAddressID),
            .sel(PCSrcID));
            
    // Mux to select if the address is a jump/jal instruction
    Mux32Bit2To1 JumpMux (
            .out(JMuxout),
            .inA(PCSrcMuxOut),
            .inB(jumpAddressID),
            .sel(jump));
    
    // Mux to select if the address is a jr instruction
    Mux32Bit2To1 JrMux (
            .out(Address),
            .inA(JMuxout),
            .inB(ReadData1),
            .sel(jr));
    
    // Mux to select in between different load instructions
    Mux32Bit3To1 StoreMux (
            .out(StoreMuxOutput),
            .inA(ReadData2_EXMEM),
            .inB({{16{ReadData2_EXMEM[15]}}, ReadData2_EXMEM[15:0]}),
            .inC({{24{ReadData2_EXMEM[7]}}, ReadData2_EXMEM[7:0]}),
            .sel(store_EXMEM));
    
    // Mux to select the Write Register address, used for jal
    
    Mux5Bit2To1 JAL_RDMux (
            .out(JAL_RDMux_output),
            .inA(RegDstMuxOutput_EXMEM),
            .inB(5'd31),
            .sel(jal_EXMEM));
    
    // Mux gets activated when it is a jal instruction
    Mux32Bit2To1 JAL_WDMux (
            .out(JAL_WDMux_Output),
            .inA(ALUResult_EXMEM),
            .inB(PCplus4_EXMEM),
            .sel(jal_EXMEM));
    
    // Initialize the Data Memory
    DataMemory datamemory (
            .Address(ALUResult_EXMEM),
            .WriteData(StoreMuxOutput),
            .Clk(clk),
            .MemWrite(MemWrite_EXMEM),
            .MemRead(MemRead_EXMEM),
            .ReadData(MemReadData));
    
    
    Mux32Bit3To1 LoadMux (
            .out(LoadMuxOutput),
            .inA(MemReadData),
            .inB({{16{MemReadData[15]}}, MemReadData[15:0]}),
            .inC({{24{MemReadData[7]}}, MemReadData[7:0]}),
            .sel(load_EXMEM));
    
    /*__________________________________________________________________________*/
    // Memory End
    /*__________________________________________________________________________*/
    
    
    
    MEM_WB_reg memwbreg (
            .clk(clk),
            .rst(rst),
            
            // inputs
            .LoadMuxOutput(LoadMuxOutput),
            .JAL_WDMux_Output(JAL_WDMux_Output),
            .JAL_RDMux_Output(JAL_RDMux_output),
            .RegWrite_EXMEM(RegWrite_EXMEM),
            .MemToReg_EXMEM(MemToReg_EXMEM),
            
            // outputs
            .LoadMuxOutput_MEMWB(LoadMuxOutput_MEMWB),
            .JAL_WDMux_Output_MEMWB(JAL_WDMux_Output_MEMWB),
            .JAL_RDMux_Output_MEMWB(WriteRegister),
            .RegWrite_MEMWB(RegWrite_MEMWB),
            .MemToReg_MEMWB(MemToReg_MEMWB));
            
    /*__________________________________________________________________________*/
    // Write Back
    /*__________________________________________________________________________*/
    
    Mux32Bit2To1 MemToRegMux (
            .out(WriteData),
            .inA(LoadMuxOutput_MEMWB),
            .inB(JAL_WDMux_Output_MEMWB),
            .sel(MemToReg_MEMWB));
            
    /*__________________________________________________________________________*/
    // Write Back End
    /*__________________________________________________________________________*/
    
endmodule
