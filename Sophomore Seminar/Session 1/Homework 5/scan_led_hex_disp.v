`timescale 1ns / 1ps
module scan_led_hex_disp(input clk,
                         input reset,
                         input [3:0] hex0,
                         input [3:0] hex1,
                         input [3:0] hex2,
                         input [3:0] hex3,
                         input [3:0] dp_in,
                         output reg [3:0] an,    // 控制第幾個顯示器亮
                         output reg [6:0] sseg); // 愈輸出的數字
    
    localparam N = 18; // 因為要留兩個bit作為判斷狀態的依據，所以使用 N = 18 才能使 50MHz 分成，50Mhz/(2^15-1)。
    reg [N-1:0] regN;  // 使用 16 bit 對 50Mhz 的 clock 進行分頻。
    reg [3:0] hex_in;
    reg dp;
    
    always@(posedge clk, posedge reset)
    begin
        if (reset)
            regN <= 0;
        else
            regN <= regN + 1;
    end
    
    always@ (*)
    begin
        case(regN[N-1:N-2])
            2'b00:begin
                an     = 4'b1110;  // 選第零號顯示器
                hex_in = hex0; // 將愈顯示在零號顯示器的數字輸入
                dp     = dp_in[0]; // 控制小數點
            end
            2'b01:begin
                an     = 4'b1101;  // 選第一號顯示器
                hex_in = hex1;
                dp     = dp_in[1];
            end
            2'b10:begin
                an     = 4'b1011;
                hex_in = hex2;
                dp     = dp_in[2];
            end
            default:begin
                an     = 4'b0111;
                hex_in = hex3;
                dp     = dp_in[3];
            end
            
        endcase
        
    end
    always@ (*)
    begin
        case(hex_in)
            4'h0: sseg[6:0]    = 7'b011_1111; //共陰極
            4'h1: sseg[6:0]    = 7'b111_1001;
            4'h2: sseg[6:0]    = 7'b010_0100;
            4'h3: sseg[6:0]    = 7'b011_0000;
            4'h4: sseg[6:0]    = 7'b001_1001;
            4'h5: sseg[6:0]    = 7'b001_0010;
            4'h6: sseg[6:0]    = 7'b000_0010;
            4'h7: sseg[6:0]    = 7'b111_1000;
            4'h8: sseg[6:0]    = 7'b000_0000;
            4'h9: sseg[6:0]    = 7'b001_0000;
            4'ha: sseg[6:0]    = 7'b000_1000;
            4'hb: sseg[6:0]    = 7'b000_0011;
            4'hc: sseg[6:0]    = 7'b100_0110;
            4'hd: sseg[6:0]    = 7'b010_0001;
            4'he: sseg[6:0]    = 7'b000_0110;
            4'hf: sseg[6:0]    = 7'b000_1110;
            default: sseg[6:0] = 7'b100_0111;
        endcase
    end
endmodule
