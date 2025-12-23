`timescale 1ns / 1ps


module MEM_WB_reg(

    input clk, rst,
    
    // Write content for register
    input [31:0] LoadMuxOutput, JAL_WDMux_Output,
    
    // Write Address for register file
    input [4:0] JAL_RDMux_Output,
    
    // Control Signal Inputs
    input RegWrite_EXMEM, MemToReg_EXMEM,
    
    // Write content for register outputs
    output reg [31:0] LoadMuxOutput_MEMWB, JAL_WDMux_Output_MEMWB,
    
    // Write Address for register file output
    output reg [4:0] JAL_RDMux_Output_MEMWB,
    
    // Control Signal Outputs
    output reg RegWrite_MEMWB, MemToReg_MEMWB


    );
    
    always @(posedge clk) begin
    
        if (rst) begin
        
            LoadMuxOutput_MEMWB <= 0;
            JAL_WDMux_Output_MEMWB <= 0;
            JAL_RDMux_Output_MEMWB <= 0;
            RegWrite_MEMWB <= 0;
            MemToReg_MEMWB <= 0;
            
        end
        
        else begin
        
            LoadMuxOutput_MEMWB <= LoadMuxOutput;
            JAL_WDMux_Output_MEMWB <= JAL_WDMux_Output;
            JAL_RDMux_Output_MEMWB <= JAL_RDMux_Output;
            RegWrite_MEMWB <= RegWrite_EXMEM;
            MemToReg_MEMWB <= MemToReg_EXMEM;
            
        end    
    
    end
    
endmodule

