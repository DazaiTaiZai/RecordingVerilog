

module counter (
        input  logic        clk,      // Clock input
        input  logic        rst_n,    // Active-low synchronous reset
        input  logic        en,       // Enable signal for counting
        output logic [3:0]  count     // 4-bit counter output
);

// Always block triggered on the rising edge of the clock
always_ff @(posedge clk) begin
        if (!rst_n) begin
                
                count <= 4'd0;
        end else if (en) begin
                // If enable is high, increment the counter
                count <= count + 1;
        end
        // If enable is low, retain the current value of count
end

endmodule