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
	a = 4'd1;
	b = 4'd4;
	#t
	a = 4'd11;
	b = 4'd13;
	#t
	a = 4'd15;
	b = 4'd12;
	#t
	a = 4'd7;
	b = 4'd6;
	#t
	a = 4'd5;
	b = 4'd2;
	#t
	a = 4'd9;
	b = 4'd9;
	#t
	a = 4'd0;
	b = 4'd3;
	#t
	a = 4'd10;
	b = 4'd8;
	
	#t      $finish;
end


endmodule