module top_module (
    input clk,
    input areset,
    input x,
    output z
);

// I don't see the point of using one-hot encoding.
reg cs, ns;
always @(posedge clk or posedge areset)
    if (areset) cs <= 1'b0;
    else cs <= ns;
always @(*)
    if (cs) ns = 1'b1;
    else ns = x;
assign z = x ^ cs;

endmodule