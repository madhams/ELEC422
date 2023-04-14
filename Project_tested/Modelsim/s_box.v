module s_box(input_data, output_data);

  input input_data;
  output output_data;
  wire[3:0] input_data;
  wire[3:0] output_data;
  reg[3:0] tmp_output_data;

  assign output_data = tmp_output_data;

  always @(*) begin
    case(input_data)
      4'b0000 : tmp_output_data = 4'b1001;
      4'b0001 : tmp_output_data = 4'b0100;
      4'b0010 : tmp_output_data = 4'b1010;
      4'b0011 : tmp_output_data = 4'b1011;
      4'b0100 : tmp_output_data = 4'b1101;
      4'b0101 : tmp_output_data = 4'b0001;
      4'b0110 : tmp_output_data = 4'b1000;
      4'b0111 : tmp_output_data = 4'b0101;
      4'b1000 : tmp_output_data = 4'b0110;
      4'b1001 : tmp_output_data = 4'b0010;
      4'b1010 : tmp_output_data = 4'b0000;
      4'b1011 : tmp_output_data = 4'b0011;
      4'b1100 : tmp_output_data = 4'b1100;
      4'b1101 : tmp_output_data = 4'b1110;
      4'b1110 : tmp_output_data = 4'b1111;
      4'b1111 : tmp_output_data = 4'b0111;
    endcase

  end
endmodule
