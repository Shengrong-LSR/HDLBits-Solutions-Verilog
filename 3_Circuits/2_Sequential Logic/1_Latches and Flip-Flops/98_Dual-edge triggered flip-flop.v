module top_module (
    input clk,
    input d,
    output q
);

reg q1, q0;
always @(posedge clk)
    q1 <= d;
always @(negedge clk)
    q0 <= d;
assign q = clk ? q1 : q0;

endmodule