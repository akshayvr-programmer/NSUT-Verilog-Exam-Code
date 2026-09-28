module mux4(input I0, I1, I2, I3, input [1:0] S, output Y);

assign Y = S==2'b00 ? I0 :
           S==2'b01 ? I1 :
           S==2'b10 ? I2 :
           S==2'b11 ? I3;
endmodule
