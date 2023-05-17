`timescale 1ns/1ns

module TM;

parameter	WIDTH = 4;

reg		[WIDTH-1:0] a, b;
wire	[WIDTH:0] out;


Top		DUT(.a(a), .b(b), .out(out));

parameter t = 10;
//*********************************
//      input pattern
//*********************************

initial begin
	//========= Enter your pattern =========//
	a = 4'b1000;
	b = 4'b0100;
	#t
	a = 4'b1111;
	b = 4'b0000;
	#t
	a = 4'b1001;
	b = 4'b1011;
	#t
	a = 4'b1100;
	b = 4'b1100;
	#t
	a = 4'b0010;
	b = 4'b1111;
	
	
	#t      $finish;
end


endmodule