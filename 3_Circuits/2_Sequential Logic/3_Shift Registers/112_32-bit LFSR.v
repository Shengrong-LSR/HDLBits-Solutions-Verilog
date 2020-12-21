module top_module (
    input clk,
    input reset,
    output reg [31:0] q
);

always @(posedge clk)
    if (reset) q <= 1;
    else q <= {q[0], q[31:23], q[22] ^ q[0], q[21:3], q[2] ^ q[0], q[1] ^ q[0]};

endmodule