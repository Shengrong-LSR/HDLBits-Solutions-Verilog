`timescale 1ps / 1ps

module top_module;

reg clk;
initial
    clk = 1'b0;
always
    #5 clk = ~clk;

dut dut_0 (clk);

endmodule