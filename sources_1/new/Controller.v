`timescale 1ns / 1ps

module Controller(
    input [31:0] Instruction,
    output reg RegWrite, jump_target, RegDst, Branch, MemWrite, MemRead, MemToReg, jr, jal, shift_mux,
    output reg [5:0] ALUOp,
    output reg [1:0] load, store, ALUSrc
    );
    
    
    always @(Instruction) begin 
    // nop
      if(Instruction == 32'b00000000000000000000000000000000) begin
          ALUOp = 6'b000000;
          Branch = 0;
          RegWrite = 0;
          jump_target = 0;
          RegDst = 0;
          MemWrite = 0;
          MemRead = 0;
          MemToReg = 0; 
          ALUSrc = 0;
          jr = 0; 
          store = 0;
          load = 0;
          jal = 0;
          shift_mux = 0;
          end
          
        else 
        begin
        case(Instruction[31:26]) 
            6'b000000: begin 
            //R-Type        
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            
            
            case(Instruction[5:0]) 
            6'b100000: begin    //Add
            ALUOp = 6'b100000; 
            ALUSrc = 0; end
            
            6'b100010: begin    //Sub
            ALUOp = 6'b100010; 
            ALUSrc = 0; end
            
            6'b100100: begin   //and
            ALUOp = 6'b100100;
            ALUSrc = 0; end
            
            6'b100101: begin    //or
            ALUOp = 6'b100101;
            ALUSrc = 0; end
            
            6'b100111: begin    //nor
            ALUOp = 6'b100111;
            ALUSrc = 0; end
            
            6'b100110: begin    //xor
            ALUOp = 6'b100110;
            ALUSrc = 0; end
            
            6'b101010: begin    //slt
            ALUOp = 6'b101010;
            ALUSrc = 0; end
            
            6'b000000: begin    //sll
            ALUOp = 6'b000000;
            shift_mux = 1;
            ALUSrc = 2; end
            
            6'b000010: begin    //srl
            ALUOp = 6'b000010;
            shift_mux = 1;
            ALUSrc = 2; end
            
            6'b001000: begin //jr because opcode is zero for it
            ALUOp = 6'b110000;
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 1; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            default: begin
            ALUOp = 6'bX;
            Branch = 1'bX;
            RegWrite = 1'bX;
            jump_target = 1'bX;
            ALUSrc = 1'bX;
            RegDst = 1'bX;
            MemWrite = 1'bX;
            MemRead = 1'bX;
            MemToReg = 1'bX; 
            jr = 1'bX; 
            store = 2'bX;
            load = 2'bX;
            jal = 1'bX;
            shift_mux = 1'bX;
            end
            
            endcase
            end
            
            //Immediate
            
            6'b001000: begin  //addi
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            ALUSrc = 1;
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b011100: begin  //mul
            ALUOp = 6'b111000;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            ALUSrc = 0;
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b000100: begin //beq
            ALUOp = 6'b100010;
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 0;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b001100: begin    //andi
            ALUOp = 6'b100100;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b001101: begin    //ori
            ALUOp = 6'b100101;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b001110: begin    //xori
            ALUOp = 6'b100110;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b001010: begin    //slti
            ALUOp = 6'b101010;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b000001: begin    //bgez or bltz
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 0;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            
            if(Instruction[20:16] == 0) begin
            ALUOp = 6'b001011;  end //bltz
            else if (Instruction[20:16] == 1) begin
            ALUOp = 6'b001000;  end //bgez
            end
            
            6'b000101: begin //bne
            ALUOp = 6'b001001;
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 0;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b000111: begin //bgtz
            ALUOp = 6'b001111;
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            6'b000110: begin //blez
            ALUOp = 6'b001010;
            Branch = 1;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end
            
            //jumps
            6'b000010: begin //j
            ALUOp = 6'b110000;
            Branch = 1;
            RegWrite = 0;
            jump_target = 1;
            ALUSrc = 1;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end 
            
            
            6'b000011: begin //jal
            ALUOp = 6'b110000;
            Branch = 1;
            RegWrite = 1;
            jump_target = 1;
            ALUSrc = 1;
            RegDst = 1;
            MemWrite = 0;
            MemRead = 0;
            MemToReg = 1; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 1;
            shift_mux = 0;
            end 
            
            //memory instructions
            //load
            6'b100011: begin //lw
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 1;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end 
            
            6'b100001: begin //lh
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 1;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 1;
            jal = 0;
            shift_mux = 0;
            end 
            
            6'b100000: begin //lb
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 1;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 0;
            MemRead = 1;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 2;
            jal = 0;
            shift_mux = 0;
            end 
            
            //store
            6'b101011: begin //sw
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 1;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 0;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end 
            
            6'b101001: begin //sh
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 1;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 1;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end 
            
            6'b101000: begin //sb
            ALUOp = 6'b100000;
            Branch = 0;
            RegWrite = 0;
            jump_target = 0;
            ALUSrc = 1;
            RegDst = 0;
            MemWrite = 1;
            MemRead = 0;
            MemToReg = 0; 
            jr = 0; 
            store = 2;
            load = 0;
            jal = 0;
            shift_mux = 0;
            end 
            
            default: begin
            ALUOp = 6'bX;
            Branch = 1'bX;
            RegWrite = 1'bX;
            jump_target = 1'bX;
            ALUSrc = 1'bX;
            RegDst = 1'bX;
            MemWrite = 1'bX;
            MemRead = 1'bX;
            MemToReg = 1'bX; 
            jr = 1'bX; 
            store = 2'bX;
            load = 2'bX;
            jal = 1'bX;
            shift_mux = 1'bX;
            end 
        
           
     endcase
     end
   end
endmodule