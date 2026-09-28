module full_adder(input a, input b, input cin, output y, output cout);

always @(*) begin
    {cout, y} = A+B+Cin;
end


endmodule
