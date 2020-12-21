module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output reg [23:0] out_bytes,
    output done
);

reg [1:0] cs, ns;
parameter DONE = 2'b00,
          FIRST = 2'b01,
          SECOND = 2'b10,
          THIRD = 2'b11;
always @(posedge clk)
    if (reset) cs <= FIRST;
    else cs <= ns;
always @(*)
    case (cs)
        FIRST: ns = in[3] ? SECOND : FIRST;
        SECOND: ns = THIRD;
        THIRD: ns = DONE;
        DONE: ns = in[3] ? SECOND : FIRST;
        default: ns = FIRST;
    endcase
assign done = cs == DONE;
always @(posedge clk)
    if (reset) out_bytes <= 24'b0;
    else case (ns)
        SECOND: out_bytes[23:16] <= in;
        THIRD: out_bytes[15:8] <= in;
        DONE: out_bytes[7:0] <= in;
        default: out_bytes <= out_bytes;
    endcase

endmodule