module encoder4(input [3:0] D, output [1:0] Y);

assign Y[1] = D[2]|D[3];
assign Y[0] = D[1]|D[2];

endmodule

module encoder8to3_gate(
    input D0,D1,D2,D3,D4,D5,D6,D7,
    output Y2,Y1,Y0
);

or(Y2,D4,D5,D6,D7);
or(Y1,D2,D3,D6,D7);
or(Y0,D1,D3,D5,D7);

endmodule

module encoder8to3_behavioral(
    input D0,D1,D2,D3,D4,D5,D6,D7,
    output reg [2:0] Y
);

always @(*) begin
    if(D0) Y=3'b000;
    else if(D1) Y=3'b001;
    else if(D2) Y=3'b010;
    else if(D3) Y=3'b011;
    else if(D4) Y=3'b100;
    else if(D5) Y=3'b101;
    else if(D6) Y=3'b110;
    else if(D7) Y=3'b111;
    else Y=3'b000;
end

endmodule


module encoder8to3_case(
    input [7:0] D,
    output reg [2:0] Y
);

always @(*) begin
    case(D)
        8'b00000001: Y=3'b000;
        8'b00000010: Y=3'b001;
        8'b00000100: Y=3'b010;
        8'b00001000: Y=3'b011;
        8'b00010000: Y=3'b100;
        8'b00100000: Y=3'b101;
        8'b01000000: Y=3'b110;
        8'b10000000: Y=3'b111;
        default: Y=3'b000;
    endcase
end

endmodule

module decimal_encoder_gate(
    input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,
    output B3,B2,B1,B0
);

or(B3,D8,D9);
or(B2,D4,D5,D6,D7);
or(B1,D2,D3,D6,D7);
or(B0,D1,D3,D5,D7,D9);

endmodule

