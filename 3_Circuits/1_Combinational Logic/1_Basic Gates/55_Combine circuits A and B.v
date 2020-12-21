module top_module (
    input x,
    input y,
    output z
);

wire [3:0] zm;
A A1 (x, y, zm[0]);
B B1 (x, y, zm[1]);
A A2 (x, y, zm[2]);
B B2 (x, y, zm[3]);
assign z = (zm[0] | zm[1]) ^ (zm[2] & zm[3]);

endmodule

module A (
    input x,
    input y,
    output z
);
assign z = (x ^ y) & x;
endmodule

module B (
    input x,
    input y,
    output z
);
assign z = ~(x ^ y);
endmodule