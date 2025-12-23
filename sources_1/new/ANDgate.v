`timescale 1ns / 1ps


module ANDgate(Branch, zero, out);
    input Branch, zero; 
    output reg out;
    
    always @(*) begin
    if (Branch == 1 && zero == 1) begin
        out = 1; end
    else begin
        out = 0; end
        end
        

endmodule
