module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah
);

reg [1:0] cs, ns;
parameter L = 2'b00,
          R = 2'b01,
          FL = 2'b10,
          FR = 2'b11;
always @(posedge clk or posedge areset)
    if (areset) cs <= L;
    else cs <= ns;
always @(*)
    case (cs)
        L: ns = ~ground ? FL : (bump_left ? R : L);
        R: ns = ~ground ? FR : (bump_right ? L : R);
        FL: ns = ground ? L : FL;
        FR: ns = ground ? R : FR;
        default: ns = L;
    endcase
assign walk_left = cs == L;
assign walk_right = cs == R;
assign aaah = cs == FL || cs == FR;

endmodule