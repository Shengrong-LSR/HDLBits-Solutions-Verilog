module top_module (
    input clk,
    input areset,
    input x,
    output reg z
);

// This solution is a "success" but may not be accurate.
// How to solve this properly using a Moore FSM?
reg cs, ns;
always @(posedge clk or posedge areset)
    if (areset) cs <= 1'b0;
    else cs <= ns;
always @(*)
    if (cs) ns = 1'b1;
    else ns = x;
always @(posedge clk or posedge areset)
    if (areset) z <= 1'b0;
    else z <= x ^ cs;

endmodule