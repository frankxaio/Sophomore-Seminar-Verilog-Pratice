`timescale 1ns/1ns

module TM;

parameter	WIDTH = 2;

reg		[WIDTH-1:0] a, b, c;
wire	[WIDTH:0] d;


Top		DUT(.a(a), .b(b), .c(c), .d(d));

parameter t = 10;
//*********************************
//      input pattern
//*********************************

initial begin
	//========= Enter your pattern =========//
	a = 2'd1;
	b = 2'd3;
	c = 2'd2;
	#t
	a = 2'd3;
	b = 2'd3;
	c = 2'd1;
	#t
	a = 2'd2;
	b = 2'd3;
	c = 2'd2;
	#t
	a = 2'd1;
	b = 2'd2;
	c = 2'd3;
	#t
	a = 2'd3;
	b = 2'd0;
	c = 2'd2;
	
	
	#t      $finish;
end


endmodule