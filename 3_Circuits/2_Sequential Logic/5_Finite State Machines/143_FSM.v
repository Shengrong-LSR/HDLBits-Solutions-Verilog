module top_module (
    input clk,
    input reset,
    input x,
    output z
);

reg [2:0] cs, ns;
parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
always @(posedge clk)
    if (reset) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = x ? B : A;
        B: ns = x ? E : B;
        C: ns = x ? B : C;
        D: ns = x ? C : B;
        E: ns = x ? E : D;
        default: ns = A;
    endcase
assign z = cs == D || cs == E;

endmodule