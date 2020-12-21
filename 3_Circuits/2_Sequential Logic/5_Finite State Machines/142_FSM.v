module top_module (
    input clk,
    input reset,
    input s,
    input w,
    output z
);

reg [1:0] cnt;
reg [1:0] cs, ns;
parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
always @(posedge clk)
    if (reset) cs <= A;
    else cs <= ns;
always @(*)
    case (cs)
        A: ns = s ? B : A;
        B: ns = C;
        C: ns = D;
        D: ns = B;
        default: ns = A;
    endcase
// Counter
always @(posedge clk)
    if (reset) cnt <= 0;
    else case (cs)
        B: cnt <= w;
        C, D: cnt <= cnt + w;
        default: cnt <= 0;
    endcase
// Output z
assign z = cs == B && cnt == 2;

endmodule