module top_module (
    input clk,
    input x,
    output z
);

reg [2:0] q;
always @(posedge clk) begin
    q[2] <= q[2] ^ x;
    q[1] <= x & ~q[1];
    q[0] <= x | ~q[0];
end
assign z = ~(|q);

endmodule