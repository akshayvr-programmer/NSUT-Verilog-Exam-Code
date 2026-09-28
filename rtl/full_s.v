module full_subtractor_dataflow(
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);

assign D = A ^ B ^ Bin;

assign Bout = (~A & B)
            | (~A & Bin)
            | (B & Bin);

endmodule

module full_subtractor_gate(
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);

wire nA;
wire x1;
wire w1,w2,w3;

not(nA,A);

xor(x1,A,B);
xor(D,x1,Bin);

and(w1,nA,B);

wire nx1;
not(nx1,x1);

and(w2,nx1,Bin);

or(Bout,w1,w2);

endmodule

module full_subtractor_behavioral(
    input A,
    input B,
    input Bin,
    output reg D,
    output reg Bout
);

always @(*) begin
    D = A ^ B ^ Bin;
    Bout = (~A & B)
         | (~A & Bin)
         | (B & Bin);
end

endmodule

module half_subtractor(
    input A,
    input B,
    output D,
    output Borrow
);

assign D = A ^ B;
assign Borrow = (~A) & B;

endmodule


module full_subtractor_structural(
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);

wire D1;
wire B1,B2;

half_subtractor HS1(A,B,D1,B1);
half_subtractor HS2(D1,Bin,D,B2);

or(Bout,B1,B2);

endmodule