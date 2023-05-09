module Divider (
    input clk,
    output reg clk_div
);
    reg [26:0] cnt;

    always @(posedge clk) begin
        if (cnt == 27'd6_250_000) begin
            cnt <= 0;
            clk_div <= ~clk_div;
        end
        else 
           cnt <= cnt + 1;
    end

endmodule //Divider