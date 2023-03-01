module shiftrow(in_message, out_message);

input in_message;
output out_message;
wire[15:0] in_message, out_message;

assign out_message[15:8] = in_message[15:8];
assign out_message[7:4] = in_message[3:0];
assign out_message[3:0] = in_message[7:4];

endmodule
