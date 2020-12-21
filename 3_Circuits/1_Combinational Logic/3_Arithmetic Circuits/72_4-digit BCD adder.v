module top_module (
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);

wire [2:0] c;
bcd_fadd bcd_fadd0 (a[3:0], b[3:0], cin, c[0], sum[3:0]);
bcd_fadd bcd_fadd1 (a[7:4], b[7:4], c[0], c[1], sum[7:4]);
bcd_fadd bcd_fadd2 (a[11:8], b[11:8], c[1], c[2], sum[11:8]);
bcd_fadd bcd_fadd3 (a[15:12], b[15:12], c[2], cout, sum[15:12]);

endmodule