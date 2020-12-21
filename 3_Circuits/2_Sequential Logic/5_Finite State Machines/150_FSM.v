module top_module (
    input clk,
    input resetn,
    input [3:1] r,
    output [3:1] g
);

reg [1:0] cs, ns;
parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
always @(posedge clk)
    if (~resetn) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = r[1] ? B : (r[2] ? C : (r[3] ? D : A));
        B: ns = r[1] ? B : A;
        C: ns = r[2] ? C : A;
        D: ns = r[3] ? D : A;
        default: ns = A;
    endcase
assign g = {cs == D, cs == C, cs == B};

endmodule