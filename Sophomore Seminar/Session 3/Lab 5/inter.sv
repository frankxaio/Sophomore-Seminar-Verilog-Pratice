module inter (
    // Input signals
    clk,
    rst_n,
    in_valid_1,
    in_valid_2,
    in_valid_3,
    data_in_1,
    data_in_2,
    data_in_3,
    ready_slave1,
    ready_slave2,
    // Output signals
    valid_slave1,
    valid_slave2,
    addr_out,
    value_out,
    handshake_slave1,
    handshake_slave2
);

  //---------------------------------------------------------------------
  //   PORT DECLARATION
  //---------------------------------------------------------------------
  input clk, rst_n, in_valid_1, in_valid_2, in_valid_3;
  input [6:0] data_in_1, data_in_2, data_in_3;
  input ready_slave1, ready_slave2;
  output logic valid_slave1, valid_slave2;
  output logic [2:0] addr_out, value_out;
  output logic handshake_slave1, handshake_slave2;
  //---------------------------------------------------------------------
  //   YOUR DESIGN
  //---------------------------------------------------------------------

  // FSM parameter 
  parameter S_idle = 3'd0;
  parameter S_master1 = 3'd1;
  parameter S_master2 = 3'd2;
  parameter S_master3 = 3'd3;
  parameter S_handshake = 3'd4;

  // FSM state
  logic [2:0] state, next_state;

  // input register (保存輸入數據的完整性)
  logic [6:0] data_in_1_reg, data_in_2_reg, data_in_3_reg;
  logic in_valid_1_reg, in_valid_2_reg, in_valid_3_reg;

  // 將資料讀進來，存到 register，並加上 asynchronous reset 
  always_ff @(posedge clk, negedge rst_n) begin : input_in_valid_1
    if (!rst_n) in_valid_1_reg <= 0;
    // state == S_master1 此時已經將輸入資料存進 register 裡，之後就可以把 in_valid1 拉為 0
    else if (state == S_master1) in_valid_1_reg <= 0;
    else if (in_valid_1) in_valid_1_reg <= in_valid_1;
    else in_valid_1_reg <= in_valid_1_reg;
  end

  always_ff @(posedge clk, negedge rst_n) begin : input_in_valid_2
    if (!rst_n) in_valid_2_reg <= 0;
    // state == S_master2 此時已經將輸入資料存進 register 裡，之後就可以把 in_valid2 拉為 0
    else if (state == S_master2) in_valid_2_reg <= 0;
    else if (in_valid_2) in_valid_2_reg <= in_valid_2;
    else in_valid_2_reg <= in_valid_2_reg;
  end

  always_ff @(posedge clk, negedge rst_n) begin : input_in_valid_3
    if (!rst_n) in_valid_3_reg <= 0;
    else if (state == S_master3) in_valid_3_reg <= 0;
    // state == S_master3 此時已經將輸入資料存進 register 裡，之後就可以把 in_valid3 拉為 0
    else if (in_valid_3) in_valid_3_reg <= in_valid_3;
    else in_valid_3_reg <= in_valid_3_reg;
  end

  always_ff @(posedge clk, negedge rst_n) begin : input_data_in_1
    if (!rst_n) data_in_1_reg <= 0;
    else if (in_valid_1) data_in_1_reg <= data_in_1;
    else data_in_1_reg <= data_in_1_reg;
  end

  always_ff @(posedge clk, negedge rst_n) begin : input_data_in_2
    if (!rst_n) data_in_2_reg <= 0;
    else if (in_valid_2) data_in_2_reg <= data_in_2;
    else data_in_2_reg <= data_in_2_reg;
  end

  always_ff @(posedge clk, negedge rst_n) begin : input_data_in_3
    if (!rst_n) data_in_3_reg <= 0;
    else if (in_valid_3) data_in_3_reg <= data_in_3;
    else data_in_3_reg <= data_in_3_reg;
  end


  always_ff @(posedge clk, negedge rst_n) begin : state_ff
    if (!rst_n) state <= 0;
    else state <= next_state;
  end

  // logic_state 
  always_comb begin : logic_state
    case (state)
      S_idle:  // 根據 in_valid 的狀況決定要從哪個 master 輸入資料
      next_state = ( in_valid_1_reg ) ? S_master1 : (( in_valid_2_reg ) ? S_master2 : ( in_valid_3_reg ) ? S_master3 : S_idle);
      S_master1: // 只要 data_in[6] 和 ready_slave 相符合就 handshake，準備從 master 輸入 slave 資料
      next_state = ( !data_in_1_reg[6] && ready_slave1 ) ? S_handshake : (( data_in_1_reg[6] && ready_slave2 ) ? S_handshake : S_master1);
      S_master2:
      next_state = ( !data_in_2_reg[6] && ready_slave1 ) ? S_handshake : ((data_in_2_reg[6] && ready_slave2 ) ? S_handshake : S_master2);
      S_master3:
      next_state = ( !data_in_3_reg[6] && ready_slave1 ) ? S_handshake : ((data_in_3_reg[6] && ready_slave2 ) ? S_handshake : S_master3);
      S_handshake:  // 決定 handshake 之後的狀態
      next_state = ( !in_valid_1_reg && in_valid_2_reg ) ? S_master2 : ((!in_valid_1_reg && !in_valid_2_reg && in_valid_3_reg) ? S_master3 : S_idle);
      default: next_state = S_idle;
    endcase
  end

  // output logic 
  always @(posedge clk, negedge rst_n) begin : output_logic_of_value_and_addr
    if (!rst_n) begin
      addr_out  <= 0;
      value_out <= 0;
    end else if (next_state == S_master1) begin
      addr_out  <= data_in_1_reg[5:3];
      value_out <= data_in_1_reg[2:0];
    end else if (next_state == S_master2) begin
      addr_out  <= data_in_2_reg[5:3];
      value_out <= data_in_2_reg[2:0];
    end else if (next_state == S_master3) begin
      addr_out  <= data_in_3_reg[5:3];
      value_out <= data_in_3_reg[2:0];
    end else begin
      addr_out  <= 0;
      value_out <= 0;
    end
  end

  always @(posedge clk, negedge rst_n) begin : output_logic_of_handshake_slave
    if (!rst_n) begin
      handshake_slave1 <= 0;
      handshake_slave2 <= 0;
    end  // 確認 next_state 是 S_handshake 的狀態且要輸入一號 slave
    else if ((next_state == S_handshake) && (!data_in_1_reg[6] || !data_in_2_reg[6] || !data_in_3_reg[6]))
      handshake_slave1 <= 1;
    // 確認 next_state 是 S_handshake 的狀態且要輸入二號 slave
    else if ((next_state == S_handshake) && (data_in_1_reg[6] || data_in_2_reg[6] || data_in_3_reg[6]))
      handshake_slave2 <= 1;
    else begin
      handshake_slave1 <= 0;
      handshake_slave2 <= 0;
    end
  end

  always @(posedge clk, negedge rst_n) begin : output_logic_of_slave
    if (!rst_n) begin
      valid_slave1 <= 0;
      valid_slave2 <= 0;
    end
    // 資料從 master1/master2/master3 來，要去 slave1
    else if ((next_state == S_master1) && !data_in_1_reg[6]) valid_slave1 <= 1;
    else if ((next_state == S_master2) && !data_in_2_reg[6]) valid_slave1 <= 1;
    else if ((next_state == S_master3) && !data_in_3_reg[6]) valid_slave1 <= 1;
    // 資料從 master1/master2/master3 來，要去 slave2
    else if ((next_state == S_master1) && data_in_1_reg[6]) valid_slave2 <= 1;
    else if ((next_state == S_master2) && data_in_2_reg[6]) valid_slave2 <= 1;
    else if ((next_state == S_master3) && data_in_3_reg[6]) valid_slave2 <= 1;
    else begin
      valid_slave1 <= 0;
      valid_slave2 <= 0;
    end
  end

endmodule
