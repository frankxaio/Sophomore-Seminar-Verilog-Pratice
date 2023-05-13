module Debounce_circuit (
    input  clk,
    input  reset,
    input  bnt,
    output reg bnt_out   
);
    reg [6:0] shift_reg;
    
    always @(posedge clk) begin
        shift_reg <= {shift_reg[5:0],bnt}
        if (shift_reg == 4'b0000)
            bnt_out <= 1'b0;
        else
            bnt_out <= 1'b1;
    end

endmodule //Debounce_circuit