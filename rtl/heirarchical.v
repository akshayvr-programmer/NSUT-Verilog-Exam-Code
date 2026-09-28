module decoder2to4_enable(
    input E,
    input [1:0] A,
    output [3:0] Y
);

assign Y[0]=E&~A[1]&~A[0];
assign Y[1]=E&~A[1]&A[0];
assign Y[2]=E&A[1]&~A[0];
assign Y[3]=E&A[1]&A[0];

endmodule

module decoder4to16_structural(

    input [3:0] A,
    output [15:0] Y

);

wire [3:0] E;

decoder2to4_dataflow upper(

    .A(A[3:2]),
    .Y0(E[0]),
    .Y1(E[1]),
    .Y2(E[2]),
    .Y3(E[3])

);

decoder2to4_enable D0(E[0],A[1:0],Y[3:0]);
decoder2to4_enable D1(E[1],A[1:0],Y[7:4]);
decoder2to4_enable D2(E[2],A[1:0],Y[11:8]);
decoder2to4_enable D3(E[3],A[1:0],Y[15:12]);

endmodule

