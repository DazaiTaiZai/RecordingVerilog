// sr_ff_simple.v
// Basic SR Flip-Flop using positive edge-triggered clock

module sr_ff_simple (
    input wire S,      // Set input
    input wire R,      // Reset input
    input wire clk,    // Clock
    output reg Q       // Output
);

    always @(posedge clk) begin
        if (S && !R)        // Set condition
            Q <= 1;
        else if (!S && R)   // Reset condition
            Q <= 0;
        else if (S && R)    // Invalid condition
            Q <= 1'bx;      // Optional: indicate invalid
        // else: S=0 & R=0 → hold (Q keeps previous value)
    end

endmodule
// instead of using S== 0 and R == 0 we will use !S and !R inplace of 0s.