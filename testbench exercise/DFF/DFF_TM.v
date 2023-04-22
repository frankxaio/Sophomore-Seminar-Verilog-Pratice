`timescale 1ps/1ps

module DFF_TM();
    reg d, clk;             // 輸入要令為 reg
    wire q;                 // 輸出要另為 wire

    DFF uut(d, clk, q);     // 使用 DFF，接上 vector 並命為 uut

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        d = 0;

        #10;
        d = 1;

        #40;
        d = 0;

        #100;
        d = 1;
        
        $finish;
    end

    
    
endmodule 