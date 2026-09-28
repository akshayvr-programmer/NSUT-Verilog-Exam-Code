module jkff (
    input  j,
    input  k,
    input  clk,
    output reg q,
    output reg q_bar
);

    reg next_q;

    always @(*) begin
        case ({j, k})
            2'b00: next_q = q;
            2'b01: next_q = 1'b0;
            2'b10: next_q = 1'b1;
            2'b11: next_q = ~q;
        endcase
    end

    always @(posedge clk) begin
        q     <= next_q;
        q_bar <= ~next_q;
    end

endmodule
