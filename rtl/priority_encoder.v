module priority_encoder_data(input D3, D2, D1, D0, output Y1, Y0, V);

assign Y1 = D3 | D2;
assign Y0 = D3 | (~D2&D1);
assign V = D3|D2|D1|D0;
endmodule


module priority_encoder4to2_behavioral(
    input D3,D2,D1,D0,
    output reg [1:0] Y,
    output reg V
);

always @(*) begin

    V = D3|D2|D1|D0;

    if(D3)
        Y=2'b11;
    else if(D2)
        Y=2'b10;
    else if(D1)
        Y=2'b01;
    else
        Y=2'b00;

end

endmodule

module priority_encoder_4to2_case(input [3:0] D, output reg [1:0] Y, output reg V);

always @(*) begin

    casex(D) 
        
        4'b1xxx: begin Y=2'b11; V = 1; end;
        4'b01xx: begin Y=2'b10; V = 1; end;
        4'b001x: begin Y=2'b01; V = 1; end;
        4'b0001: begin Y=2'b00; V = 0; end;
    endcase

end
endmodule


module priority_encoder8to3(
    input [7:0] D,
    output reg [2:0] Y,
    output reg V
);

always @(*) begin

    casex(D)

        8'b1xxxxxxx: begin Y=3'b111; V=1; end
        8'b01xxxxxx: begin Y=3'b110; V=1; end
        8'b001xxxxx: begin Y=3'b101; V=1; end
        8'b0001xxxx: begin Y=3'b100; V=1; end
        8'b00001xxx: begin Y=3'b011; V=1; end
        8'b000001xx: begin Y=3'b010; V=1; end
        8'b0000001x: begin Y=3'b001; V=1; end
        8'b00000001: begin Y=3'b000; V=1; end
        default: begin Y=3'b000; V=0; end

    endcase

end

endmodule