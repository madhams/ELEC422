module FSM_tb();

//Define inputs/outputs
reg in_clka, in_clkb, in_restart, in_enable, in_encode;
wire out_key_gen, out_outcode;
wire[2:0] out_state;

//Create FSM object
proj_FSM U1(
.clka (in_clka),
.clkb (in_clkb),
.restart (in_restart),
.enable (in_enable),
.encode (in_encode),
.state (out_state),
.key_gen (out_key_gen),
.outcode (out_outcode));


//Start simulation

initial
begin

// Cycle 1
in_restart = 0;
in_enable = 0;
in_encode = 0;
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
// Cycle 2
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
in_encode = 1;
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
#10
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
