module top_module (input clk, input d, output q);

wire q0, q1;
my_dff my_dff_0 (clk, d, q0);
my_dff my_dff_1 (clk, q0, q1);
my_dff my_dff_2 (clk, q1, q);

endmodule