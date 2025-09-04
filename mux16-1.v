// 4-to-1 MUX
module mux4to1( 
    input [3:0] d,             // inputs under d
    input [1:0] sel,           // 2-bit selector line
    output reg y
);
    always @(*) begin
        case (sel)
            2'b00: y = d[0];
            2'b01: y = d[1];
            2'b10: y = d[2];
            2'b11: y = d[3];
        endcase
    end
endmodule


// 16-to-1 MUX using 4-to-1 MUXes
module mux16to1 (
    input [15:0] d,
    input [3:0] sel,
    output y
);
    wire [3:0] st1_out;

    // First stage (4 x 4:1 MUX)
    mux4to1 m0 (.d(d[3:0]),    .sel(sel[1:0]), .y(st1_out[0]));
    mux4to1 m1 (.d(d[7:4]),    .sel(sel[1:0]), .y(st1_out[1]));
    mux4to1 m2 (.d(d[11:8]),   .sel(sel[1:0]), .y(st1_out[2]));
    mux4to1 m3 (.d(d[15:12]),  .sel(sel[1:0]), .y(st1_out[3]));

    // Second stage (final 4:1 MUX)
    mux4to1 m4 (.d(st1_out), .sel(sel[3:2]), .y(y));
endmodule

    