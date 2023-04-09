module dp (clka, clkb, restart, d_in, key_in,  out1, out2, out3, data_out, key_out);

input clka, clkb, restart, out1, out2, out3;
input [7:0] d_in, key_in;

output [15:0] data_out, key_out;

reg [15:0] data_out;
reg [15:0] key_out;
reg [15:0] start_data, start_key, key1, key2;
reg [15:0] d1_temp, d2_temp, dout_temp;
wire [15:0] temp_key1, temp_key2, d1_en, d2_en, do_en, d1_de, d2_de, do_de;

key_gen key_gen1 (.input_key (start_key), .output_key (temp_key1));
key_gen key_gen2 (.input_key (key1), .output_key (temp_key2));

encoder enc1 (.in_message (start_data), .out_message (d1_en), .in_key (start_key));
encoder enc2 (.in_message (d1_temp), .out_message (d2_en), .in_key (key1));
encoder enc3 (.in_message (d2_temp), .out_message (do_en), .in_key (key2));
  
decoder dec1 (.in_message (start_data), .out_message (d1_de), .in_key (key2));
decoder dec2 (.in_message (d1_temp), .out_message (d2_de), .in_key (key1));
decoder dec3 (.in_message (d2_temp), .out_message (do_de), .in_key (start_key));
 

always @ (negedge clka)
begin
if (restart == 1'b1) begin
   start_data = 16'b0;
   start_key = 16'b0;
   key1 = 16'b0;
   key2 = 16'b0;
   d1_temp = 16'b0;
   d2_temp = 16'b0;
   dout_temp = 16'b0;
   end else if (out1 & ~out2 & ~out3) begin
   start_data[15:8] = d_in;
   start_key[15:8] = key_in;
   end else if (~out1 & out2 & ~out3) begin
   start_data[7:0] = d_in;
   start_key[7:0] = key_in;
   end else if (out1 & out2 & ~out3) begin
   key1 = temp_key1;
   end else if (~out1 & out2 & out3) begin
   key2 = temp_key2;
   end else if (~out1 & ~out2 & out3) begin
   d1_temp = d1_en;
   d2_temp = d2_en;
   dout_temp = do_en;
   end else if (out1 & ~out2 & out3) begin
   d1_temp = d1_de;
   d2_temp = d2_de;
   dout_temp = do_de;
   end
end

always @ (negedge clkb)
begin
if (restart == 1'b1) begin
   data_out = 16'b0;
   key_out = 16'b0;
   end else if (~out1 & ~out2 & out3) begin
   data_out = dout_temp;
   key_out = start_key;
   end else if (out1 & ~out2 & out3) begin
   data_out = dout_temp;
   key_out = start_key;
   end
end
   
endmodule
