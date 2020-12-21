module top_module (
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q
);

always @(posedge clk)
    if (load) q <= data;
    else if (~ena) q <= q;
    else case (amount)
        2'b00: q <= q << 1;
        2'b01: q <= q << 8;
        2'b10: q <= {q[63], q[63:1]};
        2'b11: q <= {{8{q[63]}}, q[63:8]};
        default: q <= q;
    endcase

endmodule