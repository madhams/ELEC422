module mixcols(in_message, out_message);

input in_message;
output out_message;

wire[15:0] in_message, out_message;

assign out_message[15] = in_message[15]^in_message[5];
assign out_message[14] = in_message[14]^in_message[7]^in_message[4];
assign out_message[13] = in_message[13]^in_message[7]^in_message[6];
assign out_message[12] = in_message[12]^in_message[6];

assign out_message[11] = in_message[11]^in_message[1];
assign out_message[10] = in_message[10]^in_message[3]^in_message[0];
assign out_message[9] = in_message[9]^in_message[3]^in_message[2];
assign out_message[8] = in_message[8]^in_message[2];

assign out_message[7] = in_message[13]^in_message[7];
assign out_message[6] = in_message[15]^in_message[12]^in_message[6];
assign out_message[5] = in_message[15]^in_message[14]^in_message[5];
assign out_message[4] = in_message[14]^in_message[4];

assign out_message[3] = in_message[9]^in_message[3];
assign out_message[2] = in_message[11]^in_message[8]^in_message[2];
assign out_message[1] = in_message[11]^in_message[10]^in_message[1];
assign out_message[0] = in_message[10]^in_message[0];

endmodule
