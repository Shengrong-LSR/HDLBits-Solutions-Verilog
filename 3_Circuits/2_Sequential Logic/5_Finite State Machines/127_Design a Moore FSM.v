module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);

reg [1:0] cs, ns;
parameter A = 2'b00,
          B = 2'b01,
          C = 2'b10,
          D = 2'b11;
always @(posedge clk)
    if (reset) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = s[1] ? B : A;
        B: ns = s[2] ? C : (s[1] ? B : A);
        C: ns = s[3] ? D : (s[2] ? C : B);
        D: ns = s[3] ? D : C;
        default: ns = A;
    endcase
reg lower;
always @(posedge clk)
    if (reset) lower = 1'b0;
    else lower = ns < cs ? 1'b1 : (ns > cs ? 1'b0 : lower);
assign fr3 = cs == A;
assign fr2 = cs <= B;
assign fr1 = cs <= C;
assign dfr = cs == A || lower;

endmodule