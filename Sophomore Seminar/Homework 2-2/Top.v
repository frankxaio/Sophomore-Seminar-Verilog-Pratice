module Top (
    input clk,
	 input reset,
    input  wire [2:0] a,
    input  wire [2:0] b,
    output wire [6:0] sseg_out,
    output wire [3:0] an
);
    wire [2:0] sum;
    wire cout;
    wire [3:0] number_of_one_inter, number_of_zero_inter;

    RCA3 u1 (.a(a), .b(b), .sum(sum), .cout(cout));

    assign number_of_one_inter = sum[0] + sum[1] + sum[2] + cout;       // 計算 1 的數量
    assign number_of_zero_inter = 4 - number_of_one_inter;  // 計算 0 的數量

    scan_led_hex_disp u2 (.clk(clk), 
                        .reset(0), 
                        .hex0(number_of_one_inter), 
                        .hex1(number_of_zero_inter),
                        .hex2(0),
                        .hex3(0),
                        .dp_in(0),
                        .an(an),
                        .sseg(sseg_out)
                        );

    

endmodule //Top