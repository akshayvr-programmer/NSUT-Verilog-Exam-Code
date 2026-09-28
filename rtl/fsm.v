module mealy_101_overlap(
    input clk,
    input rst,
    input x,
    output reg y
);

    typedef enum reg [1:0] {S0,S1,S2} state_t;
    state_t state,next;

    always @(posedge clk or posedge rst)
        if(rst) state<=S0;
        else state<=next;

    always @(*) begin
        y=0;
        case(state)

            S0: next=x?S1:S0;

            S1: next=x?S1:S2;

            S2: begin
                if(x) begin
                    next=S1;
                    y=1;
                end
                else
                    next=S0;
            end
        endcase
    end

endmodule

module synchronizer(
input clk,
input async_in,
output reg sync_out
);

reg ff1;

always @(posedge clk) begin
ff1<=async_in;
sync_out<=ff1;
end

endmodule
