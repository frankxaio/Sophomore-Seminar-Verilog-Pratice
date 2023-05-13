`timescale 1ns / 1ps

module seven_segment_display( data_in, seg_out );
 
	input [3:0] data_in;
	output reg[6:0] seg_out;
 
	always@( * )
		case( data_in )
			4'h0 : seg_out = 7'b011_1111; 
			4'h1 : seg_out = 7'b111_1001;
			4'h2 : seg_out = 7'b010_0100;
			4'h3 : seg_out = 7'b011_0000;
			4'h4 : seg_out = 7'b001_1001;
			4'h5 : seg_out = 7'b001_0010;
			4'h6 : seg_out = 7'b000_0010;
			4'h7 : seg_out = 7'b111_1000;
			4'h8 : seg_out = 7'b000_0000;
			4'h9 : seg_out = 7'b001_0000;
			4'ha : seg_out = 7'b000_1000;
			4'hb : seg_out = 7'b000_0011;
			4'hc : seg_out = 7'b100_0110;
			4'hd : seg_out = 7'b010_0001;
			4'he : seg_out = 7'b000_0110;
			4'hf : seg_out = 7'b000_1110;
			default : seg_out =7'b011_1111;
	endcase
	
endmodule
