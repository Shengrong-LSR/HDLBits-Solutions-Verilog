module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q
);

always @(posedge clk)
    Q <= L ? r_in : q_in;

endmodule