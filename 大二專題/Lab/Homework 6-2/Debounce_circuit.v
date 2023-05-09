module Debounce_circuit ( // 經過四個周期的輸入都為零，才會在第五個週期輸出零。
           input clk,
           input reset,
           input D_in,
           output reg D_out
       );
reg [2:0] next_state, current_state;

// next state combinational logic，依據目前的狀態與輸入調整下一次的狀態
always @(*)
begin
    case (current_state)
        3'd0:
            next_state = D_in ? 3'd0 : 3'd1;
        3'd1:
            next_state = D_in ? 3'd0 : 3'd2;
        3'd2:
            next_state = D_in ? 3'd0 : 3'd3;
        3'd3:
            next_state = D_in ? 3'd0 : 3'd4;
        3'd4:
            next_state = D_in ? 3'd0 : 3'd5;
        3'd5:
            next_state = D_in ? 3'd0 : 3'd5;
        default:
            next_state = 3'd0;
    endcase
end

// state register，每當clock觸發時，就把下一個狀態的值送給目前的狀態
always @(posedge clk or negedge reset)
begin
    if (!reset)
        current_state <= 0;
    else
        current_state <= next_state;
end

// output combinational logic，這是 moore machine，所以根據目前的狀態決定輸出就好
always @(*)
begin
    case (current_state)
        3'd0:
            D_out = 1'b0;
        3'd1:
            D_out = 1'b0;
        3'd2:
            D_out = 1'b0;
        3'd3:
            D_out = 1'b0;
        3'd4:
            D_out = 1'b0;
        3'd5:
            D_out = 1'b1;
        default:
            D_out = 1'b1; // 按鈕預設為高電位，所以當沒有按鈕觸發的時候，都為 High
    endcase
end

endmodule //Debounce_circuit
