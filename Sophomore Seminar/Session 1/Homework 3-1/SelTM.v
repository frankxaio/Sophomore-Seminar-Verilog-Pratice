`timescale 1ps/1ps
module SelTM();
    
    reg [2:0] sel;
    wire [6:0] seg_out;
    wire [3:0] an;
    
    Sel utt(sel, seg_out, an);
    
    initial begin
        sel = 0;
        
        #40;
        sel = 3'd1;
        
        #40
        sel = 3'd2;
        
        #40
        sel = 3'd3;
        
        #40
        sel = 3'd4;
        
        $finish;
        
    end
    
endmodule
