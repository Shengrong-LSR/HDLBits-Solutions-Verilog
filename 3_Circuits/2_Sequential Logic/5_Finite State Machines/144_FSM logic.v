module top_module (
    input clk,
    input [2:0] y,
    input x,
    output reg Y0,
    output z
);

// I don't think clock is necessary.
always @(*)
    case (y)
        3'b000, 3'b010: Y0 = x;
        3'b001, 3'b011, 3'b100: Y0 = ~x;
        default: Y0 = 1'b0;
    endcase
assign z = y == 3'b011 || y == 3'b100;

endmodule