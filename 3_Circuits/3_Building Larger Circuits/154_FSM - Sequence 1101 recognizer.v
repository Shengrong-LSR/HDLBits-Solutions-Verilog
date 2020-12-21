module top_module (
    input clk,
    input reset,
    input data,
    output start_shifting
);

reg [2:0] cs, ns;
parameter D = 3'b000,
          D1 = 3'b001,
          D11 = 3'b010,
          D110 = 3'b011,
          D1101 = 3'b100;
always @(posedge clk)
    if (reset) cs <= D;
    else cs <= ns;
always @(*)
    case (cs)
        D: ns = data ? D1 : D;
        D1: ns = data ? D11 : D;
        D11: ns = data ? D11 : D110;
        D110: ns = data ? D1101 : D;
        D1101: ns = D1101;
        default: ns = D;
    endcase
assign start_shifting = cs == D1101;

endmodule