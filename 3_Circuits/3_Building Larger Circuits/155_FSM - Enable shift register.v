module top_module (
    input clk,
    input reset,
    output reg shift_ena
);

reg [2:0] cs, ns;
parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
always @(posedge clk)
    if (reset) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = B;
        B: ns = C;
        C: ns = D;
        D, E: ns = E;
        default: ns = A;
    endcase
always @(*)
    case (cs)
        A, B, C, D: shift_ena = 1'b1;
        default: shift_ena = 1'b0;
    endcase

endmodule