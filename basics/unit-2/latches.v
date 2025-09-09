module sr_latch (
    input wire S,     // Set input
    input wire R,     // Reset input
    output reg Q,     // Main output
    output reg Qbar   // Complement output
);

always @(*) begin
    if (S && R) begin
        // Invalid condition
        Q     = 1'bx;   // Unknown
        Qbar  = 1'bx;
    end 
    else if (S) begin
        Q     = 1'b1;   // Set
        Qbar  = 1'b0;
    end 
    else if (R) begin
        Q     = 1'b0;   // Reset
        Qbar  = 1'b1;
    end 
    // Hold state
    else begin
        Q     = Q;      // keep previous input whatever it was be it reset = 0 or set = 1 : )
        Qbar  = Qbar;
    end
end

endmodule
