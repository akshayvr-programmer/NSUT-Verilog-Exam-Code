module even_parity_generator(input [3:0] D, output P);

assign P = D[3]^D[2]^D[1]^D[0];

endmodule

module odd_parity_generator(input [3:0] D, output P);

assign P = ~(D[3]^D[2]^D[1]^D[0]);

endmodule


module even_parity_checker(input [3:0] D, input P, output error);

assign error = D[3]^D[2]^D[1]^D[0]^P;

endmodule

module odd_parity_checker(input [3:0] D, input P, output error);

assign error = ~(D[3]^D[2]^D[1]^D[0]^P);


endmodule