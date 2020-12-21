module top_module (
    input d,
    input ena,
    output reg q
);

always @(*)
    q <= ena ? d : q;

endmodule