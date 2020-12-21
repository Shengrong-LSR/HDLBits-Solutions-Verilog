module top_module (
    output reg A,
    output reg B
);

initial begin
    A = 1'b0;
    B = 1'b0;
    #10 A = 1'b1;
    #5 B = 1'b1;
    #5 A = 1'b0;
    #20 B = 1'b0;
end

endmodule