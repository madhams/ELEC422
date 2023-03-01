module testbench();
reg[15:0] in_message, key;
wire[15:0] out_message;

encoder test(.in_message(in_message), .out_message(out_message), .in_key(key));

initial
begin

in_message = 16'b1001000111101101;
key = 16'b1111100111010001;
#10

$dumpfile("testbench.vcd");
$dumpvars;

$stop;
end

endmodule
