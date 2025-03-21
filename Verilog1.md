# What is a module and a testbench?
## A module is basically a function kind of thing which allows you to define a let's say a simple and gate. You have to specify the name of the module and then all you have to do is to provide the details of the actual function of the module below the module specification and an end module command is used at the end to end the module.
## Testbench in simple lang is just using modules with intervals of input and output , mainly known as reg and wire , for ex if your module has two inputs A and B , output as Y , then the testbench for same will have the reg as A and B , wire for it will be Y. You'll understand more about it when we get to the basic codes.

## tip - create seprate files for Tb and Mdl.

# Let’s assume you have a Boolean function F = A & B.
## You'll create two Verilog files:

# 1. Module File (boolean_expr.v)
verilog(lang)
// boolean_expr.v (Design Under Test - DUT)
module boolean_expr (
    input wire A, B,
    output wire F
);
    assign F = A & B;  // AND operation
endmodule
📌 Key points:

This defines only the logic.
It does not include initial blocks or $monitor—that's the testbench’s job.
# 2. Testbench File (boolean_tb.v)
// boolean_tb.v (Testbench)
`timescale 1ns / 1ps  // Define time unit and precision

module testbench;
    reg A, B;
    wire F;
    
    // Instantiate the boolean_expr module
    boolean_expr uut (
        .A(A),
        .B(B),
        .F(F)
    );

    initial begin
        $monitor("A=%b B=%b | F=%b", A, B, F);
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        $finish;
    end
endmodule
## Key points:

The testbench instantiates the DUT using uut (Unit Under Test).
It does not define new outputs, just connects to DUT.
Uses initial blocks to drive test cases.

## How to Compile & Simulate?
Using Icarus Verilog (iverilog):
If both files are in the same directory, compile and run them together:

### Drag your terminal up and do this :-

iverilog -o simv boolean_expr.v boolean_tb.v
vvp simv
iverilog -o simv → Compiles both files into a simulation executable (simv).
vvp simv → Runs the compiled simulation.
