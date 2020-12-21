module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

reg [15:0] q_2d[15:0];
reg [255:0] q_rt;
integer i, j;
integer cnt;
integer u, d, l, r;
always @(*) begin
    for (i = 0; i < 16; i = i + 1)
        q_2d[i] = q[16*i +: 16];
    for (i = 0; i < 16; i = i + 1)
        for (j = 0; j < 16; j = j + 1) begin
            u = i == 15 ? 0 : i + 1;
            d = i == 0 ? 15 : i - 1;
            l = j == 15 ? 0 : j + 1;
            r = j == 0 ? 15 : j - 1;
            cnt = q_2d[u][l] + q_2d[u][j] + q_2d[u][r] +
                  q_2d[i][l] +            + q_2d[i][r] +
                  q_2d[d][l] + q_2d[d][j] + q_2d[d][r];
            case (cnt)
                2: q_rt[16*i+j] = q_2d[i][j];
                3: q_rt[16*i+j] = 1;
                default: q_rt[16*i+j] = 0;
            endcase
        end
end

always @(posedge clk)
    if (load) q <= data;
    else q <= q_rt;

endmodule