module top_module (
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y
);

wire and11, and12, and21, and22;
assign and11 = p1a & p1b & p1c;
assign and12 = p1d & p1e & p1f;
assign and21 = p2a & p2b;
assign and22 = p2c & p2d;
assign p1y = and11 | and12;
assign p2y = and21 | and22;

endmodule