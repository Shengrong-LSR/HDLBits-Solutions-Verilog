module top_module(
    input clk,
    input in,
    input reset,
    output out
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
        A: ns = in ? B : A;
        B: ns = in ? B : C;
        C: ns = in ? D : A;
        D: ns = in ? B : C;
        default: ns = A;
    endcase
assign out = cs == D;

endmodule