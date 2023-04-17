vector d_in in_d_in\[7\] in_d_in\[6\] in_d_in\[5\] in_d_in\[4\] in_d_in\[3\] in_d_in\[2\] in_d_in\[1\] in_d_in\[0\]
vector data_out out_data\[15\] out_data\[14\] out_data\[13\] out_data\[12\] out_data\[11\] out_data\[10\] out_data\[9\] out_data\[8\] out_data\[7\] out_data\[6\] out_data\[5\] out_data\[4\] out_data\[3\] out_data\[2\] out_data\[1\] out_data\[0\]
vector key_in in_key_in\[7\] in_key_in\[6\] in_key_in\[5\] in_key_in\[4\] in_key_in\[3\] in_key_in\[2\] in_key_in\[1\] in_key_in\[0\]
ana in_clka in_clkb in_restart in_enable_encode
ana d_in data_out key_in
|   cycle             1 2 3 4 5 6 7 8 9 10111213141516171819
V   in_restart        0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   in_enable_encode  0 0 0 1 1 1 1 1 1 0 1 0 0 0 0 0 0 0
V   in_d_in\[7\]      0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1
V   in_d_in\[6\]      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   in_d_in\[5\]      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   in_d_in\[4\]      0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
V   in_d_in\[3\]      1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
V   in_d_in\[2\]      1 1 1 1 1 0 0 0 0 0 0 0 1 1 1 1 1 1
V   in_d_in\[1\]      1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
V   in_d_in\[0\]      1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 1 1 1
V   in_key_in\[7\]    1 1 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0
V   in_key_in\[6\]    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   in_key_in\[5\]    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   in_key_in\[4\]    0 0 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1
V   in_key_in\[3\]    0 0 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1
V   in_key_in\[2\]    1 1 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0
V   in_key_in\[1\]    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   in_key_in\[0\]    1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1


| Two phase clock with non-overlap period - same as Modelsim testbench
clock in_clka 0 1 0 0
clock in_clkb 0 0 0 1
R
