module half_adder_gate(
    input A,
    input B,
    output Sum,
    output Carry
); 

always @(*) begin
    Sum = A^B;
    Carry = A&B;
end

endmodule

