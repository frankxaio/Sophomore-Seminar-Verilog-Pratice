module LASER (
    CLK,
    RST,
    X,
    Y,
    C1X,
    C1Y,
    C2X,
    C2Y,
    DONE
);


  // I/O DECLARATION
  input CLK;
  input RST;
  input [3:0] X;
  input [3:0] Y;
  output reg [3:0] C1X;
  output reg [3:0] C1Y;
  output reg [3:0] C2X;
  output reg [3:0] C2Y;
  output reg DONE;

  // WIRE DECLARATION
  reg [3:0] x_list[0:39], y_list[0:39];  // input data
  reg [7:0] cnt, cnt_nxt;  // input data number 
  reg [3:0]
      x1,
      y1,  // circle 1
      x2,
      y2,  // circle 2 
      x_best,
      y_best;  // x_best, y_best is old c2 xy
  reg [3:0] cs, ns;  // FSM 
  reg [3:0] abs_x[0:39], abs_y[0:39];  // distance of circle and target
  reg [39:0] p1_list, p1_max_list, p2_list;  // store target in c1, c2, c1 but not in c2
  reg [4:0] c1_covered_nxt, c1_covered;  // excluded c2
  reg [3:0] x, y;  // scanning circle coordinate

  // PARAMETER DECLARATION
  integer i;
  parameter INPUT = 0, FIND = 1, CHECK = 2, OUTPUT = 3;

  // input 
  always @(posedge CLK) begin
    if (cs == INPUT) begin
      x_list[0] <= X;
      y_list[0] <= Y;
      for (i = 0; i < 39; i = i + 1) begin
        x_list[i+1] <= x_list[i];
        y_list[i+1] <= y_list[i];
      end
      // input data only 40 sets, to avoid data begin pushed out.
    end else begin
      for (i = 0; i < 40; i = i + 1) begin
        x_list[i] <= x_list[i];
        y_list[i] <= y_list[i];
      end
    end
  end

  // comb logic of calculation
  always @(*) begin
    c1_covered_nxt = 0;
    for (i = 0; i < 40; i = i + 1) begin
      abs_x[i] = (x > x_list[i]) ? x - x_list[i] : x_list[i] - x;
      abs_y[i] = (y > y_list[i]) ? y - y_list[i] : y_list[i] - y;
      p1_list[i] = ( (abs_x[i] + abs_y[i]) <= 4 ) 
                  || (abs_x[i] == 2 && abs_y[i] == 3)
                  || (abs_x[i] == 3 && abs_y[i] == 2 );
      c1_covered_nxt = (p2_list[i]) ? c1_covered_nxt : c1_covered_nxt + p1_list[i];
    end
  end

  // seq logic of calculation 
  always @(posedge CLK) begin
    case (cs)
      INPUT: begin
        x1 <= 0;
        y1 <= 0;
        x2 <= 0;
        y2 <= 0;
        x_best <= 0;
        y_best <= 0;
        c1_covered <= 0;
        p1_list <= 0;
        p2_list <= 0;
      end
      FIND: begin
        if (c1_covered_nxt >= c1_covered) begin
          x1 <= x;
          y1 <= y;
          c1_covered <= c1_covered_nxt;
          p1_max_list <= p1_list;
        end else begin
          x1 <= x1;
          y1 <= y1;
        end
      end
      CHECK: begin
        p2_list <= p1_max_list;
        x_best <= x2;
        y_best <= y2;
        x2 <= x1;
        y2 <= y1;
        x1 <= 0;
        y1 <= 0;
        c1_covered <= 0;
      end
    endcase
  end

  // seq of counter
  always @(posedge CLK, posedge RST) begin
    if (RST) cnt <= 0;
    else begin
      case (cs)
        INPUT: cnt <= (cnt == 39) ? 0 : cnt_nxt;
        FIND: cnt <= (cnt == 183) ? 0 : cnt_nxt;
        OUTPUT: cnt <= 0;
        default: cnt <= cnt;
      endcase
    end
  end

  // comb of counter
  always @(*) begin
    case (cs)
      INPUT: cnt_nxt = cnt + 1;
      FIND: begin  // special scan path 
        if (cnt == 31) cnt_nxt <= cnt + 31;
        else if (cnt == 12) cnt_nxt <= cnt + 32;
        else if (cnt == 44) cnt_nxt <= cnt + 8;
        else if (cnt == 52) cnt_nxt <= cnt + 24;
        else if (cnt == 76) cnt_nxt <= cnt + 8;
        else if (cnt == 61) cnt_nxt <= cnt + 61;
        else if (cnt == 122) cnt_nxt <= cnt + 25;
        else if (cnt == 147) cnt_nxt <= cnt + 8;
        else if (cnt == 155) cnt_nxt <= cnt + 2;
        else if (cnt == 157) cnt_nxt <= cnt + 4;
        else if (cnt == 180) cnt_nxt <= cnt + 3;
        else if (x == 11) cnt_nxt <= cnt + 5;
        else if (x == 1) cnt_nxt <= cnt + 2;
        else if (x == 4) cnt_nxt <= cnt + 3;
        else if (x == 5) cnt_nxt <= cnt + 2;
        else cnt_nxt <= cnt + 1;
      end
    endcase
    // scan point
    x = cnt[3:0];
    y = cnt[7:4];
  end

  // comb of FSM
  always @(*) begin
    case (cs)
      INPUT: ns = (cnt == 39) ? FIND : cs;
      FIND: ns = (cnt == 183) ? CHECK : cs;  // special xy scanning path
      CHECK: ns = ((x1 == x_best) && (y1 == y_best)) ? OUTPUT : FIND;
      OUTPUT: ns = INPUT;
      default: ns = INPUT;
    endcase
    DONE = (cs == OUTPUT);  // if ( cs == OUTPUT ) DONE = 1
  end

  // seq of FSM 
  always @(posedge CLK or posedge RST) begin
    if (RST) begin
      cs  <= INPUT;
      C1X <= 0;
      C1Y <= 0;
      C2X <= 0;
      C2Y <= 0;
    end else begin
      cs <= ns;
      // C1 and C2 ready to output when DONE signal is high
      if (ns == OUTPUT) begin
        C1X <= x1;
        C1Y <= y1;
        C2X <= x2;
        C2Y <= y2;
      end
    end
  end


endmodule
