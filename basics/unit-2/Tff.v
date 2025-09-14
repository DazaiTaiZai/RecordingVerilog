module Tff (
    input T, 
    output reg Q,
    input clk
);
    always @(posedge clk) begin
        case (T)
            1'b0: Q <= Q;
            1'b1: Q <= ~Q; 
            
        endcase
    end
endmodule