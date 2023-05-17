module Top (
    input clk,
    input reset,
    output [6:0] seg_out,
    output [3:0] an
);

    wire [3:0] acc1, acc2, acc3, acc4;
    
    scan_led_hex_disp u1 (.hex0(acc1),
                        .hex1(acc2),
                        .hex2(acc3),
                        .hex3(acc4),
                        .clk(clk),
                        .reset(1'b0),
                        .an(an),
                        .sseg(seg_out),
                        .dp_in(4'b1111)
    );

    Time_counter u2 (.clk(clk),
                    .rstn(reset),
                    .acc1(acc1),
                    .acc2(acc2),
                    .acc3(acc3),
                    .acc4(acc4)
    );




endmodule //Top