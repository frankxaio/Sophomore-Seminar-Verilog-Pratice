module Divider (
    input clk,
    output reg clk_div
);
    reg [26:0] cnt;     // 設定 counter 計數器

    // clk 為 50 MHz，每經過 1/50M 秒有一個 posedge
    // 數 6.25M 個 posedge 代表經過了 1/8 秒
    always @(posedge clk) begin 
        if (cnt == 27'd6_250_000) begin
            cnt <= 0;
            clk_div <= ~clk_div;     // 每 1/8 秒翻轉一次 clk_div，所以 clk_div 每經過 1/4 秒有一個 posedge　(翻兩次才會回到自己)
        end                         
        else 
           cnt <= cnt + 1;
    end

endmodule //Divider