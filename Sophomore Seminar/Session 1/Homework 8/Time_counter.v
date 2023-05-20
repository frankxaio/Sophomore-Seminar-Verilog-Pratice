module Time_counter (input clk,
                     input rstn,
                     input mode,
                     output reg [3:0] acc1,
                     output reg [3:0] acc2,
                     output reg [3:0] acc3,
                     output reg [3:0] acc4);
    // acc1~acc4 代表從右至左的四個 digit
    
    reg [28:0] time_cnt_n,  time_cnt ;
    parameter TIME_ONESEC = 27'd50_000_000;
    
    always @(*) begin
        if (time_cnt == TIME_ONESEC) begin
            time_cnt_n = 0;
        end
        else
            time_cnt_n = time_cnt + 1;
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
            acc4 <= 0;
        end
        else if (time_cnt == TIME_ONESEC)
            case (mode)
                1'b0:
                if ((acc1 == 4'd0) && (acc2 == 4'd0) && (acc3 == 4'd0) && (acc4 == 4'd0)) begin
                    acc1 <= 4'd0;
                    acc2 <= 4'd0;
                    acc3 <= 4'd0;
                    acc4 <= 4'd6;
                end
                else if ((acc1 == 4'd0) && (acc2 == 4'd0) && (acc3 == 4'd0)) begin
                    acc1 <= 4'd9;
                    acc2 <= 4'd5;
                    acc3 <= 4'd9;
                    acc4 <= acc4 - 1;
                end
                else if ((acc1 == 4'd0) && (acc2 == 4'd0)) begin
                    acc1 <= 4'd9;
                    acc2 <= 4'd5;
                    acc3 <= acc3 - 1;
                end
                else if (acc1 == 4'd0) begin
                    acc1 <= 4'd9;
                    acc2 <= acc2 - 1;
                end
                else
                acc1 <= acc1 - 1;
                1'b1: begin
                    acc1 <= acc1;
                    acc2 <= acc2;
                    acc3 <= acc3;
                    acc4 <= acc4;
                end
            endcase
            end
        
        endmodule //Time_counter
