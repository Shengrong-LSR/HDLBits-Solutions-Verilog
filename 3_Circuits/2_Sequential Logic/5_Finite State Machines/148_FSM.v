module top_module (
    input clk,
    input reset,
    input w,
    output z
);

reg [2:0] cs, ns;
parameter A = 3'b000, B = 3'b001, C = 3'b010,
          D = 3'b011, E = 3'b100, F = 3'b101;
always @(posedge clk)
    if (reset) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = w ? B : A;
        B: ns = w ? C : D;
        C: ns = w ? E : D;
        D: ns = w ? F : A;
        E: ns = w ? E : D;
        F: ns = w ? C : D;
        default: ns = A;
    endcase
assign z = cs == E || cs == F;

endmodule