`timescale 1ps / 1ps

module top_module;

reg clk, in;
reg [2:0] s;
initial begin
    clk = 0;
    in = 0;
    s = 2;
end
always
    #5 clk = ~clk;
initial begin
    #20 in = 1;
    #10 in = 0;
    #10 in = 1;
    #30 in = 0;
end
initial begin
    #10 s = 6;
    #10 s = 2;
    #10 s = 7;
    #10 s = 0;
end

wire out;
q7 q7_0 (clk, in, s, out);

endmodule