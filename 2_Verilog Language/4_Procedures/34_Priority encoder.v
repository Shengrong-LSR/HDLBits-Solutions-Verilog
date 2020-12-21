module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

always @(*)
    casez (in)
        4'b???1: pos = 0;
        4'b??10: pos = 1;
        4'b?100: pos = 2;
        4'b1000: pos = 3;
        default: pos = 0;
    endcase

endmodule