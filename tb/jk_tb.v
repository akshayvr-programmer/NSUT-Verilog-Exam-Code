`timescale 1ns/1ps

module jkff_tb;

    reg j, k, clk;
    wire q, q_bar;

    jkff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("jkff.vcd");
        $dumpvars(0, jkff_tb);

        $display("Time\tclk\tj\tk\tq\tq_bar");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, j, k, q, q_bar);

        clk = 0;
        {j, k} = 2'b00;

        #10 {j, k} = 2'b10;   // set
        #10 {j, k} = 2'b01;   // reset
        #10 {j, k} = 2'b11;   // toggle
        #10 {j, k} = 2'b11;   // toggle again
        #10 {j, k} = 2'b00;   // hold

        #20 $finish;
    end

endmodule
