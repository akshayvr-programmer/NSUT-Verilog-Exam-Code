module mealy_101(
    input clk,
    input rst,
    input x,
    output reg z
);

typedef enum reg[1:0] {S0,S1,S2} state_t;

state_t state,next;

always @(posedge clk)
begin
    if(rst)
        state<=S0;
    else
        state<=next;
end

always @(*)
begin
    next=state;
    z=0;

    case(state)

    S0:
        if(x)
            next=S1;

    S1:
        if(x)
            next=S1;
        else
            next=S2;

    S2:
        if(x)
        begin
            next=S1;
            z=1;
        end
        else
            next=S0;
    endcase
end

endmodule
