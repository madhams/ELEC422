module dp (clka, clkb, restart, d_in, key_in, rc,  out1, out2, out3, data_out, key_out);

input clka, clkb, restart, out1, out2, out3;
input [7:0] d_in, key_in, rc;

output [15:0] data_out, key_out;

reg [15:0] data_out;
reg [15:0] key_out;
reg [15:0] start_data, start_key, key1, key2;
reg [15:0] d1_temp, d2_temp;


always @ (negedge clka)
begin
if (restart == 1'b1) begin
   start_data = 16'b0;
   start_key = 16'b0;
   key1 = 16'b0;
   key2 = 16'b0;
   d1_temp = 16'b0;
   d2_temp = 16'b0;
   end else if (out1 & ~out2 & ~out3) begin
   start_data[15:8] = data_in;
   start_key[15:8] = key_in;
   end else if (~out1 & out2 & ~out3) begin
   start_data[7:0] = data_in;
   start_key[7:0] = key_in;
   end (out1 & out2 & ~out3) begin
   key_gen key_gen1 (.input_key (start_key), .round_constant (rc), .output_key (key1));
   end (~out1 & out2 & out3) begin
   key_gen key_gen2 (.input_key (key1), .round_constant (rc), .output_key (key2));
   end
end

always @ (negedge clkb)
begin
if (restart == 1'b1) begin
   data_out = 16'b0;
   key_out = 16'b0;
   end else if (~out1 & ~out2 & out3) begin
   encoder enc1 (.in_message (start_data), .out_message (d1_temp), .in_key (start_key));
   encoder enc2 (.in_message (d1_temp), .out_message (d2_temp), .in_key (key1));
   encoder enc3 (.in_message (d2_temp), .out_message (data_out), .in_key (key2));
   key_out = start_key;
   end else if (out1 & ~out2 & out3) begin
   decoder dec1 (.in_message (start_data), .out_message (d1_temp), .in_key (key2));
   decoder dec2 (.in_message (d1_temp), .out_message (d2_temp), .in_key (key1));
   decoder dec3 (.in_message (d2_temp), .out_message (data_out), .in_key (start_key));
   key_out = start_key;
   end
end
   
endmodule
