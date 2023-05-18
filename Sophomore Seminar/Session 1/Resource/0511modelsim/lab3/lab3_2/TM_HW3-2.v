`timescale 1ns/1ns

module TM;

parameter	WIDTH = 8;

reg		[2:0] opcode;
wire	[WIDTH-1:0] out;


Top		DUT(.opcode(opcode), .out(out));

parameter t = 10;
//*********************************
//      input pattern
//*********************************

initial begin
	//========= Enter your pattern =========//
	opcode = 3'b000;
	#t
	opcode = 3'b001;
	#t
	opcode = 3'b010;
	#t
	opcode = 3'b011;
	#t
	opcode = 3'b100;
	#t
	opcode = 3'b101;
	#t
	opcode = 3'b110;
	#t
	opcode = 3'b111;
	#t
	opcode = 3'bxxx;
	
	#t      $finish;
end


endmodule