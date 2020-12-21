module top_module (
    input clk,
    input d,
    input ar,
    output reg q
);

always @(posedge clk or posedge ar)
    if (ar) q <= 0;
    else q <= d;

endmodule