module reverse_MC(in_message, out_message);
  input in_message;
  output out_message;
  wire[15:0] in_message, out_message, tmp_message;
  // tmp_message is used to relocate bits from the output of the MC
  // bit order is as follows {b0 - b7, c0- c7}
  mixcols U1(.in_message(in_message), .out_message(tmp_message));

  assign out_message[15] = tmp_message[12]; // b0
  assign out_message[14] = tmp_message[15]; // b1
  assign out_message[13] = tmp_message[14]; // b2
  assign out_message[12] = tmp_message[13] ^ out_message[15]; // b3
  assign out_message[11] = tmp_message[8]; //b4
  assign out_message[10] = tmp_message[11]; // b5
  assign out_message[9] = tmp_message[10]; // b6
  assign out_message[8] = tmp_message[9] ^ out_message[11]; //b7
  assign out_message[7] = tmp_message[4]; // c0
  assign out_message[6] = tmp_message[7]; // c1
  assign out_message[5] = tmp_message[6]; // c2
  assign out_message[4] = tmp_message[5] ^ out_message[7]; //c3
  assign out_message[3] = tmp_message[0]; // c4
  assign out_message[2] = tmp_message[3]; // c5
  assign out_message[1] = tmp_message[2]; // c6
  assign out_message[0] = tmp_message[1] ^ out_message[3]; // c7
endmodule

