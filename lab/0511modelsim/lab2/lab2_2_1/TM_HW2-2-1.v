`timescale 1ns/1ns

module TM;

parameter	WIDTH = 4;

reg 	clk,rst;
reg		[WIDTH-1:0] a, b;
wire	[1:0] out;
wire	[7:0]seg7;


Top		DUT(.rst(rst), .clk(clk), .a(a), .b(b), .out(out), .seg7(seg7));

parameter   ti   = 10;
parameter   th   = ti * 0.5;
	

always #th clk = ~clk;
initial clk = 1'b1;
initial begin
	//========= Enter your pattern =========//
			rst = 1'b1;
	#th		rst = 1'b0;
	#(3*th)	rst = 1'b1;
	a = 4'b1000;
	b = 4'b0100;
	#ti
	a = 4'b1111;
	b = 4'b0000;
	#ti
	a = 4'b1001;
	b = 4'b1011;
	#ti
	a = 4'b1100;
	b = 4'b1100;
	#ti
	a = 4'b0010;
	b = 4'b1111;
	
	
	#ti      $finish;
end


endmodule