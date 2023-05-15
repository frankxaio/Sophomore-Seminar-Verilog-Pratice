module Top (
	input [9:0] image [49:0],
	input [49:0] weight_1 [19:0],
	input [49:0] weight_2 [9:0],
	input [19:0] bias_1,
	input [9:0] bias_2,
	output [] y

);

	reg [9:0] x [49:0]; 
	integer i;
	

// input image: 10*50
// weight_1: 50*20
// bias_1: 1*20 
// i = 1 -> 10
// 每次輸入一個 50 個像素的 row，分十次處理
// i=1
// [0] image [49:0] * [49:0] weight_1 [19:0] + bias_1 [19:0]
// **遇到矩陣大小不一樣，該怎相乘?**
// 

always @( *) begin
	for (i=0;i<49:i++) begin
		x = 
	end

    
end



/*
clear;
clc;
close all; 

load weight;
load input;

for i  = 1:10
    x = input(i,:) * weight + bias;
    x(x<0) = 0;
    y = x * weight2 + bias2;
    [a,b] = max(y);
    ans(i) = b; 
end
*/
