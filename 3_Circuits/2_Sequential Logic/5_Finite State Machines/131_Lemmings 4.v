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
          DR = 3'b101,
          ST = 3'b110; //Splatter
always @(posedge clk or posedge areset)
    if (areset) cs <= L;
    else cs <= ns;
reg [4:0] cnt;
always @(posedge clk or posedge areset)
    if (areset) cnt <= 0;
    else if (cs == FL || cs == FR) cnt <= cnt < 20 ? cnt + 1 : cnt;
    else if (cs == L || cs == R) cnt <= 0;
    else cnt <= cnt;
always @(*)
    case (cs)
        L: ns = ~ground ? FL : (dig ? DL : (bump_left ? R : L));
        R: ns = ~ground ? FR : (dig ? DR : (bump_right ? L : R));
        FL: ns = ~ground ? FL : (cnt >= 20 ? ST : L);
        FR: ns = ~ground ? FR : (cnt >= 20 ? ST : R);
        DL: ns = ground ? DL : FL;
        DR: ns = ground ? DR : FR;
        ST: ns = ST;
        default: ns = L;
    endcase
assign walk_left = cs == ST ? 1'b0 : (cs == L);
assign walk_right = cs == ST ? 1'b0 : (cs == R);
assign aaah = cs == ST ? 1'b0 : (cs == FL || cs == FR);
assign digging = cs == ST ? 1'b0 : (cs == DL || cs == DR);

endmodule