module jkff (
    input J, K,
    input clk,
    output reg Q
);

    always @(posedge clk) begin
        case ({J, K})
            2'b00: Q <= Q;      // hold
            2'b01: Q <= 1'b0;   // reset
            2'b10: Q <= 1'b1;   // set
            2'b11: Q <= ~Q;     // toggle
        endcase
    end

endmodule
