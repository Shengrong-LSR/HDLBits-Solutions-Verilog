module top_module (
    input clk,
    input [7:0] d,
    input [1:0] sel,
    output [7:0] q
);

wire [7:0] q0, q1, q2;
my_dff8 my_dff8_0 (clk, d, q0);
my_dff8 my_dff8_1 (clk, q0, q1);
my_dff8 my_dff8_2 (clk, q1, q2);

always @(*)
    case (sel)
        3: q = q2;
        2: q = q1;
        1: q = q0;
        0: q = d;
    endcase

endmodule