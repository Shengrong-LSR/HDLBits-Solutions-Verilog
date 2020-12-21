module top_module (
    input a,
    input b,
    input c,
    output out
);

wire out_and;
andgate andgate_0 (out_and, a, b, c, 1'b1, 1'b1);
assign out = ~out_and;

endmodule