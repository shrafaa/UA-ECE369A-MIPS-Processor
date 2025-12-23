`timescale 1ns / 1ps


module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [5:0] ALUControl;
                                
	input signed [31:0] A, B;	    

	output reg[31:0] ALUResult;	
	output reg Zero;	    

    always @(*) begin
        case(ALUControl)
        6'b000000: begin //sll
            ALUResult <= A << B; end
        6'b000010: begin //srl
            ALUResult <= A >> B; end
        6'b100000: begin //add & addi
            ALUResult <= A + B; end
        6'b100010: begin //sub, beq
            ALUResult <= A - B; end
        6'b111000: begin //mul
            ALUResult <= A * B; end
        6'b100100: begin  //and, andi
            ALUResult <= A & B; end
        6'b100101: begin //or, ori
            ALUResult <= A | B; end
        6'b100111: begin //nor
            ALUResult <= ~(A | B); end
        6'b100110: begin //xor
            ALUResult <= A ^ B; end
        6'b101010: begin //slt, slti
            ALUResult <= (A < B); end
        6'b001000: begin //bgez
            ALUResult <= A < 0; end
        6'b001001: begin  //bne
            ALUResult <= (A == B); end
        6'b001010: begin //blez
            ALUResult <= A > 0; end
        6'b001011: begin //bltz
            ALUResult <= A >= 0; end
        6'b001111: begin //bgtz
            ALUResult <= A <= 0; end
        6'b110000: begin //j
            ALUResult <= 0; end
        
        default: begin
            ALUResult <= 32'bX; end
        
        endcase
        
         Zero = (ALUResult == 0) ? 1 : 0; 
    end 
    
endmodule
