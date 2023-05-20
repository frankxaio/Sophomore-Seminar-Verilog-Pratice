module Top (input clk,
            input rstn,
            output [6:0] seg_out,
            output [3:0] an);
    wire [3:0] acc1, acc2, acc3;
    Time_counter u1  (.clk(clk), .rstn(rstn), .acc1(acc1), .acc2(acc2), .acc3(acc3));
    
    // BCD u2  (.binary(acc), .Hundreds(Hundreds), .Tens(Tens), .Ones(Ones));
    
    scan_led_hex_disp u3(
    .clk(clk),
    .reset(1'b0),
    .hex0(acc1),
    .hex1(acc2),
    .hex2(acc3),
    .hex3(4'b0000),
    .dp_in(4'b1111),
    .an(an),
    .sseg(seg_out)
    );
endmodule //Top
