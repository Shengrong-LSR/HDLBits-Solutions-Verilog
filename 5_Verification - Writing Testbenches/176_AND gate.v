`timescale 1ps / 1ps

module top_module();

reg [1:0] in;
initial begin
    in = 2'b0;
    #10 in[0] = 1'b1;
    #10 in = 2'b10;
    #10 in[0] = 1'b1;
end

wire out;
andgate andgate_0 (in, out);

endmodule