`timescale 1ps/1ps
module testbench_scan_led_hex_disp ();

    reg clk, reset;
    reg [3:0] sw;
    wire [6:0] sseg;
    wire [3:0] an;

    Display_ABCD uut(clk, reset, sw, sseg, an);

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        sw = 0;
        
        #10 
        sw = 4'b0000;

        #10 
        sw = 4'b0001;

        #10 
        sw = 4'b0011;

        #10 
        sw = 4'b0100;

        #10 
        sw = 4'b0101;

        #10
        sw = 4'b0110;


        $finish;


    end

endmodule //testbench_scan_led_hex_disp