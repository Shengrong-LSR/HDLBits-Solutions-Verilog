module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);

wire [7:0] m0, m1;
assign m0 = a < b ? a : b;
assign m1 = c < d ? c : d;
assign min = m0 < m1 ? m0 : m1;

endmodule