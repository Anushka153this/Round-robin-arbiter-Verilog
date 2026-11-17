
`timescale 1ns / 1ps

module round_robin_arbiter_tb;

    reg clk;
    reg rst_n;
    reg [3:0] req;
    wire [3:0] grant;

    round_robin_arbiter uut (
        .clk(clk),
        .rst_n(rst_n),
        .req(req),
        .grant(grant)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $monitor("Time=%0t rst_n=%b req=%b grant=%b",
                  $time, rst_n, req, grant);

        rst_n = 0;
        req = 4'b0000;
        #12;

        rst_n = 1;
        req = 4'b1111;
        #50;

        req = 4'b0101;
        #40;

        req = 4'b0000;
        #20;

        req = 4'b1111;
        #50;

        $finish;
    end

endmodule
