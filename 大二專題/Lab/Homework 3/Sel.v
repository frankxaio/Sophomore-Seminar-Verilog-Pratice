module Sel (
    input [2:0] sel,
    output [6:0] seg_out,
    output reg [3:0] an
);
    assign seg_out = 1'h1;
    always @( *) begin
        case (sel)
            3'd0: an = 4'b1110;
            3'd1: an = 4'b1101;
            3'd2: an = 4'b1011;
            3'd3: an = 4'b0111;
            default: an = 4'b0000; 
        endcase
    end

endmodule //Sel