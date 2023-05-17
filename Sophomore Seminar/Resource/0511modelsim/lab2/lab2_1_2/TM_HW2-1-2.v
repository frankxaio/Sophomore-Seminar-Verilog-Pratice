`timescale 1ns/1ns

module TM;

parameter	WIDTH = 3;

reg		[WIDTH-1:0] a, b;
wire	[WIDTH-1:0] sum,cout;


Top		DUT(.a(a), .b(b), .sum(sum), .cout(cout));

parameter t = 10;
//*********************************
//      input pattern
//*********************************

initial begin
	//========= Enter your pattern =========//

	a = 3'b111;
	b = 3'b110;
	#t
	a = 3'b000;
	b = 3'b010;
	#t
	a = 3'b100;
	b = 3'b001;
	#t
	a = 3'b101;
	b = 3'b011;
	
	
	#t      $finish;
end


endmodule