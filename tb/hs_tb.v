`timescale 1ns/1ps

module tb_half_subtractor;

reg A,B;
wire D,borrow;

half_subtractor_gate uut(A,B,D,borrow);

initial begin

$display("A B | D Borrow");
$monitor("%b %b | %b %b",A,B,D,borrow);


A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;

$finish;

end

endmodule