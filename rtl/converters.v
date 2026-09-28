module binary_to_gray_dataflow(

input [3:0] B,
output [3:0] G

);

assign G[3]=B[3];
assign G[2]=B[3]^B[2];
assign G[1]=B[2]^B[1];
assign G[0]=B[1]^B[0];

endmodule

module binary_to_gray_behavioral(

input [3:0] B,
output reg [3:0] G

);

always @(*) begin

G[3]=B[3];
G[2]=B[3]^B[2];
G[1]=B[2]^B[1];
G[0]=B[1]^B[0];

end

endmodule

module xor_gate(

input A,B,
output Y

);

assign Y=A^B;

endmodule

module gray_to_binary_dataflow(

input [3:0] G,
output [3:0] B

);

assign B[3]=G[3];
assign B[2]=G[3]^G[2];
assign B[1]=G[3]^G[2]^G[1];
assign B[0]=G[3]^G[2]^G[1]^G[0];

endmodule


module binary_to_bcd(input [3:0] B, output reg [3:0] Tens, output reg [3:0] Ones);

always @(*) begin
    if (B<=9) begin
        Tens = 4'b0000;
        Ones = B;
    end

    else begin
        Tens = 4'b0001;
        Ones = B-4'd10;
    end

end
endmodule

module bcd_to_binary(input [3:0] BCD, output [3:0] Binary);


assign Binary = BCD;

endmodule

module binary_to_excess3(input [3:0] B, output reg [3:0] E);

always @(*) begin

    if (B<=9) begin
        E = B + 4'd3;
    else
        E = 4'b0000;
    end
end

endmodule

module bcd_to_excess3(input [3:0] BCD, output [3:0] E);

assign E = BCD+4'b0011;

endmodule

module excess3_to_bcd(

input [3:0] E,
output reg [3:0] BCD

);

always @(*) begin

if(E>=4'd3 && E<=4'd12)
    BCD=E-4'd3;
else
    BCD=4'b0000;

end

endmodule
