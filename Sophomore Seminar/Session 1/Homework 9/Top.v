module Top (
	input [14499:0] image,
	input [29999:0] weight1,
    input [599:0] Bias1,
    input [5999:0] weight2,
    input [299:0] Bias2,
	output [2999:0] Result
);
    wire [5999:0] Result_x;
    wire [2999:0] Result_y;
    wire [39:0] max_index;
    
    matrix_mutiply1 u1 (.image(image),
                        .weight(weight1),
                        .Bias(Bias1),
                        .Result(Result_x));

    matrix_mutiply2 u2 (.image(Result_x),
                        .weight(weight2),
                        .Bias(Bias2),
                        .Result(Result_y));

    Maximum u3 (.image(Result_y),
                .max_index(max_index));

    assign Result = Result_y;

endmodule //Top