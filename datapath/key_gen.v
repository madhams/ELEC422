// Want to serially load the data in (8 bits at a time) (can in another
// module)
// After loading (set flag to tell when done), I will
// then proceed to go through the logical path
// ------------------------------------------------->
module key_gen(input_key, output_key);
input input_key;
output output_key;

wire[15:0] input_key, output_key;

//wire[7:0] round_constant;
wire[7:0] z;
wire[3:0] rk2, rk3, srk2, srk3, z0, z1;

//S box section at beginning (key is k0k1k2k3)
//Note that rk2 refers to R(k2) and srk2 refers to S(R(k2))
r_box R1 (.input_data(input_key[7:4]), .output_data(rk2));
r_box R2 (.input_data(input_key[3:0]), .output_data(rk3));
s_box S1 (.input_data(rk2), .output_data(srk2));
s_box S2 (.input_data(rk3), .output_data(srk3));

//First XOR gates (check if they synthesize properly)
assign z0 = srk2 ^ 4'b1101;
assign z1 = srk3 ^ 4'b1010;
assign z = {z0, z1};
assign output_key[15:8] = z ^ input_key[15:8];
assign output_key[7:0] = output_key[15:8] ^ input_key[7:0];
endmodule
