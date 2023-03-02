module top_mod (in_clka, in_clkb, in_restart, in_enable, in_encode, out_state_main, out_1, out_2, out_3, in_d_in, in_key_in, in_rc, out_data, out_key);

input    in_clka, in_clkb, in_restart, in_enable, in_encode, in_d_in, in_key_in, in_rc;

output [2:0] out_state_main;
output out_1, out_2, out_3;
output [15:0] out_data;
output [15:0] out_key;

wire in_clka, in_clkb, in_restart, in_enable, in_encode;
wire [7:0] in_d_in;
wire [7:0] in_key_in;
wire [7:0] in_rc;

wire out_1, out_2, out_3;
wire [2:0] out_state_main;
wire [15:0] out_data;
wire [15:0] out_key;


proj_FSM main (.clka (in_clka),
               .clkb (in_clkb),
               .restart (in_restart),
               .enable (in_enable),
               .encode (in_encode),
               .state (out_state_main),
               .out1 (out_1),
               .out2 (out_2),
               .out3 (out_3)
               );

dp dat_path (.clka (in_clka),
            .clkb (in_clkb),
            .restart (in_restart),
            .d_in (in_d_in),
            .key_in (in_key_in),
            .rc (in_rc),
            .out1 (out_1),
            .out2 (out_2),
            .out3 (out_3),
            .data_out (out_data),
            .key_out (out_key),
            );

endmodule
