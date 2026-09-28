`timescale 1ns/1ps

module tb_rca;

    reg [3:0] A,B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder uut(A,B,Cin,Sum,Cout);

    initial begin

        $display(" A     B   Cin | Cout Sum");
        $monitor("%b %b %b | %b %b",A,B,Cin,Cout,Sum);

        A=4'b0011; B=4'b0101; Cin=0; #10;
        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1010; B=4'b0110; Cin=1; #10;
        A=4'b1001; B=4'b1001; Cin=0; #10;

        $finish;

    end

endmodule
