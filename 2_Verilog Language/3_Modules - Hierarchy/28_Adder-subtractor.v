module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

wire cout;
wire [31:0] xor_out;
assign xor_out = b ^ {32{sub}};
add16 add16_0 (a[15:0], xor_out[15:0], sub, sum[15:0], cout);
add16 add16_1 (a[31:16], xor_out[31:16], cout, sum[31:16], );

endmodule