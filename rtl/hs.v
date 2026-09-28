module half_subtractor_gate(input A, input B, output D, output borrow);
wire nA;

xor(D, A, B);

not(nA, A);

and(borrow, nA, B);

endmodule

module half_subtractor_dataflow(input A, input B, output D, output borrow);

assign D = A ^ B;
assign borrow = (~A)&B;

endmodule
module half_subtractor_behavioral(
    input A,
    input B,
    output reg D,
    output reg Borrow
);

always @(*) begin
    D = A ^ B;
    Borrow = (~A) & B;
end

endmodule
