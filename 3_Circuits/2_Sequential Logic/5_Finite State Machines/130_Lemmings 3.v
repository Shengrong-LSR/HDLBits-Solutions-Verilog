module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging
);

reg [2:0] cs, ns;
parameter L = 3'b000,
          R = 3'b001,
          FL = 3'b010, //Fall
          FR = 3'b011,
          DL = 3'b100, //Dig
          DR = 3'b101;
always @(posedge clk or posedge areset)
    if (areset) cs <= L;
    else cs <= ns;
always @(*)
    case (cs)
        L: ns = ~ground ? FL : (dig ? DL : (bump_left ? R : L));
        R: ns = ~ground ? FR : (dig ? DR : (bump_right ? L : R));
        FL: ns = ground ? L : FL;
        FR: ns = ground ? R : FR;
        DL: ns = ground ? DL : FL;
        DR: ns = ground ? DR : FR;
        default: ns = L;
    endcase
assign walk_left = cs == L;
assign walk_right = cs == R;
assign aaah = cs == FL || cs == FR;
assign digging = cs == DL || cs == DR;

endmodule