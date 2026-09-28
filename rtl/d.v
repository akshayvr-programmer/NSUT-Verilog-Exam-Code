module dff (input d, output reg q, input clk, output reg q_bar);
     always @(posedge clk) begin
        
        q <= d;
        q_bar <= ~d;

     end

    
endmodule