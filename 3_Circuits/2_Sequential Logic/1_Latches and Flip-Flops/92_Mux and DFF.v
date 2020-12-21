module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

always @(posedge clk)
    Q <= L ? R : (E ? w : Q);

endmodule