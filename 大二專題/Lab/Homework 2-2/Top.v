module Top (
    input  wire [2:0] a,
    input  wire [2:0] b,
    output wire dp,       // 控制小數點
    output wire [6:0] seg_out,
    output wire [3:0] an, // 控制第幾個七段顯示器
    output wire [2:0] number_of_zero // 0 的數量用 LED 燈表示
);
    wire [2:0] sum;
    wire cout;
    wire [2:0] number_of_one;
    
    RCA3 u1 (.a(a), .b(b), .sum(sum), .cout(cout));

    assign number_of_one = sum[0] + sum[1] + sum[2] + cout;       // 計算 1 的數量
    assign number_of_zero = 4 - number_of_one;  // 計算 0 的數量

    seven_segment_display u2 (.data_in(number_of_one), .seg_out(seg_out));
    assign an = 4'b0111; // 左邊數來第二個七段顯示器負責顯示 1 的數量
    assign dp = 1;

endmodule //Top