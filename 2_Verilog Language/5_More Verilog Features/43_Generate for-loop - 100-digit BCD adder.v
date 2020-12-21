module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);

wire [99:0] coutm;
bcd_fadd bcd_fadd_0 (a[3:0], b[3:0], cin, coutm[0], sum[3:0]);
genvar i;
generate for (i = 1; i < 100; i = i + 1)
begin: Bcdadd100
    bcd_fadd bcd_fadd_i (a[4*i+3:4*i], b[4*i+3:4*i], coutm[i - 1], coutm[i], sum[4*i+3:4*i]);
end
endgenerate
assign cout = coutm[99];

endmodule