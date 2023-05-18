`timescale 1ns / 1ps

module Top_tb ();

	reg [499:0] image;
	reg [999:0] weight;
	
	wire [199:0] image_1;
	
	Top u1(.image(image), .weight(weight), .image_1(image_1));
	
	initial begin
		
		//Initial inputs
    
    end

endmodule //Top_tb



