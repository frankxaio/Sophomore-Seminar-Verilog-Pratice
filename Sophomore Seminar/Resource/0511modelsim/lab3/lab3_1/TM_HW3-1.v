`timescale 1ns/1ns

module TM;

parameter	WIDTH = 4;

reg		[1:0] sel;
wire	[WIDTH-1:0] out;


Top		DUT(.sel(sel), .out(out));

parameter t = 10;
//*********************************
//      input pattern
//*********************************

initial begin
	//========= Enter your pattern =========//
	sel = 2'd0;
	#t
	sel = 2'd1;
	#t
	sel = 2'd2;
	#t
	sel = 2'd3;
	#t
	sel = 2'dx;
	#t
	sel = 2'dz;
	
	
	#t      $finish;
end


endmodule