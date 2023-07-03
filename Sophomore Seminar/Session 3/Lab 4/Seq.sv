module Seq (
    // input signals
    clk,
    rst_n,
    in_data,
    in_state_reset,
    // output signals
    out_cur_state,
    out
);

  //---------------------------------------------------------------------
  //   INPUT AND OUTPUT DECLARATION                         
  //---------------------------------------------------------------------
  input clk, rst_n, in_data, in_state_reset;
  output logic [2:0] out_cur_state;
  output logic out;
  //---------------------------------------------------------------------
  //   FSM state                      
  //---------------------------------------------------------------------
  parameter S_0 = 3'd0;
  parameter S_1 = 3'd1;
  parameter S_2 = 3'd2;
  parameter S_3 = 3'd3;
  parameter S_4 = 3'd4;
  parameter S_5 = 3'd5;
  parameter S_6 = 3'd6;
  parameter S_7 = 3'd7;
  //---------------------------------------------------------------------
  //   INNER LOGIC DECLARATION                       
  //---------------------------------------------------------------------
  logic [2:0] out_nex_state;
  logic out_nex;
  //---------------------------------------------------------------------
  //   Your design                       
  //---------------------------------------------------------------------

  always_comb begin : next_state_logic 
    case (out_cur_state)
      S_0: out_nex_state = in_data ? S_1 : S_2;
      S_1: out_nex_state = in_data ? S_1 : S_4;
      S_2: out_nex_state = in_data ? S_4 : S_3;
      S_3: out_nex_state = in_data ? S_5 : S_6;
      S_4: out_nex_state = in_data ? S_4 : S_5;
      S_5: out_nex_state = in_data ? S_5 : S_7;
      S_6: out_nex_state = in_data ? S_7 : S_6;
      S_7: out_nex_state = in_data ? S_7 : S_7;
    endcase

    out_nex = (out_nex_state == S_7); // output logic 

  end

  always_ff @(posedge clk, negedge rst_n) begin : state_reg
    if (!rst_n) begin
      out <= 0;
      out_cur_state <= 0;
    end else if (in_state_reset) begin
      out_cur_state <= 0;
      out <= 0;
    end else begin 
      out_cur_state <= out_nex_state;
      out <= out_nex;
    end
  end

endmodule

