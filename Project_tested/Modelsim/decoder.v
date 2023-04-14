module decoder(in_message, out_message, in_key);

input in_message, in_key;
output out_message;

wire[15:0] mc_out, rs_out, sub_out, in_message, out_message, in_key;

reverse_MC MC(.in_message(in_message), .out_message(mc_out));

shiftrow SR(.in_message(mc_out), .out_message(rs_out));

r_box sub1(
.input_data(rs_out[15:12]),
.output_data(sub_out[15:12])
);
r_box sub2(
.input_data(rs_out[11:8]),
.output_data(sub_out[11:8])
);
r_box sub3(
.input_data(rs_out[7:4]),
.output_data(sub_out[7:4])
);
r_box sub4(
.input_data(rs_out[3:0]),
.output_data(sub_out[3:0])
);

assign out_message = sub_out^in_key;

endmodule
