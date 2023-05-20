module Top (input clk,
            input [2:0] op_code,
            output [3:0] an,
            output [6:0] sseg);
    wire [7:0] ALU_out;
    wire [3:0] Hundreds, Tens, Ones;
    
    ALU u1 (op_code, ALU_out);
    BCD u2 (ALU_out, Hundreds, Tens, Ones);
    
    // 不需要接 reset, 就把 reset 設成 0
    scan_led_hex_disp u3 (.clk(clk),
    .reset(0),
    .hex3(0),
    .hex2(Hundreds),
    .hex1(Tens),
    .hex0(Ones),
    .dp_in(dp),
    .an(an),
    .sseg(sseg)
    );
    
    
    
endmodule //Top
