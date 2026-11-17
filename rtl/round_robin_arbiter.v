
`timescale 1ns / 1ps

module round_robin_arbiter (
    input wire clk,
    input wire rst_n,
    input wire [3:0] req,
    output reg [3:0] grant
);

    reg [1:0] rr_ptr;
    reg found;
    integer i;
    integer idx;

    always @(*) begin
        grant = 4'b0000;
        found = 1'b0;
        idx = 0;

        for (i = 0; i < 4; i = i + 1) begin
            idx = rr_ptr + i;

            if (idx >= 4)
                idx = idx - 4;

            if (!found && req[idx]) begin
                grant[idx] = 1'b1;
                found = 1'b1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            rr_ptr <= 2'd0;
        else begin
            if (grant[0])
                rr_ptr <= 2'd1;
            else if (grant[1])
                rr_ptr <= 2'd2;
            else if (grant[2])
                rr_ptr <= 2'd3;
            else if (grant[3])
                rr_ptr <= 2'd0;
        end
    end

endmodule
