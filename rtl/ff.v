module sr_latch_nor_behavioral(

input S,R,
output reg Q

);

always @(*) begin

case({S,R})

2'b10:Q=1;
2'b01:Q=0;
2'b00:Q=Q;
2'b11:Q=1'bx;

endcase

end

endmodule

module gated_sr_latch(

input S,R,E,
output reg Q

);

always @(*) begin

if(E) begin

    case({S,R})
        2'b10:Q=1;
        2'b01:Q=0;
        2'b00:Q=Q;
        default:Q=1'bx;
    endcase

end

end

endmodule


module d_latch_behavioural(input D,E, output reg Q);

always @(*) begin
    if (E) begin

    Q=D;
    end

end
endmodule


module sr_ff(input S,R,CLK, output reg Q);

always @(negedge CLK) begin

    case({S,R}) begin
        2'b00: Q<=Q;
        2'b10: Q<=1'b1;
        2'b01: Q<=1'b0;
        2'b11: Q<=1'bx;
    endcase
end
endmodule

module sr_ff_behavioral(

input S,R,CLK,
output reg Q

);

always @(posedge CLK) begin

case({S,R})

2'b00:Q<=Q;
2'b10:Q<=1'b1;
2'b01:Q<=1'b0;
2'b11:Q<=1'bx;

endcase

end

endmodule

module jkff(input J,K,CLK, output reg Q);

always @(posedge clk) begin

    case ({J,K}) begin
        2'b00: Q<=Q;
        2'b01: Q<=1'b0;
        2'b10: Q<=1'b1;
        2'b11: Q<=~Q;
    endcase
end
endmodule

module dff(input D, CLK, output reg Q);

always @(posedge CLK)begin

    Q<=D;
end




endmodule

module t_ff(input T, CLK, output reg Q);

always @(posedge CLK) begin

    if (T) begin
    Q<=~Q;
    else
    Q<=Q;
    end
end
endmodule

