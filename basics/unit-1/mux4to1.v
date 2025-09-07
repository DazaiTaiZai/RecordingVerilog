module mux4to1(
    input s1 , s2,

    input a , b, c , d,

    output reg Y
);
    always @(*) begin
        case ({s1 , s2}) //  we have to use the {} inside the param of the case to provide the two bit vector seprately since the verilog case demands a one bit vector ... what we could do additionally to work upon this is create a diff reg or var like sel = {s1, s2} then impor this as the one bit required vecotr to the case statement. 

        2'b00: Y = a;
        2'b01: Y = b;
        2'b10: Y = c;
        2'b11: Y = d;
             
        endcase
    end
endmodule


`timescale 1ns/1ps   // simulation time unit / precision

module mux4to1_tb;

    // Testbench signals (regs drive inputs, wires get outputs)
    reg a, b, c, d;
    reg s1, s2;    // <--  match DUT instead of using sel[1:0]
    wire y;

    // Instantiate the DUT
    mux4to1 dut (
        .a(a), .b(b), .c(c), .d(d),
        .s1(s1), .s2(s2),   // <-- connect s1, s2 directly
        .Y(y)
    );

    // Stimulus
    initial begin
        // initialize inputs
        a = 0; b = 0; c = 0; d = 0; s1 = 0; s2 = 0;

        // apply test patterns
        #10 a = 1; s1 = 0; s2 = 0;   // expect y = a
        #10 b = 1; s1 = 0; s2 = 1;   // expect y = b
        #10 c = 1; s1 = 1; s2 = 0;   // expect y = c
        #10 d = 1; s1 = 1; s2 = 1;   // expect y = d
        #10 $finish;                 // end simulation
    end

    // Monitor changes (prints values during simulation)
    initial begin
        $monitor("Time=%0t | s1=%b s2=%b | a=%b b=%b c=%b d=%b | y=%b",
                 $time, s1, s2, a, b, c, d, y);
    end

endmodule
