module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

integer i;
reg [31:0] last;
always @(posedge clk) begin
    last <= in;
    if (reset) out <= 0;
    else for (i = 0; i < 32; i = i + 1)
        out[i] <= last[i] & ~in[i] ? 1 : out[i];
end

endmodule