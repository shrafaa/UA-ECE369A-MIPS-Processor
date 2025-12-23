`timescale 1ns / 1ps

module HazardDetection(

    input PCSrc,
    input j,
    input jr,
    
    input MemRead_IDEX,
    
    output reg PCWrite, IFIDWrite, ControlMux, flush

    );
    
    
    always @(*) begin
    
        PCWrite = 1;
        IFIDWrite = 1;
        ControlMux = 0;
        flush = 0;
        
        if (PCSrc || j || jr) begin
            PCWrite = 1;
            IFIDWrite = 1;
            ControlMux = 1;
            flush = 1;
            
        end
        
        if (MemRead_IDEX) begin
            PCWrite = 0;
            IFIDWrite = 0;
            ControlMux = 1;
            flush = 0;
        end        
    
    end
    
    
endmodule
