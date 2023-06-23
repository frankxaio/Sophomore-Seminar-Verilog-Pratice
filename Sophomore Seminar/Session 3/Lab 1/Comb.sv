module Comb (
    // Input signals
    in_num0,
    in_num1,
    in_num2,
    in_num3,
    // Output signals
    out_num0,
    out_num1
);
  //---------------------------------------------------------------------
  //   INPUT AND OUTPUT DECLARATION                         
  //---------------------------------------------------------------------
  input [3:0] in_num0, in_num1, in_num2, in_num3;
  output logic [4:0] out_num0, out_num1;

  //---------------------------------------------------------------------
  //   LOGIC DECLARATION
  //---------------------------------------------------------------------
  logic [3:0] A, B, C, D;
  logic [4:0] num_0, num_1;
  //---------------------------------------------------------------------
  //   Your DESIGN                        
  //---------------------------------------------------------------------
  assign A = ~(in_num0 ^ in_num1);
  assign B = in_num1 | in_num3;
  assign C = in_num0 & in_num2;
  assign D = in_num2 ^ in_num3;

  assign num_0 = A + B;
  assign num_1 = C + D;

  assign out_num0 = (num_0 < num_1) ? num_0 : num_1;
  assign out_num1 = (num_0 < num_1) ? num_1 : num_0;

endmodule
