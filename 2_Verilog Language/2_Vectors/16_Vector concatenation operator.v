module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z
);

wire [31:0] concat;
assign concat = {a, b, c, d, e, f, 2'b11};
assign w = concat[31:24];
assign x = concat[23:16];
assign y = concat[15:8];
assign z = concat[7:0];

endmodule