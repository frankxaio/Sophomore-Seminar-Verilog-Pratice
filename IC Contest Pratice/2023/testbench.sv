`timescale 1ns / 10ps
`define CYCLE 8.0 
`include "LASER.v"


module Testbench ();


  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, Testbench);
  end

  reg CLK = 0;
  reg RST = 1;
  reg [3:0] X;
  reg [3:0] Y;
  wire [3:0] C1X;
  wire [3:0] C1Y;
  wire [3:0] C2X;
  wire [3:0] C2Y;
  wire DONE;



  LASER u_LASER (
      .CLK(CLK),
      .RST(RST),
      .X(X),
      .Y(Y),
      .C1X(C1X),
      .C1Y(C1Y),
      .C2X(C2X),
      .C2Y(C2Y),
      .DONE(DONE)
  );
  always #4 CLK = ~CLK;
  initial begin

    #8 X = 11;
    Y = 0;
    #8 X = 2;
    Y = 1;
    #8 X = 10;
    Y = 1;
    $finish;
  end
endmodule
