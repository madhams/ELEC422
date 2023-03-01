module decoder_tb();
reg[15:0] in_message, key;
wire[15:0] out_message;

decoder test(.in_message(in_message), .out_message(out_message), .in_key(key));

initial
begin

in_message = 16'b1101101000001100;
key = 16'b1111100111010001;
#10

$dumpfile("decoder_tb.vcd");
$dumpvars;

$stop;
end

endmodule
