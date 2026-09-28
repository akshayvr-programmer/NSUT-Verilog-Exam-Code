module mux2_gate(input A, B, S, output Y);

wire nS, w1, w2;

not(nS, S);
and(w1, A, nS);
and(w2, S, B);

or(Y, w1,w2);

endmodule

