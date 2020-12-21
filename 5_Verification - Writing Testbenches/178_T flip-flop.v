`timescale 1ps / 1ps

module top_module;

reg clk, reset, t;
initial begin
    clk = 1'b0;
    reset = 1'b0;
end
always
    #5 clk = ~clk;
initial begin
    #5 reset = 1'b1;
    #20 reset = 1'b0;
end
always @(posedge clk)
    if (reset) t <= 1'b0;
    else t <= 1'b1;

wire q;
tff tff_0 (clk, reset, t, q);

endmodule