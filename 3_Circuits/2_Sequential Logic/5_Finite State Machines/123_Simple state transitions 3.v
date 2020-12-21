module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output out
);

parameter A = 2'b00,
          B = 2'b01,
          C = 2'b10,
          D = 2'b11;
always @(*)
    case (state)
        A: next_state = in ? B : A;
        B: next_state = in ? B : C;
        C: next_state = in ? D : A;
        D: next_state = in ? B : C;
        default: next_state = A;
    endcase
assign out = state == D;

endmodule