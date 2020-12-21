module top_module (
    input a, b, c, d, e,
    output [24:0] out
);

wire [24:0] concat1;
wire [24:0] concat2;
assign concat1 = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
assign concat2 = {5{a, b, c, d, e}};
assign out = ~concat1 ^ concat2;

endmodule