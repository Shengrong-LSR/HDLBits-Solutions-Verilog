module top_module (
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);

always @(*) begin
    out = do_sub ? a - b : a + b;
    result_is_zero = !out;
end

endmodule