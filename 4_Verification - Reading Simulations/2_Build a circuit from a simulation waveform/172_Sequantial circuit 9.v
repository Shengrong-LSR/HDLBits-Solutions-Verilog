module top_module (
    input clk,
    input a,
    output reg [2:0] q
);

always @(posedge clk)
    if (a) q <= 4;
    else q <= q < 6 ? q + 1 : 0;

endmodule