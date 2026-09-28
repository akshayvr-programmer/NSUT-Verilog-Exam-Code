module ripple_counter(input CLK, output reg [2:0] Q);

always @(posedge CLK) begin
    Q[0] <= ~Q[0];

always @(posedge Q[0]) begin
    Q[1] <= ~Q[1];

always @(posedge Q[1]) begin
    Q[2] <= ~Q[2];

endmodule

module sync_counter(
input CLK,
output reg [2:0] Q
);

always @(posedge CLK)
Q<=Q+1;

endmodule


module updowncounter(input CLK, input mode, output reg [2:0] Q);

always @(posedge CLK) begin

    if (mode)
    Q<=Q+1;
    else
    Q<=Q-1;
end
endmodule
