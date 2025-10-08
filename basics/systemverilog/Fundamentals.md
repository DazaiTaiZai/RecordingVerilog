📚 Ultimate SystemVerilog System Functions Reference Guide

This document lists essential SystemVerilog (IEEE 1800) functions and compiler directives. These tools are critical for generating flexible hardware and for creating powerful testbenches.

Part 1: Compile-Time Functions (Synthesizable)

These functions execute during the compilation phase (elaboration/synthesis). They are primarily used with parameter or localparam to define bit widths, array sizes, or initial values.

Function

Category

Syntax

Purpose

$clog2(N)

Utility

localparam ADDR_W = $clog2(DEPTH);

Ceiling Log Base 2. Returns the minimum number of bits required to address (or encode) N unique items. Crucial for address bus sizing.

$bits(expression/type)

Utility

localparam BUS_SIZE = $bits(my_struct_t);

Bit Width. Returns the total number of bits required by the given expression, variable, or data type (e.g., a struct).

$left(array)

Array/Vector

for (i = $left(mem_array); i >= 0; i--)

Dimension Query. Returns the most significant index (left bound) of an array or vector.

$right(array)

Array/Vector

[WIDTH-1 : $right(array)]

Dimension Query. Returns the least significant index (right bound) of an array or vector.

$size(array)

Array/Vector

logic [WIDTH-1:0] mem[SIZE]; ... $size(mem)

Returns the number of elements in the first dimension of an array.

Part 2: Simulation/Debug Functions (Non-Synthesizable)

These functions are strictly for use in testbenches (initial or always blocks within a TB) and are ignored by synthesis tools. They are used for generating stimulus, monitoring, and debugging.

A. Output and Monitoring

Function

Syntax

Purpose

$display

$display("Error: Value is %d", val);

Prints formatted output to the simulation console, always adding a newline at the end.

$write

$write("Checking...");

Prints formatted output to the console without adding a newline.

$strobe

$strobe("Output %d", out);

Writes to the console at the end of the current time step, ensuring all concurrent processes have finished updating. Used for capturing stable output values.

$monitor

$monitor("Time=%0t, State=%s", $time, state);

Continuously monitors the listed variables and prints a new line only when one of them changes value.

$time

if ($time > 1000) $finish;

Returns the current simulation time (as an integer or time type, depending on format specifier).

B. Control and Error Handling

Function

Syntax

Purpose

$finish

if (test_pass) $finish;

Halts the simulation immediately. Always used at the end of the main test sequence.

$stop

$stop;

Pauses the simulation, leaving the current state open for interactive debugging.

$error

assert (a == b) else $error("A does not equal B");

Simulation Error. Reports an error message and increments the error count. Does not stop the simulation by default.

$fatal

assert (a == b) else $fatal(1, "Critical Failure");

Reports a fatal error and immediately terminates the simulation.

C. File I/O

Function

Syntax

Purpose

$fopen

integer file_handle = $fopen("results.txt", "w");

Opens a file and returns a handle (a unique identifier) for writing ("w") or appending ("a").

$fdisplay

$fdisplay(file_handle, "Data: %h");

Writes formatted output to the specified file handle.

$fclose

$fclose(file_handle);

Closes the file handle, flushing any buffered data to the disk. Crucial to call this.

Part 3: Compiler Directives (Metadata)

These change how the compiler processes the code, often used for modularity and conditional compilation.

Directive

Syntax

Purpose

`include

`include "my_package.svh"

Text Substitution. Inserts the entire contents of the specified file directly at the point of the directive. Used for headers (.svh) and common definitions.

`define

`define DEBUG_ON 1

Text Macro. Creates a simple text macro. Used for conditional compilation or short global constants (though parameter is preferred for synthesizable constants).

`ifdef / `ifndef

`ifdef DEBUG_ON ... `endif

Conditional Compilation. Compiles the code block only if the following macro is defined (ifdef) or not defined (ifndef). Used to include debug code only during simulation.

`timescale

`timescale 1ns/1ps

Timing Units. Defines the time unit and time precision for the module. Crucial for accurate simulation timing.