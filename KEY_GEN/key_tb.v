module key_tb();
reg[15:0] user_key;
wire[15:0] new_key;
reg[8:0] rc;

key_gen round1 (.input_key(user_key), .round_constant(rc), .output_key(new_key));

initial 
begin
#10
user_key = 16'b1010011100111011;
rc = 8'b10000000;
#10
$dumpfile("key_tb.vcd");
$dumpvars;
$stop;
end
endmodule
