module top_module (
    input ring,
    input vibrate_mode,
    output ringer,
    output motor
);

assign ringer = ~vibrate_mode&ring ? 1 : 0;
assign motor = vibrate_mode&ring ? 1 : 0;

endmodule