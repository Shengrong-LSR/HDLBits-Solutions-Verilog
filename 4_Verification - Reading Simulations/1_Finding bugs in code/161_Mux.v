module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out
);

wire [7:0] ab, cd;
mux2 mux_0 (sel[1], ab, cd, out);
mux2 mux_1 (sel[0], a, b, ab);
mux2 mux_2 (sel[0], c, d, cd);

endmodule