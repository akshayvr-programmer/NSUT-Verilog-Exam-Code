module demux2(input D, input S, output Y0, output Y1);

assign Y0 = (~S)&D;
assign Y1 = S&D;

endmodule

module demux4(input D, input S0, input S1, output Y3, output Y2, output Y1, output Y0);

assign Y0 = (~S1)&(~S0)&D;
assign Y1 = (~S1)&(S0)&D;
assign Y2 = (S1)&(~S0)&D;
assign Y3 = (S1)&(S0)&D;

endmodule



