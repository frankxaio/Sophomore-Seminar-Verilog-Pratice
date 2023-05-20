module Debounce_circuit (input clk,
                         input reset,
                         input D_in,
                         output reg D_out);
    // 按鈕預設為 low，按鈕按下時為 high
    // 按下時，D_in = 1，shift_reg ! = 0，所以輸出 1。
    reg [3:0] shift_reg;
    
    always @(posedge clk) begin
        shift_reg <= {shift_reg[2:0],D_in};
        if (shif t_reg == 4'd0)
            D_out <= 1'b0;
        else
            D_out <= 1'b1;
    end
    
endmodule //Debounce_circuit
