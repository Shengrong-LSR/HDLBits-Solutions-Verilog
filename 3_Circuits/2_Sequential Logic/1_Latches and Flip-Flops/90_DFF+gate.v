module top_module (
    input clk,
    input in,
    output reg out
);

wire d;
assign d = in ^ out;
always @(posedge clk)
    out <= d;

endmodule