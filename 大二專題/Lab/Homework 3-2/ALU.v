module ALU (
    input  wire [2:0] op_code,
    output reg [7:0] ALU_out
);
    parameter A = 5'b11110;
    parameter B = 2'b10;
    always @(*) begin
        case (op_code)
            3'b000: ALU_out = A+B;
            3'b010: ALU_out = A-B;
            3'b011: ALU_out = A*B;
            3'b100: ALU_out = A/B+B;
            3'b110: ALU_out = A+B+3'b110;
            3'b111: ALU_out = A*2+B*10;
            default: ALU_out = 0;
        endcase
    end


endmodule //ALU