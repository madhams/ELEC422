module reverse_MC_tb();

reg[15:0] message_in;
wire[15:0] message_out, tmp_message;
mixcols M1 (.in_message(message_in), .out_message(tmp_message));
reverse_MC M2 (.in_message(tmp_message), .out_message(message_out));

initial begin
message_in = 16'b1010011100111011;
#50
$dumpfile("reverse_MC_tb.vcd");
$dumpvars;
$stop;
end
endmodule
