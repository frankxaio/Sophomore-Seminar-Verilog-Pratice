`timescale 1ns / 1ps

module Top (input clk,
            input reset,
            output [6:0] seg_out,
            output [3:0] an);
    
    // 做累加需要用 DFF
    // 因為把 flip-flop 拿掉會造成 combinational loop
    // 造成電路會沒有穩態，變得無法控制，輸出都會變成 unknown
    
    reg [26:0] time_cnt;
    reg [26:0] time_cnt_n;
    reg [3:0] acc_reg;
    reg [3:0] acc_reg_n;
    
    
    parameter SET_TIME_1S = 27'd50_000_000;
    
    
    // 計數器
    always @(posedge clk or negedge reset) begin
        if (!reset)
            time_cnt <= 27'h0;
        else
            time_cnt <= time_cnt_n;
    end
    
    //
    always @(*) begin
        if (time_cnt == SET_TIME_1S)
            time_cnt_n = 27'h0;
        else
            time_cnt_n = time_cnt + 27'h1;
    end
    
    
    
    always @(posedge clk or negedge reset) begin
        if (!reset)
            acc_reg <= 4'b0000;
        else
            acc_reg <= acc_reg_n;
    end
    
    always @(*) begin
        if (time_cnt == SET_TIME_1S) begin
            if (acc_reg == 4'h9)
                acc_reg_n = 4'h0;
            else
                acc_reg_n = acc_reg + 1'h1;
        end
        else
            acc_reg_n = acc_reg;
    end
    
    // 7-segment display
    seven_segment_display u1 (.data_in(acc_reg), .seg_out(seg_out));
    assign an = 4'b1011;
    
    
endmodule //Top
