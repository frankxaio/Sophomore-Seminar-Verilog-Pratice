`timescale 1ns/1ns

module TM;

parameter	WIDTH = 8;

reg 	clk,rst;
wire 	[3:0]out;
wire	[WIDTH-1:0] seg7;


Top		DUT(.rst(rst), .clk(clk), .out(out), .seg7(seg7));

//*********************************
//      input pattern
//*********************************

parameter   ti   = 10;
parameter   th   = ti * 0.5;
	

always #th clk = ~clk;
initial clk = 1'b1;
initial begin
	//========= Enter your pattern =========//
			rst = 1'b1;
	#th		rst = 1'b0;
	#(3*th)	rst = 1'b1;
	
	
	#(80*ti)      $finish;
end


endmodule