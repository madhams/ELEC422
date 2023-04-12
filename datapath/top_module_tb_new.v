module FSM_tb();
//FSM testbench to check functionality of FSM for AES Encoder/Decoder
//Define inputs/outputs
reg in_clka, in_clkb, in_restart, in_enable, in_encode;
wire in_out1, in_out2, in_out3;
wire[2:0] out_state;
reg[7:0] in_d_in, in_key_in;
wire[15:0] out_data_out, out_key_out;
//Create FSM object
proj_FSM U1(
.clka (in_clka),
.clkb (in_clkb),
.restart (in_restart),
.enable (in_enable),
.encode (in_encode),
.state (out_state),
.out1 (in_out1),
.out2 (in_out2),
.out3 (in_out3));

dp U2 (.clka(in_clka),
        .clkb(in_clkb),
        .restart(in_restart),
        .d_in(in_d_in),
        .key_in(in_key_in),
        .out1(in_out1),
        .out2(in_out2),
        .out3(in_out3),
        .data_out(out_data_out),
        .key_out(out_key_out));
//Start simulation

initial
begin

// Cycle 1
in_restart = 0;
in_enable = 0;
in_encode = 1;
in_clka = 0;
in_clkb = 0;
in_d_in = 8'b01101111;
in_key_in = 8'b10100111;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 2
in_restart = 1;
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 3
in_restart = 0;
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 4 start normal routine
in_enable = 1;
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 5
in_d_in = 8'b01101111;
in_key_in = 8'b10100111;
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 6
in_clka = 0;
in_clkb = 0;
in_enable = 0;
in_d_in = 8'b01101011;
in_key_in = 8'b00111011;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 7
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 8
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 9
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 10
in_clka = 0;
in_clkb = 0;
in_encode = 0;
in_enable = 1;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 11
in_d_in = 8'b01111010;
in_key_in = 8'b10100111;
in_clka = 0;
in_clkb = 0;
in_enable = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 12
in_d_in = 8'b11110101;
in_key_in = 8'b00111011;
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 13
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 14
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10;
// Cycle 15
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 16
in_clka = 0;
in_clkb = 0;
in_enable = 1;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 16
in_clka = 0;
in_clkb = 0;
in_enable = 0;
in_restart = 1;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
in_restart = 0;
in_enable = 1;
#10
// Cycle 17
in_clka = 0;
in_clkb = 0;
in_enable = 1;
in_restart = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 18
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 19
in_clka = 0;
in_clkb = 0;
in_enable = 0;
in_restart = 1;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
// Cycle 20
in_clka = 0;
in_clkb = 0;
#10
in_clka = 1;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 0;
#10
in_clka = 0;
in_clkb = 1;
#10
$dumpfile("FSM_tb.vcd");
$dumpvars;
$stop;
end
endmodule
