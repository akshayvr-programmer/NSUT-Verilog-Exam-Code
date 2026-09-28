`timescale 1ns/1ps

module tb;

    // Inputs
    reg A, B;

    // Outputs
    wire Carry, Sum;

    // Instantiate the DUT (Device Under Test)
    half_adder_gate uut (
        .A(A),
        .B(B),
        .Carry(Carry),
        .Sum(Sum)
    );

    initial begin
        $display("A B | C S");
        $display("-----------");
        $monitor("%b %b | %b %b", A, B, Carry, Sum);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;

        $finish;
    end

endmodule