module top_module (
    input clk,
    input areset,
    input [7:0] d,
    output reg [7:0] q
);

always @(posedge clk or posedge areset)
    if (areset) q <= 0;
    else q <= d;

endmodule