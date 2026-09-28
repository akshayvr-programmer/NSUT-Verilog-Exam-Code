module ripple_carry_adder(input [3:0] A, input [3:0] B, input cin, output [3:0] sum, output cout);

wire c1,c2,c3;

full_adder FA0(A[0], B[0], cin, sum[0], c1);
full_adder FA0(A[1], B[1], cin, sum[1], c2);
full_adder FA0(A[2], B[2], cin, sum[2], c3);
full_adder FA0(A[3], B[3], cin, sum[3], cout);

endmodule
