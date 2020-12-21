module top_module(
    input clk,
    input reset,
    input in,
    output disc,
    output flag,
    output err
);

reg [3:0] cs, ns;
parameter NONE = 4'b0,
          ONE = 4'b0001,
          TWO = 4'b0010,
          THREE = 4'b0011,
          FOUR = 4'b0100,
          FIVE = 4'b0101,
          SIX = 4'b0110,
          DISCARD = 4'b0111,
          FLAG = 4'b1000,
          ERROR = 4'b1001;
always @(posedge clk)
    if (reset) cs <= NONE;
    else cs <= ns;
always @(*)
    case (cs)
        NONE: ns = in ? ONE : NONE;
        ONE: ns = in ? TWO : NONE;
        TWO: ns = in ? THREE : NONE;
        THREE: ns = in ? FOUR : NONE;
        FOUR: ns = in ? FIVE : NONE;
        FIVE: ns = in ? SIX : DISCARD;
        SIX: ns = in ? ERROR : FLAG;
        DISCARD: ns = in ? ONE : NONE;
        FLAG: ns = in ? ONE : NONE;
        ERROR: ns = in ? ERROR : NONE;
        default: ns = NONE;
    endcase
assign disc = cs == DISCARD;
assign flag = cs == FLAG;
assign err = cs == ERROR;

endmodule