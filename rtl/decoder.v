module decoder2to4_gate(
    input A,B,
    output Y0,Y1,Y2,Y3
);

wire nA,nB;

not(nA,A);
not(nB,B);

and(Y0,nA,nB);
and(Y1,nA,B);
and(Y2,A,nB);
and(Y3,A,B);

endmodule

module decoder2to4_dataflow(
    input A,B,
    output Y0,Y1,Y2,Y3
);

assign Y0 = ~A & ~B;
assign Y1 = ~A & B;
assign Y2 = A & ~B;
assign Y3 = A & B;

endmodule


module decoder2to4_behavioral(
    input [1:0] A,
    output reg [3:0] Y
);

always @(*) begin

    case(A)
      

        2'b00: Y=4'b0001;
        2'b01: Y=4'b0010;
        2'b10: Y=4'b0100;
        2'b11: Y=4'b1000;

    endcase
end
endmodule
