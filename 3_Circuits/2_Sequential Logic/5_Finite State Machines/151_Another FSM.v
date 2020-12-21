module top_module (
    input clk,
    input resetn,
    input x,
    input y,
    output f,
    output g
);

reg [3:0] cs, ns;
parameter A = 0,
          B = 1,
          C = 2,
          X1 = 3,
          X10 = 4,
          X101 = 5,
          Y0 = 6,
          G0 = 7,
          G1 = 8;
always @(posedge clk)
    if (~resetn) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = B;
        B: ns = C;
        C: ns = x ? X1 : C;
        X1: ns = x ? X1 : X10;
        X10: ns = x ? X101 : C;
        X101: ns = y ? G1 : Y0;
        Y0: ns = y ? G1 : G0;
        G0: ns = G0;
        G1: ns = G1;
        default: ns = A;
    endcase
assign f = cs == B;
assign g = cs == X101 || cs == Y0 || cs == G1;

endmodule