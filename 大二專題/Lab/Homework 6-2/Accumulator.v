module Accumulator (
    input clk,
    input clk_plus,
    input clk_minus,
    input reset,
    output reg [3:0] Acc_out  
);
    reg [3:0] Acc;

  always @(posedge clk) begin
    // 按下 clk_plus
    if (clk_plus) begin         
      if (Acc_out < 4'b1001) begin
        Acc_out <= Acc_out + 1;  // 若小於 10 則加一
      end
      else begin
        Acc_out <= 4'b0000;  
      end
    end 
    // 按下 clk_minus
    else if (clk_minus) begin 
      if (Acc_out > 4'b0000) begin
        Acc_out <= Acc_out - 1;  // 若大於 0 則減一
      end
      else begin
        Acc_out <= 4'b1001;  
      end
    end
    else if (reset) begin  // 按下 reset
      Acc_out <= 4'b0000;  
    end
  end

    
endmodule //Accumulator