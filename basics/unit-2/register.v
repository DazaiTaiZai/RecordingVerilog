module register (
    input wire clk,
    input wire reset,       // synchronous reset
    input wire [3:0] D,     // 4-bit input
    output reg [3:0] Y      // 4-bit output (stored value)
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Y <= 4'b0000;   // reset output to 0
        end
        else begin
            Y <= D;         // load input D into register
        end
    end

endmodule
