module top_module(
    input clk,
    input reset,
    input j,
    input k,
    output out
);

reg cs, ns;
parameter ON = 1'b1, OFF = 1'b0;
always @(posedge clk)
    if (reset) cs <= OFF;
    else cs <= ns;
always @(*)
    case (cs)
        ON: ns = k ? OFF : ON;
        OFF: ns = j ? ON : OFF;
        default: ns = OFF;
    endcase
assign out = cs == ON;

endmodule