module top_module (
    input clk,
    input reset,
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack
);

wire shift_ena;
wire done_counting;
// Complete FSM
reg [3:0] cs, ns;
parameter S = 4'b0,
          S1 = 4'b0001,
          S11 = 4'b0010,
          S110 = 4'b0011,
          B0 = 4'b0100,
          B1 = 4'b0101,
          B2 = 4'b0110,
          B3 = 4'b0111,
          C = 4'b1000,
          W = 4'b1001;
always @(posedge clk)
    if (reset) cs <= S;
    else cs <= ns;
always @(*)
    case (cs)
        S: ns = data ? S1 : S;
        S1: ns = data ? S11 : S;
        S11: ns = data ? S11 : S110;
        S110: ns = data ? B0 : S;
        B0: ns = B1;
        B1: ns = B2;
        B2: ns = B3;
        B3: ns = C;
        C: ns = done_counting ? W : C;
        W: ns = ack ? S : W;
        default: ns = S;
    endcase
assign shift_ena = cs == B0 || cs == B1 || cs == B2 || cs == B3;
assign done_counting = count == 0 && cnt_1k == 999;
// Output logic
assign count = delay;
assign counting = cs == C;
assign done = cs == W;
// 4-bit shift register and down counter
reg [3:0] delay;
always @(posedge clk)
    if (shift_ena) delay <= {delay[2:0], data};
    else if (cnt_1k == 999) delay <= delay - 1;
    else delay <= delay;
// Counter 1000
reg [9:0] cnt_1k;
always @(posedge clk)
    if (~counting) cnt_1k <= 0;
    else cnt_1k <= cnt_1k < 999 ? cnt_1k + 1 : 0;

endmodule