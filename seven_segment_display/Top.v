`timescale 1ns / 1ps

module Top(
    input [3:0] data_in,
    output dp,
    output [3:0] an,
    output [6:0] seg_out
    );
	 
	 assign an = 4'b0111;
	 assign dp = 1;
	 test u1 (.data_in(data_in), .seg_out(seg_out));
	 


endmodule
