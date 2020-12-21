module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right
);

reg cs, ns;
parameter LEFT = 1'b0, RIGHT = 1'b1;
always @(posedge clk or posedge areset)
    if (areset) cs <= LEFT;
    else cs <= ns;
always @(*)
    case (cs)
        LEFT: ns = bump_left ? RIGHT : LEFT;
        RIGHT: ns = bump_right ? LEFT : RIGHT;
        default: ns = LEFT;
    endcase
assign {walk_left, walk_right} = cs == LEFT ? 2'b10 : 2'b01;

endmodule