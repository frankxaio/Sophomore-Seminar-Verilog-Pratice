module Display_ABCD (
    input clk,
    input reset,
    input  [3:0] sw,
    output [6:0] sseg,
    output [3:0] an
);

    reg [3:0] hex_inter0;
    reg [3:0] hex_inter1;
    reg [3:0] hex_inter2;
    reg [3:0] hex_inter3;


  always @(*) begin
        if (sw[3] == 1) hex_inter0 = 4'b1010;
        else if (sw[2] == 1) hex_inter1 = 4'b1011;
        else if (sw[1] == 1) hex_inter2 = 4'b1100;
        else if (sw[0] == 1) hex_inter3 = 4'b1011;
        else begin
            hex_inter0 = 0 ;
            hex_inter1 = 0 ;
            hex_inter2 = 0 ;
            hex_inter3 = 0 ;
        end
  end
    
    scan_led_hex_disp u1 (.hex0(hex_inter0),
                         .hex1(hex_inter1),
                         .hex2(hex_inter2),
                         .hex3(hex_inter3),
                         .clk(clk),
                         .reset(reset),
                         .dp_in(4'b0000),
                         .sseg(sseg),
                         .an(an)
                         );


endmodule //Display_ABCD
