
// ==  ==  ==  ==  ==  ==  ==  ==  = PORT DELERATION ==  ==  ==  ==  ==  ==  ==  ==  = 
// clk: FPGA 的 50 MHz clock
// rstn: 僅宣告，沒用到
// acc1: 右邊數來第 1 個 digit
// acc2: 右邊數來第 2 個 digit
// acc3: 右邊數來第 3 個 digit
// ==  ==  ==  ==  ==  ==  ==  ==  = PORT DELERATION ==  ==  ==  ==  ==  ==  ==  ==  = 


// ==  ==  ==  ==  ==  ==  ==  ==  = DESCRIPTION ==  ==  ==  ==  ==  ==  ==  ==  = 
// 每經過一秒就加一，直到 acc1 = 9, acc2 = 9, acc3 = 9，就切換成每經過一秒就減一
// ==  ==  ==  ==  ==  ==  ==  ==  = DESCRIPTION ==  ==  ==  ==  ==  ==  ==  ==  = 

module Time_countker (input clk,
                      input rstn,
                      output reg [3:0] acc1,
                      output reg [3:0] acc2,
                      output reg [3:0] acc3);
    reg [28:0] time_cnt_n,  time_cnt ;
    parameter TIME_ONESEC = 27'd50_000_000;
    reg mode,  mode_n;
    
    always @(*) begin
        if (time_cnt == TIME_ONESEC) begin
            time_cnt_n = 0;
        end
        else
            time_cnt_n = time_cnt + 1;
    end
    
    always @(*) begin
        case (mode)
            1'b0:
            if ((acc1 == 9) && (acc2 == 9) && (acc3 == 9))
                mode_n = 1;
            else
                mode_n = mode;
                1'b1:
                if ((acc1 == 0) && (acc2 == 0) && (acc3 == 0))
                    mode_n = 0;
                else
                    mode_n = mode;
                    endcase
        end
        
        
        
        always @(posedge clk or negedge rstn) begin
            if (!rstn)
                mode <= 0;
            else
                mode <= mode_n;
        end
        
        always @(posedge clk or negedge rstn) begin
            if (!rstn)
                time_cnt <= 0;
            else
                time_cnt <= time_cnt_n ;
            
        end
        
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
                acc1 <= 0;
                acc2 <= 0;
                acc3 <= 0;
            end
            else if (time_cnt == TIME_ONESEC)
            case (mode)
                1'b0: begin
                    if (acc1 == 4'd9) begin
                        acc1 <= 0;
                        if (acc2 == 4'd9) begin
                            acc2 <= 0;
                            if (acc3 == 4'd9)
                                acc3 <= 0;
                            else
                                acc3 <= acc3 + 1;
                        end
                        else
                        acc2 <= acc2 + 1;
                    end
                    else
                    acc1 <= acc1 + 1;
                end
                // 從較嚴格的條件開始檢查。
                1'b1: begin
                    if ((acc1 == 4'd0) && (acc2 == 4'd0)) begin
                        acc1 <= 4'd9;
                        acc2 <= 4'd9;
                        acc3 <= acc3 - 1;
                    end
                    else if (acc1 == 4'd0) begin
                        acc1 <= 4'd9;
                        acc2 <= acc2 - 1;
                    end
                    else
                    acc1 <= acc1 - 1;
                end
            endcase
        end
        
        endmodule //Time_counter
