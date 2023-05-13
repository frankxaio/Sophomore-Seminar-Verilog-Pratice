`timescale 1ns / 1ps
module scan_led_hex_disp(
    input clk,
    input reset,
    input [3:0] hex0, //第一个数码管显示的数字
    input [3:0] hex1,
    input [3:0] hex2,
    input [3:0] hex3,
    input [3:0] dp_in, //小数点控制
    output reg [3:0] an,   //片选
    output reg [6:0] sseg  //段选
    );
	
	localparam N = 18; //使用低16位对50Mhz的时钟进行分频(50MHZ/2^16)
	reg [N-1:0] regN; //高两位作为控制信号，低16位为计数器，对时钟进行分频
	reg [3:0] hex_in; //段选控制信号
	reg dp; 
	
	always@(posedge clk, posedge reset)
	begin
		if(reset)
			regN <= 0;
		else
			regN <= regN + 1;
	end
	
	always@ (*)
	begin
		case(regN[N-1:N-2])
		2'b00:begin
			an = 4'b1110; //选中第1个数码管
			hex_in = hex0; //数码管显示的数字由hex_in控制，显示hex0输入的数字；
			dp = dp_in[0]; //控制该数码管的小数点的亮灭
		end
		2'b01:begin
			an = 4'b1101; //选中第二个数码管
			hex_in = hex1;
			dp = dp_in[1];
		end
		2'b10:begin
			an = 4'b1011;
			hex_in = hex2;
			dp = dp_in[2];
		end
		default:begin
			an = 4'b0111;
			hex_in = hex3;
			dp = dp_in[3];
		end
		
		endcase
	
	end
	always@ (*)
	begin
		case(hex_in)
			4'h0: sseg[6:0] = 7'b100_0000; //共陰極
			4'h1: sseg[6:0] = 7'b111_1001;
			4'h2: sseg[6:0] = 7'b010_0100;
			4'h3: sseg[6:0] = 7'b011_0000;
			4'h4: sseg[6:0] = 7'b001_1001;
			4'h5: sseg[6:0] = 7'b001_0010;
			4'h6: sseg[6:0] = 7'b000_0010;
			4'h7: sseg[6:0] = 7'b111_1000;
			4'h8: sseg[6:0] = 7'b000_0000;
			4'h9: sseg[6:0] = 7'b001_0000;
			4'ha: sseg[6:0] = 7'b000_1000;
			4'hb: sseg[6:0] = 7'b000_0011;
			4'hc: sseg[6:0] = 7'b100_0110;	
			4'hd: sseg[6:0] = 7'b010_0001;
			4'he: sseg[6:0] = 7'b000_0110;
			4'hf: sseg[6:0] = 7'b000_1110;
			default: sseg[6:0] = 7'b100_0111;
		endcase
	end
endmodule
