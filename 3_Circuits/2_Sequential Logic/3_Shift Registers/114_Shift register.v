module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg [3:0] LEDR
);

always @(posedge KEY[0])
    LEDR <= KEY[2] ? SW : (KEY[1] ? {KEY[3], LEDR[3:1]} : LEDR);

endmodule