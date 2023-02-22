//-----------------------------------------------------
// Design Name : proj_FSM
// File Name   : proj_FSM.v
// Function    : 2 Phase Clock proj_FSM
// 		 Controller processes enable and
// 		 start signal to data path dp to whether
// 		 or not it will encode or decode.
//-----------------------------------------------------
module proj_FSM (clka, clkb, restart, enable, encode, state, key_gen, outcode);
//-------------Input Ports-----------------------------
input   clka, clkb, restart, enable, encode;
//-------------Output Ports----------------------------
output  start, state[2:0];
//-------------Input ports Data Type-------------------
wire    clka, clkb, restart, enable, encode;
//-------------Output Ports Data Type------------------
reg     key_gen, outcode;
//——————Internal Constants--------------------------
parameter SIZE = 3;
parameter IDLE  = 3'b000, KEY_GEN_1 = 3'b001, KEY_GEN_2 = 3'b010, ENCODE = 3'b011, DECODE = 3'b100;
//-------------Internal Variables---------------------------
reg   [SIZE-1:0]          state;    	// Initial FSM state reg and then after
					// processing new output FSM state reg
wire  [SIZE-1:0]          temp_state; 	// Internal wire for output of function
					// for setting next state
reg   [SIZE-1:0]          next_state; 	// Temporary reg to hold next state to
					// update state on output
					//
assign temp_state = fsm_function(state, enable, encode);
//----------Function for Combinational Logic to read inputs -----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state ;
  input enable;
  input encode;

case(state)
   IDLE: begin
             if (enable == 1) begin
               fsm_function = KEY_GEN_1;
             end else begin
               fsm_function = IDLE;
             end
         end 
   KEY_GEN_1: begin
             fsm_function = KEY_GEN_2;
         end
   KEY_GEN_2: begin
             if (encode == 1) begin
               fsm_function = ENCODE;
             end else begin
               fsm_function = DECODE;
             end
   ENCODE: begin
             fsm_function = IDLE;
            end
   DECODE: begin
             fsm_function = IDLE;
            end
         end
   default: fsm_function = IDLE;
  endcase
endfunction
//----------Seq Logic-----------------------------
always @ (negedge clka)
begin : FSM_SEQ
  if (restart == 1'b1) begin
    next_state <= IDLE;
  end else begin
    next_state <= temp_state;
  end
end
//----------Output Logic——————————————
always @ (negedge clkb)
begin : OUTPUT_LOGIC
  case(next_state)
  IDLE: begin
          state <= next_state;
          key_gen <= 1'b0;
          outcode <= 1'b0;
        end
  KEY_GEN_1: begin
          state <= next_state;
          key_gen <= 1'b1;
          outcode <= 1'b0;
        end
  KEY_GEN_2: begin
          state <= next_state;
          key_gen <= 1'b1;
          outcode <= 1'b0;
         end
  ENCODE: begin
          state <= next_state;
          key_gen <= 1'b0;
          outcode <= 1'b1;
         end
  DECODE: begin
          state <= next_state;
          key_gen <= 1'b1;
          outcode <= 1'b1;
         end
 default: begin
          state <= next_state;
          key_gen <= 1'b0;
          outcode <= 1'b0;
         end
  endcase
end // End Of Block OUTPUT_LOGIC

endmodule // End of Module main_FSM
                                    
