`timescale 1ps/1ps

module testbench_ALU (

);
    reg [2:0] op_code;
    wire [7:0] ALU_out;

    ALU uut (op_code, ALU_out);

    initial begin
        op_code = 0;

        #10;
        op_code = 3'b000;

        #10;
        op_code = 3'b010;

        #10;
        op_code = 3'b011;
        
        #10;
        op_code = 3'b100;
        
        $finish;
    end

endmodule //testbench_ALU