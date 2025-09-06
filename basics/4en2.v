// basic 4 to 2 encoder for the digital hardware circuits 
module 4en2 (
    input [3:0] in,
    input en , 
    output reg [1:0] Y
);
    always @(en ,in) begin
        case (in)
            4'b0001: Y = 2'b00
            4'b0010: Y = 2'b01
            4'b1000: Y = 2'b11
            4'b0100 Y = 2'b10

             
        endcase
    end
    
endmodule