module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

always @(posedge clk)
    if (load) q <= data;
    else q <= (q >> 1) ^ (q << 1);

endmodule