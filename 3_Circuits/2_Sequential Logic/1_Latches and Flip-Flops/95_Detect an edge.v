module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

reg [7:0] last;
always @(posedge clk) begin
    last <= in;
    pedge <= ~last & in;
end

endmodule