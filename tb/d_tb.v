`timescale 1ns/1ps

module dff_tb;

    reg d, clk;
    wire q, q_bar;

    dff uut (
        .d(d),
        .clk(clk),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0, dff_tb);

        // truth table header
        $display("Time\tclk\td\tq\tq_bar");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, q_bar);

        clk = 0;
        d   = 0;

        #7  d = 1;
        #10 d = 0;
        #12 d = 1;
        #10 d = 0;
        #20 d = 1;

        #30 $finish;
    end

endmodule
