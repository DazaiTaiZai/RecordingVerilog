module tff (
    input wire clk,
    input wire Tff,
    input wire reset,
    output reg Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if (Tff)
            Q <= ~Q;    // toggle only when T=1
        else
            Q <= Q;     // hold value when T=0
    end
endmodule


module counter_ff(
    input clk ,
    input Tff,
    input reset, 
    output reg [3:0] Q
);

    tff ff0 (.clk(clk) , .reset(reset) , .Tff(1'b1) , .Q(Q[0]))
    tff ff1 (.clk(Q[0] , .reset(reset) , ,Tff(1'b1) , .Q(Q[1]))
    tff ff2 (.clk(Q[1]) , .reset(reset) , .Tff(1'b1) , .Q(Q[2]))
    tff ff3 (.clk(Q[2]) , .reset(reset) , .Tff(1'b1) , .Q(Q[3]))
endmodule
