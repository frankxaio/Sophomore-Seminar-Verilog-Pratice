module Timer (
    // Input signals
    in,
    in_valid,
    rst_n,
    clk,
    // Output signals
    out_valid
);

  //---------------------------------------------------------------------
  //   INPUT AND OUTPUT DECLARATION
  //---------------------------------------------------------------------
  input clk;
  input rst_n;
  input in_valid;
  input [4:0] in;
  output logic out_valid;
  //---------------------------------------------------------------------
  //   LOGIC DECLARATION
  //---------------------------------------------------------------------
  logic [4:0]
      in_reg,  // 儲存輸入 in 
      cnt_ns,  // next state of counter 
      cnt,  // cycle 計數器
      in_ns,  // next state of in_reg
      counter,      //! 是否要開始計數，因為每一次輸入 in 之後，只能拉高一次 out_valid。
      counter_ns;  // next state of counter_ns

  logic out_valid_reg;
  //---------------------------------------------------------------------
  //   Your design
  //---------------------------------------------------------------------

  assign in_ns = (in_valid) ? in : in_reg;

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) in_reg <= 0;
    else in_reg <= in_ns;
  end

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) cnt <= 0;
    else cnt <= cnt_ns;
  end

  always @(posedge clk, negedge rst_n) begin : Comparator
    if (!rst_n) out_valid <= 0;
    else if (((cnt + 1) == in_reg) && (in_reg != 0) && (counter == 1)) begin
      out_valid <= 1;
    end else out_valid <= 0;
  end

  always_ff @(posedge clk, negedge rst_n) begin
    if (!rst_n) counter <= 0;
    else counter <= counter_ns;
  end

  always_comb begin
    if (out_valid) begin
      cnt_ns = 0;
      counter_ns = 0;
    end else if (in_valid) begin
      counter_ns = 1;
      cnt_ns = 0;
    end else cnt_ns = cnt + 1;
  end

endmodule

