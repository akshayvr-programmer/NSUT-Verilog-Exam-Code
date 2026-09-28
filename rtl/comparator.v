module comparator_data_flow(input A, input B, output GT, EQ, LT);

assign GT = A&~B;
assign EQ = ~(A^B);
assign LT = ~A&B;

endmodule

module comparator1_behavioral(
    input A,B,
    output reg GT,EQ,LT
);

always @(*) begin
    GT=(A>B);
    EQ=(A==B);
    LT=(A<B);
end

endmodule

module comparator2_dataflow(

input [1:0] A,B,
output GT,EQ,LT

);

assign EQ=(A[1]~^B[1])&(A[0]~^B[0]);

assign GT=(A[1]&~B[1])|
          ((A[1]~^B[1])&A[0]&~B[0]);

assign LT=(~A[1]&B[1])|
          ((A[1]~^B[1])&~A[0]&B[0]);

endmodule

module comparator4_behavioral(

input [3:0] A,B,
output reg GT,EQ,LT

);

always @(*) begin

GT=(A>B);
EQ=(A==B);
LT=(A<B);

end

endmodule

module comparator4_dataflow(

input [3:0] A,B,
output GT,EQ,LT

);

wire E3,E2,E1,E0;

assign E3=A[3]~^B[3];
assign E2=A[2]~^B[2];
assign E1=A[1]~^B[1];
assign E0=A[0]~^B[0];

assign EQ=E3&E2&E1&E0;

assign GT=(A[3]&~B[3])|
          (E3&A[2]&~B[2])|
          (E3&E2&A[1]&~B[1])|
          (E3&E2&E1&A[0]&~B[0]);

assign LT=(~A[3]&B[3])|
          (E3&~A[2]&B[2])|
          (E3&E2&~A[1]&B[1])|
          (E3&E2&E1&~A[0]&B[0]);

endmodule