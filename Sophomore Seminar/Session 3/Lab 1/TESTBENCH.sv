`timescale 1ns / 1ps

module TESTBED ();

  logic [3:0] in_num0, in_num1, in_num2, in_num3;
  logic [4:0] out_num0, out_num1;

  Comb I_Comb (
      .in_num0 (in_num0),
      .in_num1 (in_num1),
      .in_num2 (in_num2),
      .in_num3 (in_num3),
      .out_num0(out_num0),
      .out_num1(out_num1)
  );

  initial begin
    in_num0 = 0;
    in_num1 = 0;
    in_num2 = 0;
    in_num3 = 0;


    #10 in_num0 = 1;
    in_num1 = 2;
    in_num2 = 3;
    in_num3 = 4;

    #20 in_num0 = 5;
    in_num1 = 6;
    in_num2 = 7;
    in_num3 = 8;
    #20 in_num0 = 2;
    in_num1 = 4;
    in_num2 = 7;
    in_num3 = 3;



    #10 $finish;
  end



endmodule
