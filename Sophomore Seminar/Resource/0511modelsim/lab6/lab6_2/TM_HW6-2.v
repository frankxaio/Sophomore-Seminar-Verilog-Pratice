`timescale 1ns/1ns

module TM;

parameter	WIDTH = 8;

reg clk,rst,plus,sub;
wire [3:0]out;
wire	[WIDTH-1:0] seg7;


Top		DUT(.clk,(clk), .rst(rst), .plus(plus), .sub(sub), .out(out), .seg7(seg7));

//*********************************
//      input pattern
//*********************************

parameter   ti   = 10;
parameter   th   = ti * 0.5;
	

always #th clk = ~clk;
initial	clk = 1'b1;
initial begin
	//========= Enter your pattern =========//
	rst = 1'b1;
	plus = 1'b1;
	sub = 1'b1;
	#th	
	rst = 1'b0;
	#(3*th)	
	rst = 1'b1;
	#(2*ti)	
	plus = 1'b0;
	sub = 1'b1;
	#(2*ti)	
	plus = 1'b1;
	sub = 1'b1;
	#ti
	plus = 1'b1;
	sub = 1'b0;
	#(2*ti)	
	plus = 1'b0;
	sub = 1'b1;
	#(8*ti)	
	plus = 1'b1;
	sub = 1'b0;
	#ti
	plus = 1'b0;
	sub = 1'b1;
	#(9*ti)	
	plus = 1'b1;
	sub = 1'b1;
	#ti
	plus = 1'b1;
	sub = 1'b0;
	#(8*ti)
	#ti      $finish;
end


endmodule