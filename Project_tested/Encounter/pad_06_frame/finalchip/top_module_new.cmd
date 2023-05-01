vector d_in d_in_7 d_in_6 d_in_5 d_in_4 d_in_3 d_in_2 d_in_1 d_in_0
vector data_out out_data_15 out_data_14 out_data_13 out_data_12 out_data_11 out_data_10 out_data_9 out_data_8 out_data_7 out_data_6 out_data_5 out_data_4 out_data_3 out_data_2 out_data_1 out_data_0
vector key_in key_in_7 key_in_6 key_in_5 key_in_4 key_in_3 key_in_2 key_in_1 key_in_0
ana in_clka in_clkb in_restart in_enable_encode
ana d_in data_out key_in
|   cycle             1 2 3 4 5 6 7 8 9 10111213141516171819
V   in_restart        0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   in_enable_encode  0 0 0 1 1 1 1 1 1 0 1 0 0 0 0 0 0 0
V   d_in_7            0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1
V   d_in_6            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   d_in_5            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   d_in_4            0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1
V   d_in_3            1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
V   d_in_2            1 1 1 1 1 0 0 0 0 0 0 0 1 1 1 1 1 1
V   d_in_1            1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0
V   d_in_0            1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 1 1 1
V   key_in_7          1 1 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0
V   key_in_6          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V   key_in_5          1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   key_in_4          0 0 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1
V   key_in_3          0 0 0 0 0 1 1 1 1 0 0 0 1 1 1 1 1 1
V   key_in_2          1 1 1 1 1 0 0 0 0 1 1 1 0 0 0 0 0 0
V   key_in_1          1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
V   key_in_0          1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1


| Two phase clock with non-overlap period - same as Modelsim testbench
clock in_clka 0 1 0 0
clock in_clkb 0 0 0 1
R
