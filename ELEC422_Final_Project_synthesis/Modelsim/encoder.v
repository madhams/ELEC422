module encoder(in_message, out_message, in_key);

input in_message, in_key;
output out_message;

wire[15:0] in_message, out_message, in_key, key_out, sub_out, rs_out;

assign key_out = in_message^in_key;

s_box sub1(
.input_data(key_out[15:12]),
.output_data(sub_out[15:12])
);
s_box sub2(
.input_data(key_out[11:8]),
.output_data(sub_out[11:8])
);
s_box sub3(
.input_data(key_out[7:4]),
.output_data(sub_out[7:4])
);
s_box sub4(
.input_data(key_out[3:0]),
.output_data(sub_out[3:0])
);

shiftrow shiftrow(
.in_message(sub_out),
.out_message(rs_out)
);

mixcols mixcol(
.in_message(rs_out),
.out_message(out_message)
);

endmodule
