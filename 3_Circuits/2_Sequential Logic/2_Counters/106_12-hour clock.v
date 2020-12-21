module top_module (
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);

wire [4:1] enable;
assign enable[1] = ena && ss[3:0] == 9;
assign enable[2] = enable[1] && ss[7:4] == 5;
assign enable[3] = enable[2] && mm[3:0] == 9;
assign enable[4] = enable[3] && mm[7:4] == 5;
cnt #(.START(0), .END(9)) ss9 (clk, reset, ena, ss[3:0]);
cnt #(.START(0), .END(5)) ss5 (clk, reset, enable[1], ss[7:4]);
cnt #(.START(0), .END(9)) mm9 (clk, reset, enable[2], mm[3:0]);
cnt #(.START(0), .END(5)) mm5 (clk, reset, enable[3], mm[7:4]);
cnt_hour hh12 (clk, reset, enable[4], hh[7:0], pm);

endmodule

module cnt (
    input clk,
    input reset,
    input ena,
    output reg [3:0] q
);
parameter START = 0, END = 9;
always @(posedge clk)
    if (reset) q <= START;
    else if (~ena) q <= q;
    else q <= q < END ? q + 1 : START;
endmodule

module cnt_hour (
    input clk,
    input reset,
    input ena,
    output reg [7:0] q,
    output reg pm
);
always @(posedge clk)
    if (reset) q <= 8'h12;
    else if (~ena) q <= q;
    else case (q)
        8'h12: q <= 8'h01;
        8'h09: q <= 8'h10;
        default: q[3:0] <= q[3:0] + 1;
    endcase
always @(posedge clk)
    if (reset) pm <= 0;
    else if (ena && q == 8'h11) pm <= ~pm;
    else pm <= pm;
endmodule