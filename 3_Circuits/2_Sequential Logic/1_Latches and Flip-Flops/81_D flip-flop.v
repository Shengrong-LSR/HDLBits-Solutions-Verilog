module top_module (
    input clk,
    input d,
    output reg q
);

always @(posedge clk)
    q <= d;

endmodule