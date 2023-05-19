module Top (
	input [14999:0] image,
	input [29999:0] weight1,
    input [599:0] Bias1,
    input [5999:0] weight2,
    input [299:0] Bias2,
    output [3:0] ans_1,
    output [3:0] ans_2,
    output [3:0] ans_3,
    output [3:0] ans_4,
    output [3:0] ans_5,
    output [3:0] ans_6,
    output [3:0] ans_7,
    output [3:0] ans_8,
    output [3:0] ans_9,
    output [3:0] ans_10
);
    wire [5999:0] Result_x;
    wire [2999:0] Result_y;

    matrix_mutiply1 u1 (.image(image),
                        .weight(weight1),
                        .Bias(Bias1),
                        .Result(Result_x));

    matrix_mutiply2 u2 (.image(Result_x),
                        .weight(weight2),
                        .Bias(Bias2),
                        .Result(Result_y));

    Maximum u3 (.image(Result_y),
                .max_index_1(ans_1),
                .max_index_2(ans_2),
                .max_index_3(ans_3),
                .max_index_4(ans_4),
                .max_index_5(ans_5),
                .max_index_6(ans_6),
                .max_index_7(ans_7),
                .max_index_8(ans_8),
                .max_index_9(ans_9),
                .max_index_10(ans_10));

endmodule //Top