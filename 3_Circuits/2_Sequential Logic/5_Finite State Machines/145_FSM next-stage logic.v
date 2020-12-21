module top_module (
    input [3:1] y,
    input w,
    output reg Y2
);

always @(*)
    case (y)
        3'b001, 3'b101: Y2 = 1'b1;
        3'b010, 3'b100: Y2 = w;
        default: Y2 = 1'b0;
    endcase

endmodule