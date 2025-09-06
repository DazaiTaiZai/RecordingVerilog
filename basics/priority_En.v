// To avoid conflict among the input bits in encoders . we use the priority system to determine what shoudl be observed under the encoder terminal 

module priority_encoder_4to2(
    input  [3:0] I,    // 4 inputs: I3 (highest) to I0 (lowest)
    output reg [1:0] Y // 2-bit output
);

always @(*) begin
    if (I[3])        // Check the highest priority first
        Y = 2'b11;   // I3 active
    else if (I[2])
        Y = 2'b10;   // I2 active
    else if (I[1])
        Y = 2'b01;   // I1 active
    else if (I[0])
        Y = 2'b00;   // I0 active
    else
        Y = 2'b00;   // No input active
end

endmodule
