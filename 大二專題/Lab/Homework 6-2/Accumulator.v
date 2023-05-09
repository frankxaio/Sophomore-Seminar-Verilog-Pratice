module Accumulator (
    input clk,
    input clk_minus,
    input reset,
    output reg [3:0] Acc_out  
);
    reg [3:0] Acc;
    reg [3:0] Acc_minus;

    always @(*) begin
		if (Acc_out>=10)
			Acc = 0;
        else
			Acc = Acc_out + 1;
	end

    always @(*) begin
		if (Acc_out < 0)
			Acc_minus = 10;
        else
			Acc_minus = Acc_out - 1;
	end


    always @(posedge clk or posedge clk_minus or negedge reset) begin
        if (!reset)
            Acc_out <= 0;
        else if (clk_minus)
            Acc_out <= Acc_minus;
        else 
            Acc_out <= Acc;
    end

    
endmodule //Accumulator