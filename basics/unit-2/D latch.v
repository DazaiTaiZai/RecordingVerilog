module d_latch (
    input wire D, EN,
    output reg Q,
    output reg Qbar
);

reg S, R;  // Internal signals (optional, not inputs)

always @(*) begin
    // Generate S and R internally
    S = D & EN;
    R = ~D & EN;

    if (S && R) begin
        Q    = 1'bx;  // invalid, shouldn't happen
        Qbar = 1'bx;
    end else if (S) begin
        Q    = 1'b1;
        Qbar = 1'b0;
    end else if (R) begin
        Q    = 1'b0;
        Qbar = 1'b1;
    end // else hold automatically
end

endmodule
