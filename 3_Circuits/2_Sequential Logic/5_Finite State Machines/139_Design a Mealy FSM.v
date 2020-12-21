module top_module (
    input clk,
    input aresetn,
    input x,
    output z
);

reg [1:0] cs, ns;
parameter A = 2'b00, B = 2'b01, C = 2'b10;
always @(posedge clk or negedge aresetn)
    if (~aresetn) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A, C: ns = x ? B : A;
        B: ns = x ? B : C;
        default: ns = A;
    endcase
assign z = cs == C ? x : 1'b0;

endmodule