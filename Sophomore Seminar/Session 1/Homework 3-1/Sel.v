module Sel (input [3:0] sel,
            output [6:0] seg_out,
            output reg [3:0] an);
    assign seg_out = 7'b111_1001;
    always @(*) begin
        case (sel)
            4'b0001: an = 4'b1110;
            4'b0010: an = 4'b1101;
            4'b0100: an = 4'b1011;
            4'b1000: an = 4'b0111;
            default: an = 4'b1111;
        endcase
    end
    
endmodule //Sel
