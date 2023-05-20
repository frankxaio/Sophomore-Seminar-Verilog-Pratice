module Top (input clk,
            input reset,
            input D_in,
            input D_reset,
            input D_minus,
            output [6:0] seg_out,
            output [3:0] an);
    wire D_out1, D_out2, D_out3;
    wire [3:0] Acc ;
    wire clk_div;
    
    Debounce_circuit u3(.clk(clk), .reset(reset), .D_in(D_in),    .D_out(D_out1));
    Debounce_circuit u4(.clk(clk), .reset(reset), .D_in(D_reset), .D_out(D_out2));
    Debounce_circuit u5(.clk(clk), .reset(reset), .D_in(D_minus), .D_out(D_out3));
    Divider u6 (.clk(clk), .clk_div(clk_div));
    
    Accumulator u1 (.clk(clk_div), .clk_plus(D_out1), .reset(D_out2), .clk_minus(D_out3), .Acc_out(Acc));
    
    seven_segment_display u2 (.data_in(Acc), .seg_out(seg_out));
    
    assign an = 4'b1110;
    
endmodule //Top
