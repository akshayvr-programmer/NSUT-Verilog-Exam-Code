module register4(input CLK, input [3:0] D, output [3:0] Q);

always @(posedge CLK) begin
    Q<=D;
end

endmodule

module register4_load(

input CLK,
input LOAD,
input [3:0] D,
output reg [3:0] Q

);

always @(posedge CLK) begin

if(LOAD)
Q<=D;

end

endmodule

module register4_structural(

input CLK,
input [3:0] D,
output [3:0] Q

);

d_ff FF0(D[0],CLK,Q[0]);
d_ff FF1(D[1],CLK,Q[1]);
d_ff FF2(D[2],CLK,Q[2]);
d_ff FF3(D[3],CLK,Q[3]);

endmodule

module siso_shift_register(input CLK, input SI, output SO);

reg [3:0] Q;

always (@posedge CLK) begin
    Q<={Q[2:0], SI};
end

assign S0 = Q[3];

endmodule

module siso_structural(

input CLK,
input SI,
output SO

);

wire q0,q1,q2,q3;

d_ff FF0(SI,CLK,q0);
d_ff FF1(q0,CLK,q1);
d_ff FF2(q1,CLK,q2);
d_ff FF3(q2,CLK,q3);

assign SO=q3;

endmodule


module sipo_shift_register(input CLK, input SI, output reg [3:0] Q);

always @(posedge CLK) begin
    Q<={Q[2:0], SI};
end


endmodule

module sipo_structural(

input CLK,
input SI,
output [3:0] Q

);

d_ff FF0(SI,CLK,Q[0]);
d_ff FF1(Q[0],CLK,Q[1]);
d_ff FF2(Q[1],CLK,Q[2]);
d_ff FF3(Q[2],CLK,Q[3]);

endmodule

module piso_shift_register(input CLK, input LOAD, input [3:0] P, output SO);

reg [3:0] Q;

always @(posedge CLK) begin
    if (LOAD) begin
        Q<=P;
    else
        Q<={1'b0, Q[3:1]};
    end
end

assign SO = Q[0];
endmodule


module pipo_register(

input CLK,
input [3:0] P,
output reg [3:0] Q

);

always @(posedge CLK)
Q<=P;

endmodule

module pipo_load(

input CLK,
input LOAD,
input [3:0] P,
output reg [3:0] Q

);

always @(posedge CLK) begin

if(LOAD)
Q<=P;

end

endmodule



module pipo_full(

input CLK,
input CLR,
input LOAD,
input [3:0] P,
output reg [3:0] Q

);

always @(posedge CLK or posedge CLR) begin

if(CLR)
Q<=4'b0000;

else if(LOAD)
Q<=P;

end

endmodule

module pipo_structural(

input CLK,
input [3:0] P,
output [3:0] Q

);

d_ff FF0(P[0],CLK,Q[0]);
d_ff FF1(P[1],CLK,Q[1]);
d_ff FF2(P[2],CLK,Q[2]);
d_ff FF3(P[3],CLK,Q[3]);

endmodule

module bidirectional_shift(input CLK, DIR, SL_in, SR_in, output reg [3:0] Q);

always @(posedge CLK) begin
    if (DIR)
    Q<={Q[2:0], SL_in};

    else 
    Q<= {SR_IN, Q[3:1]};
end
endmodule

module universal_shift(

input CLK,
input [1:0] SEL,
input SL_in,
input SR_in,
input [3:0] P,
output reg [3:0] Q

);

always @(posedge CLK) begin

case(SEL)

2'b00:Q<=Q;

2'b01:Q<={SR_in,Q[3:1]};

2'b10:Q<={Q[2:0],SL_in};

2'b11:Q<=P;

endcase

end

endmodule