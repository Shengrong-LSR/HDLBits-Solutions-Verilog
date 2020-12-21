module top_module (
	input [2:0] SW,
	input [1:0] KEY,
	output reg [2:0] LEDR
);

always @(posedge KEY[0])
    LEDR <= KEY[1] ? SW : {LEDR[2] ^ LEDR[1], LEDR[0], LEDR[2]};

endmodule