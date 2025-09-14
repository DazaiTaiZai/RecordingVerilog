module Dff (
    input clk, 
    input  D,
    output reg Y

);
    always @(posedge clk) begin
        if (clk) begin
            Y <= D;

        end
        
    
    end
    
endmodule