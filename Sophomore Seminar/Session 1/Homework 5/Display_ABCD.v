module Display_ABCD (input clk,
                     input [3:0] sw,
                     output [6:0] sseg,
                     output [3:0] an);
    
    reg [3:0] hex_inter0;
    reg [3:0] hex_inter1;
    reg [3:0] hex_inter2;
    reg [3:0] hex_inter3;
    
    always @(*) begin
        case (sw)
            4'b0000: begin
                hex_inter0 = 0;
                hex_inter1 = 0;
                hex_inter2 = 0;
                hex_inter3 = 0;
            end
            4'b0001: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 0;
                hex_inter2 = 0;
                hex_inter3 = 0;
            end
            4'b0010: begin
                hex_inter0 = 0;
                hex_inter1 = 4'b1011;
                hex_inter2 = 0;
                hex_inter3 = 0;
            end
            4'b0011: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 4'b1011;
                hex_inter2 = 0;
                hex_inter3 = 0;
            end
            4'b0100: begin
                hex_inter0 = 0;
                hex_inter1 = 0;
                hex_inter2 = 4'b1100;
                hex_inter3 = 0;
            end
            4'b0101: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 0;
                hex_inter2 = 4'b1100;
                hex_inter3 = 0;
            end
            4'b0110: begin
                hex_inter0 = 0;
                hex_inter1 = 4'b1011;
                hex_inter2 = 4'b1100;
                hex_inter3 = 0;
            end
            4'b0111: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 4'b1011;
                hex_inter2 = 4'b1100;
                hex_inter3 = 0;
            end
            4'b1000: begin
                hex_inter0 = 0;
                hex_inter1 = 0;
                hex_inter2 = 0;
                hex_inter3 = 4'b1101;
            end
            4'b1001: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 0;
                hex_inter2 = 0;
                hex_inter3 = 4'b1101;
            end
            4'b1010: begin
                hex_inter0 = 0;
                hex_inter1 = 4'b1011;
                hex_inter2 = 0;
                hex_inter3 = 4'b1101;
            end
            4'b1011: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 4'b1011;
                hex_inter2 = 0;
                hex_inter3 = 4'b1101;
            end
            4'b1100: begin
                hex_inter0 = 0;
                hex_inter1 = 0;
                hex_inter2 = 4'b1100;
                hex_inter3 = 4'b1101;
            end
            4'b1101: begin
                hex_inter0 = 4'b1010;
                hex_inter1 = 0;
                hex_inter2 = 4'b1100;
                hex_inter3 = 4'b1101;
            end
            4'b1110: begin
                hex_inter0 = 0;
                hex_inter1 = 4'b1011;
                hex_inter2 = 4'b1100;
                hex_inter3 = 4'b1101;
            end
            4'b1111: begin
                hex_inter0 = 4'b1010; // hex_inter0 = A
                hex_inter1 = 4'b1011; // hex_inter1 = B
                hex_inter2 = 4'b1100; // hex_inter2 = C
                hex_inter3 = 4'b1101; // hex_inter3 = D
            end
            default: begin
                hex_inter0 = 0;
                hex_inter1 = 0;
                hex_inter2 = 0;
                hex_inter3 = 0;
            end
        endcase
    end
    
    scan_led_hex_disp u1 (.hex0(hex_inter0),
    .hex1(hex_inter1),
    .hex2(hex_inter2),
    .hex3(hex_inter3),
    .clk(clk),
    .reset(0),
    .dp_in(4'b0000),
    .sseg(sseg),
    .an(an)
    );
    
    
endmodule //Display_ABCD
