module Maxmin (
    // input signals
    in_num,
    in_valid,
    rst_n,
    clk,

    // output signals
    out_valid,
    out_max,
    out_min
);

  //---------------------------------------------------------------------
  //   INPUT AND OUTPUT DECLARATION                         
  //---------------------------------------------------------------------
  input clk;
  input rst_n;
  input [7:0] in_num;
  input in_valid;
  output logic [7:0] out_max;
  output logic [7:0] out_min;
  output logic out_valid;
  //---------------------------------------------------------------------
  //   LOGIC DECLARATION
  //---------------------------------------------------------------------
  logic [3:0] cnt, cnt_reg; // counter 紀錄接收到第幾個數字了
  logic out_valid_reg; // next state of out_valid 
  //---------------------------------------------------------------------
  //   Your design                        
  //---------------------------------------------------------------------

  assign out_min = 255; // 令 out_min 的初始值為最大值，一開始才能比較出最小值。

  always_comb begin : counter_comb
    if (in_valid) begin
      cnt_reg = cnt + 1;
    end else begin
      cnt_reg = 0;
    end
  end

  always @(posedge clk, negedge rst_n) begin : counter_ff
    if (!rst_n) cnt <= 0;
    else cnt <= cnt_reg;
  end

  always @(posedge clk, negedge rst_n) begin : output_valid
    if (!rst_n) out_valid <= 0;
    else if ((cnt + 1) == 15) out_valid <= 1;
    else out_valid <= 0;
  end
  
  always @(posedge clk, negedge rst_n) begin : MAX
    if (!rst_n) out_max <= 0;
    else if (!in_valid) out_max <= 0;
    else if ((in_num > out_max) && in_valid) out_max <= in_num;
    else out_max <= out_max;
  end

  always @(posedge clk, negedge rst_n) begin : MIN
    if (!rst_n) out_min <= 255;
    else if (!in_valid) out_min <= 255;
    else if ((in_num < out_min) && in_valid) out_min <= in_num;
    else out_min <= out_min;
  end

endmodule
