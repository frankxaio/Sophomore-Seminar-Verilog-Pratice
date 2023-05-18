module Top (
	input [49:0] image_0,
	input [49:0] image_1,
	input [49:0] image_2,
	input [49:0] image_3,
	input [49:0] image_4,
	input [49:0] image_5,
	input [49:0] image_6,
	input [49:0] image_7,
	input [49:0] image_8,
	input [49:0] image_9,
	input [19:0] weight_0,
	input [19:0] weight_1,
	input [19:0] weight_2,
	input [19:0] weight_3,
	input [19:0] weight_4,
	input [19:0] weight_5,
	input [19:0] weight_6,
	input [19:0] weight_7,
	input [19:0] weight_8,
	input [19:0] weight_9,
	input [19:0] weight_10,
	input [19:0] weight_11,
	input [19:0] weight_12,
	input [19:0] weight_13,
	input [19:0] weight_14,
	input [19:0] weight_15,
	input [19:0] weight_16,
	input [19:0] weight_17,
	input [19:0] weight_18,
	input [19:0] weight_19,
	input [19:0] weight_20,
	input [19:0] weight_21,
	input [19:0] weight_22,
	input [19:0] weight_23,
	input [19:0] weight_24,
	input [19:0] weight_25,
	input [19:0] weight_26,
	input [19:0] weight_27,
	input [19:0] weight_28,
	input [19:0] weight_29,
	input [19:0] weight_30,
	input [19:0] weight_31,
	input [19:0] weight_32,
	input [19:0] weight_33,
	input [19:0] weight_34,
	input [19:0] weight_35,
	input [19:0] weight_36,
	input [19:0] weight_37,
	input [19:0] weight_38,
	input [19:0] weight_39,
	input [19:0] weight_40,
	input [19:0] weight_41,
	input [19:0] weight_42,
	input [19:0] weight_43,
	input [19:0] weight_44,
	input [19:0] weight_45,
	input [19:0] weight_46,
	input [19:0] weight_47,
	input [19:0] weight_48,
	input [19:0] weight_49,

	// input [49:0] weight_2 [9:0],
	// input [19:0] bias_1,
	// input [9:0] bias_2,
	// output [] y
	output reg [19:0] image_1_0,
	output reg [19:0] image_1_1,
	output reg [19:0] image_1_2,
	output reg [19:0] image_1_3,
	output reg [19:0] image_1_4,
	output reg [19:0] image_1_5,
	output reg [19:0] image_1_6,
	output reg [19:0] image_1_7,
	output reg [19:0] image_1_8,
	output reg [19:0] image_1_9
);

	reg [9:0] image_1 [19:0]; 
	integer i, j, k;

// input image: 10*50
// weight_1: 50*20
// bias_1: 1*20 
// i = 1 -> 10
// 每次輸入一個 50 個像素的 row，分十次處理
// i=1
// (1x50) * (50x20)  + (1x20)

	always @( *) begin
		for (i=0;i<9;i=i+1) begin
			for (j=0;j<20;j=j+1) begin
				image_1[i][j] = 0;
				for (k=0;k<50;k=k+1)
					image_1[i][j] = image_1[i][j] + image[i][k] * weight[k][j];
			end
		end
	end


endmodule

