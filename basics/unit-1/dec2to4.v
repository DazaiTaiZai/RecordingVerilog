// decoder 2bit to 4bit (decimal is used in the case context to explain like , we can use the 4bit thing to actually rep upto 15 decimal , since it is 2^n -1 )

module dec2to4 (
    input  [1:0] in,   // 2-bit input
    input        dc,   // enable (1-bit)
    output reg [3:0] W // 4-bit output
);
    integer k;

    always @(in, dc) begin
        if (dc) begin
            W = 4'b0000;  // clear output first
            for (k = 0; k < 4; k = k + 1) begin
                if (in == k)
                    W[k] = 1'b1;  // set the active line
            end
        end
        else begin
            W = 4'b0000; // if not enabled, all zero
        end
    end
endmodule


// output assigning would look like this:-
// in = 2'b00 → W = 0001

// in = 2'b01 → W = 0010

// in = 2'b10 → W = 0100

// in = 2'b11 → W = 1000
