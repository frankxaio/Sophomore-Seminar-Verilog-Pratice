`timescale 1ns / 1ps

module test_bench;
	
	// INPUT
	reg [14999:0] image;
	reg [29999:0] weight1;
	reg [599:0] Bias1;
	reg [5999:0] weight2;
	reg [299:0] Bias2;	
	
	// OUTPUT
	wire [3:0] ans_1,ans_2,ans_3,ans_4,ans_5,ans_6,ans_7,ans_8,ans_9,ans_10;
	
	Top uut (.image(image),
			 .weight1(weight1), 
			 .Bias1(Bias1), 
			 .weight2(weight2), 
			 .Bias2(Bias2), 
    		 .ans_1(ans_1),
    		 .ans_2(ans_2),
    		 .ans_3(ans_3),
    		 .ans_4(ans_4),
    		 .ans_5(ans_5),
    		 .ans_6(ans_6),
    		 .ans_7(ans_7),
    		 .ans_8(ans_8),
    		 .ans_9(ans_9),
    		 .ans_10(ans_10));
	
	initial begin
		
		// Data  
		image = {-30'd188, 30'd168, 30'd95, -30'd141,
			 30'd50, -30'd182, -30'd216, 30'd26, -30'd185, 30'd64, 30'd85, -30'd8, 30'd201, 30'd192, -30'd3, 30'd247, 30'd129, 30'd244, 30'd67, -30'd45, 30'd23, 30'd70, 30'd32, -30'd61, 30'd214, -30'd207, 30'd133, 30'd249, -30'd67, -30'd144, -30'd7, 30'd87, -30'd79, 30'd67, -30'd197, 30'd69, -30'd177, -30'd55, 30'd166, 30'd146, 30'd72, -30'd137, 30'd252, -30'd168, 30'd185, 30'd148, 30'd160, -30'd57, 30'd170, 30'd195, 30'd182, -30'd193, -30'd32, -30'd45, 30'd189, -30'd153, 30'd210, 30'd176, -30'd5, -30'd113, 30'd245, 30'd77, -30'd163, -30'd69, 30'd76, 30'd187, -30'd126, 30'd234, -30'd127, -30'd208, -30'd114, -30'd244, 30'd101, 30'd53, 30'd91, -30'd247, -30'd59, 30'd220, 30'd218, 30'd231, 30'd185, -30'd26, -30'd63, 30'd110, 30'd221, 30'd93, -30'd215, -30'd29, 30'd153, -30'd151, -30'd45, -30'd158, 30'd9, -30'd238, -30'd40, -30'd69, -30'd42, 30'd63, -30'd31, -30'd187, -30'd26, -30'd88, 30'd159, -30'd9, 30'd33, 30'd248, -30'd45, 30'd233, 30'd137, 30'd15, 30'd41, -30'd46, 30'd249, -30'd203, -30'd119, 30'd231, -30'd185, 30'd84, 30'd42, -30'd193, -30'd10, 30'd145, 30'd173, -30'd66, 30'd141, -30'd135, -30'd9, 30'd62, 30'd240, -30'd137, -30'd98, 30'd95, 30'd137, 30'd172, 30'd91, 30'd134, -30'd197, 30'd101, 30'd84, 30'd248, -30'd245, 30'd170, 30'd74, 30'd114, -30'd152, -30'd37, -30'd10, -30'd46, 30'd156, -30'd79, 30'd226, -30'd125, 30'd193, -30'd253, 30'd52, -30'd224, -30'd206, -30'd50, -30'd140, -30'd65, -30'd229, 30'd252, -30'd62, 30'd104, -30'd170, -30'd206, 30'd244, 30'd251, 30'd194, -30'd103, 30'd116, 30'd217, 30'd69, -30'd252, 30'd231, -30'd109, 30'd204, 30'd41, 30'd228, -30'd80, -30'd204, -30'd160, -30'd18, -30'd20, 30'd72, -30'd140, 30'd210, -30'd124, 30'd196, -30'd200, 30'd214, 30'd178, -30'd221, -30'd237, -30'd31, -30'd157, -30'd152, -30'd114, -30'd244, -30'd217, -30'd172 ,30'd53 ,-30'd173 ,30'd203 ,-30'd129 ,30'd120 ,30'd194 ,-30'd229 ,30'd65 ,30'd32 ,-30'd16 ,-30'd242 ,30'd93 ,-30'd146 ,30'd132 ,-30'd61 ,30'd228 ,-30'd75 ,-30'd34 ,-30'd82 ,-30'd150 ,-30'd21 ,-30'd208 ,30'd252 ,30'd224 ,-30'd87 ,30'd43 ,30'd221 ,-30'd170 ,30'd40 ,-30'd39 ,-30'd67 ,30'd185 ,30'd116 ,-30'd121 ,-30'd91 ,30'd178 ,-30'd87 ,30'd33 ,-30'd25 ,30'd191 ,-30'd88 ,30'd122 ,30'd189 ,30'd88 ,-30'd141 ,30'd151 ,-30'd102 ,30'd34 ,-30'd74,-30'd234 ,-30'd106 ,-30'd9 ,30'd93 ,30'd213 ,30'd197 ,30'd204 ,-30'd168 ,30'd130 ,30'd17 ,30'd186 ,30'd116 ,30'd128 ,-30'd36 ,-30'd40 ,-30'd243 ,30'd242 ,-30'd136 ,-30'd49 ,-30'd195 ,30'd71 ,30'd106 ,30'd251 ,30'd200 ,30'd215 ,-30'd129 ,-30'd57 ,30'd60 ,-30'd179 ,30'd6 ,30'd81 ,30'd229 ,30'd89 ,-30'd90 ,-30'd32 ,30'd193 ,30'd195 ,30'd153 ,30'd85 ,30'd22 ,30'd203 ,-30'd89 ,-30'd45 ,-30'd168 ,30'd252 ,-30'd116 ,30'd10 ,-30'd230 ,-30'd62 ,-30'd55,30'd230 ,30'd229 ,-30'd90 ,-30'd104 ,30'd216 ,30'd184 ,30'd56 ,-30'd73 ,30'd206 ,-30'd86 ,-30'd205 ,-30'd187 ,-30'd233 ,30'd24 ,30'd236 ,-30'd14 ,30'd181 ,30'd146 ,-30'd85 ,30'd238 ,-30'd147 ,30'd199 ,-30'd166 ,30'd58 ,-30'd220 ,30'd173 ,-30'd203 ,30'd107 ,-30'd34 ,30'd61 ,30'd168 ,-30'd195 ,30'd84 ,30'd216 ,30'd88 ,-30'd75 ,-30'd243 ,30'd166 ,-30'd48 ,30'd86 ,-30'd192 ,-30'd37 ,30'd5 ,-30'd50 ,30'd184 ,-30'd162 ,-30'd39 ,-30'd203 ,30'd92 ,-30'd192,-30'd144 ,-30'd251 ,30'd228 ,-30'd126 ,-30'd12 ,30'd199 ,-30'd249 ,-30'd124 ,30'd102 ,30'd243 ,30'd28 ,30'd59 ,30'd229 ,30'd2 ,30'd213 ,-30'd47 ,-30'd123 ,-30'd137 ,30'd195 ,30'd6 ,30'd72 ,-30'd114 ,-30'd230 ,-30'd164 ,-30'd169 ,-30'd89 ,-30'd34 ,30'd6 ,-30'd251 ,-30'd82 ,30'd232 ,-30'd64 ,30'd221 ,-30'd227 ,30'd95 ,30'd75 ,30'd30 ,30'd138 ,-30'd14 ,-30'd66 ,-30'd12 ,-30'd64 ,-30'd122 ,30'd87 ,-30'd98 ,30'd229 ,30'd120 ,30'd106 ,30'd103 ,-30'd232,-30'd101 ,-30'd148 ,-30'd98 ,30'd27 ,30'd70 ,-30'd213 ,30'd78 ,30'd247 ,30'd7 ,30'd165 ,-30'd217 ,30'd64 ,-30'd254 ,-30'd123 ,30'd92 ,30'd223 ,30'd49 ,-30'd7 ,-30'd136 ,-30'd227 ,-30'd105 ,30'd41 ,-30'd143 ,30'd131 ,30'd43 ,30'd84 ,30'd173 ,-30'd125 ,-30'd65 ,-30'd81 ,30'd112 ,30'd199 ,-30'd148 ,30'd173 ,30'd82 ,30'd63 ,30'd6 ,-30'd239 ,-30'd83 ,-30'd157 ,30'd39 ,-30'd56 ,-30'd189 ,-30'd106 ,30'd6 ,30'd228 ,-30'd69 ,30'd202 ,30'd68 ,30'd226,30'd116 ,30'd60 ,30'd55 ,30'd183 ,-30'd248 ,30'd201 ,-30'd208 ,-30'd55 ,-30'd159 ,-30'd225 ,30'd139 ,-30'd161 ,-30'd59 ,30'd46 ,30'd228 ,30'd148 ,-30'd3 ,30'd6 ,-30'd29 ,30'd106 ,-30'd11 ,30'd35 ,30'd222 ,-30'd75 ,-30'd113 ,-30'd70 ,-30'd240 ,-30'd251 ,30'd125 ,30'd15 ,30'd9 ,30'd99 ,-30'd49 ,30'd96 ,30'd249 ,30'd202 ,30'd162 ,30'd234 ,30'd192 ,30'd152 ,-30'd200 ,-30'd242 ,30'd211 ,30'd7 ,30'd148 ,30'd147 ,30'd48 ,-30'd136 ,30'd153 ,30'd200
		};
		weight1 = {-30'd43,30'd36,30'd26,-30'd9,
			30'd33,30'd19,-30'd2,-30'd33,-30'd7,30'd43,30'd0,30'd30,30'd49,-30'd47,30'd11,-30'd28,	30'd44,30'd32,-30'd13,30'd8,30'd17,30'd39,-30'd37,-30'd11,30'd45,30'd3,30'd39,30'd1,30'd12,-30'd22,-30'd5,-30'd26,30'd0,30'd17,30'd8,30'd21,30'd9,-30'd8,30'd38,30'd12,-30'd4,30'd42,-30'd24,-30'd11,-30'd38,30'd41,-30'd5,30'd47,-30'd50,30'd49,-30'd12,30'd7,-30'd7,-30'd20,-30'd23,30'd9,-30'd39,30'd15,-30'd36,-30'd9,-30'd47,30'd30,-30'd45,-30'd5,30'd2,30'd24,30'd21,30'd36,-30'd24,30'd26,30'd23,-30'd43,30'd36,-30'd15,30'd4,-30'd27,-30'd40,30'd15,-30'd23,30'd13,-30'd40,-30'd7,-30'd45,-30'd14,30'd3,-30'd42,-30'd17,30'd20,-30'd1,-30'd42,30'd23,30'd45,30'd42,-30'd39,30'd5,-30'd37,-30'd17,-30'd19,30'd14,-30'd33,30'd31,30'd49,30'd36,30'd1,30'd49,30'd3,-30'd11,-30'd5,-30'd40,30'd25,30'd1,30'd23,30'd28,-30'd12,-30'd8,30'd10,30'd39,-30'd4,30'd49,-30'd39,-30'd6,30'd21,-30'd8,30'd8,-30'd37,-30'd33,30'd22,-30'd29,-30'd31,-30'd4,30'd26,-30'd23,30'd11,-30'd15,-30'd45,-30'd33,30'd16,30'd28,30'd42,-30'd17,-30'd31,-30'd49,30'd40,30'd23,30'd21,30'd33,-30'd21,30'd25,-30'd34,-30'd25,-30'd35,-30'd34,30'd30,30'd29,-30'd21,30'd49,30'd36,-30'd32,30'd26,30'd10,-30'd10,-30'd15,-30'd46,-30'd36,-30'd29,30'd43,-30'd27,30'd27,-30'd28,-30'd16,-30'd19,-30'd13,-30'd5,-30'd41,30'd15,30'd23,-30'd28,-30'd20,30'd36,30'd37,-30'd13,30'd18,-30'd37,-30'd9,-30'd4,-30'd14,-30'd7,-30'd36,-30'd8,-30'd45,30'd8,30'd40,-30'd25,-30'd43,30'd46,-30'd34,30'd44,30'd2,-30'd33,30'd29,30'd32,-30'd3,30'd21,30'd32,30'd31,30'd44,-30'd38,-30'd10,-30'd42,-30'd23,30'd1,30'd8,-30'd12,-30'd34,30'd3,30'd0,-30'd14,30'd36,30'd26,30'd0,-30'd27,30'd14,30'd0,-30'd19,-30'd15,30'd15,30'd27,30'd19,30'd33,-30'd43,30'd29,30'd27,-30'd5,-30'd19,-30'd11,-30'd11,30'd1,30'd1,30'd10,30'd26,30'd18,30'd25,30'd18,30'd45,-30'd26,30'd30,-30'd44,-30'd38,-30'd1,30'd43,-30'd9,-30'd34,-30'd47,-30'd20,-30'd17,30'd7,30'd22,-30'd41,-30'd32,-30'd6,-30'd3,-30'd26,30'd1,30'd37,-30'd48,30'd49,30'd15,-30'd6,30'd0,-30'd18,30'd36,30'd16,-30'd34,30'd36,30'd0,30'd19,-30'd50,-30'd9,-30'd30,-30'd13,30'd9,30'd32,-30'd33,30'd31,30'd9,-30'd44,-30'd29,-30'd42,30'd37,30'd21,-30'd20,-30'd33,-30'd9,30'd12,-30'd49,30'd7,30'd50,30'd48,-30'd12,-30'd20,-30'd38,-30'd22,-30'd37,-30'd38,-30'd31,-30'd36,-30'd9,-30'd18,30'd11,-30'd48,30'd40,-30'd50,30'd16,30'd38,30'd28,-30'd18,30'd30,30'd24,-30'd2,30'd46,-30'd1,30'd2,30'd36,-30'd29,30'd21,30'd42,30'd24,-30'd24,30'd37,-30'd19,-30'd12,30'd49,-30'd28,30'd33,-30'd36,30'd22,30'd17,30'd32,-30'd21,-30'd44,30'd7,-30'd36,30'd41,30'd45,-30'd31,30'd46,30'd13,-30'd2,30'd4,-30'd44,30'd28,-30'd4,-30'd18,-30'd5,-30'd13,-30'd47,-30'd25,30'd46,30'd7,30'd1,-30'd44,-30'd12,30'd42,-30'd39,-30'd9,-30'd4,30'd15,30'd19,30'd8,30'd9,-30'd28,-30'd18,-30'd19,30'd49,-30'd25,30'd5,-30'd18,30'd3,30'd14,30'd3,30'd28,-30'd17,30'd14,-30'd40,30'd37,-30'd1,30'd1,30'd49,30'd39,30'd14,-30'd35,-30'd21,-30'd27,30'd37,30'd35,30'd33,-30'd25,-30'd48,-30'd10,-30'd40,30'd25,30'd18,30'd43,30'd48,30'd0,-30'd44,-30'd22,30'd47,30'd47,30'd1,30'd14,30'd43,30'd23,-30'd17,-30'd3,30'd29,30'd39,30'd21,-30'd38,-30'd28,30'd13,-30'd16,-30'd37,-30'd22,30'd36,-30'd6,-30'd15,-30'd10,30'd0,-30'd40,-30'd13,-30'd36,-30'd29,30'd47,30'd44,-30'd47,-30'd6,30'd19,30'd46,-30'd41,30'd20,-30'd27,30'd14,30'd9,30'd36,30'd25,-30'd42,30'd47,30'd15,30'd47,-30'd28,30'd49,30'd46,30'd15,30'd14,30'd15,30'd37,-30'd20,-30'd1,30'd47,-30'd32,-30'd11,-30'd8,-30'd7,-30'd13,30'd37,30'd11,-30'd22,-30'd10,-30'd46,-30'd40,30'd11,30'd25,30'd9,-30'd19,-30'd18,-30'd41,-30'd42,30'd21,-30'd22,-30'd33,-30'd30,30'd27,-30'd28,30'd23,30'd44,30'd49,30'd1,30'd23,30'd4,30'd36,30'd37,-30'd31,-30'd19,-30'd34,30'd28,30'd21,30'd28,30'd16,-30'd11,-30'd4,30'd40,30'd10,-30'd1,30'd9,-30'd27,30'd44,-30'd24,-30'd31,30'd35,30'd8,30'd32,-30'd49,-30'd13,-30'd6,-30'd39,30'd37,30'd42,30'd19,30'd30,-30'd37,-30'd6,30'd41,-30'd17,30'd1,30'd47,-30'd48,30'd28,30'd49,30'd1,-30'd36,30'd2,-30'd2,-30'd11,-30'd33,-30'd43,30'd32,30'd29,-30'd9,30'd7,30'd37,-30'd8,30'd31,30'd15,30'd19,30'd10,-30'd42,30'd34,30'd12,30'd46,30'd44,30'd0,30'd5,30'd28,-30'd11,30'd6,30'd1,-30'd50,30'd45,-30'd42,-30'd3,30'd16,30'd45,-30'd12,-30'd27,-30'd38,-30'd13,-30'd47,-30'd24,-30'd27,30'd15,-30'd25,30'd46,30'd45,-30'd22,-30'd3,-30'd22,30'd49,30'd30,-30'd6,-30'd47,-30'd9,-30'd31,-30'd21,30'd45,-30'd5,30'd1,-30'd18,-30'd29,30'd1,-30'd23,30'd10,30'd37,-30'd26,30'd28,30'd15,-30'd4,30'd20,30'd21,-30'd20,-30'd44,30'd21,-30'd12,30'd10,30'd42,30'd32,30'd49,-30'd39,-30'd39,-30'd18,30'd6,-30'd21,-30'd39,30'd29,-30'd2,30'd48,30'd47,30'd38,-30'd41,-30'd37,-30'd2,-30'd24,-30'd43,-30'd7,-30'd3,-30'd23,-30'd18,30'd16,30'd50,30'd18,-30'd19,30'd21,30'd18,-30'd43,30'd9,-30'd49,30'd14,-30'd40,-30'd18,30'd13,30'd2,-30'd25,30'd23,30'd48,30'd47,-30'd23,30'd5,30'd21,-30'd28,-30'd13,30'd4,30'd17,30'd5,-30'd6,30'd21,30'd43,-30'd12,-30'd48,30'd8,-30'd14,30'd0,-30'd22,30'd35,-30'd13,30'd12,30'd3,30'd2,-30'd17,30'd30,30'd39,30'd40,30'd46,30'd37,30'd34,-30'd48,30'd5,-30'd34,30'd24,30'd7,30'd10,-30'd31,-30'd33,30'd43,30'd21,30'd32,30'd50,-30'd25,30'd5,30'd46,30'd23,-30'd4,30'd1,-30'd28,-30'd29,30'd1,30'd7,30'd43,-30'd2,30'd22,-30'd50,-30'd44,30'd17,30'd25,-30'd11,30'd24,-30'd32,-30'd7,30'd49,30'd21,30'd28,-30'd49,-30'd18,-30'd9,-30'd44,-30'd5,-30'd31,-30'd37,-30'd38,-30'd34,-30'd47,-30'd18,-30'd25,30'd3,30'd45,30'd24,30'd44,-30'd4,30'd21,-30'd29,-30'd2,30'd47,-30'd25,-30'd48,30'd23,-30'd40,30'd31,-30'd33,30'd36,-30'd49,-30'd25,-30'd4,30'd4,30'd30,30'd43,-30'd47,30'd7,-30'd44,30'd11,-30'd1,-30'd47,-30'd39,30'd30,30'd31,-30'd50,30'd1,-30'd7,-30'd36,-30'd8,30'd47,-30'd34,30'd15,30'd43,-30'd29,30'd9,30'd47,30'd27,30'd12,30'd39,30'd22,30'd18,30'd18,30'd1,30'd22,30'd16,-30'd11,-30'd15,30'd30,-30'd29,-30'd7,30'd49,-30'd4,-30'd10,30'd45,-30'd8,30'd3,30'd49,30'd20,-30'd24,-30'd8,-30'd32,-30'd23,30'd0,-30'd18,-30'd36,-30'd34,-30'd13,30'd17,30'd44,-30'd12,30'd47,30'd13,-30'd35,-30'd10,30'd35,-30'd12,-30'd27,30'd26,-30'd31,-30'd43,30'd13,30'd11,-30'd16,30'd38,-30'd32,-30'd37,-30'd15,30'd1,-30'd46,30'd35,-30'd6,30'd45,-30'd19,30'd30,30'd1,30'd26,30'd6,-30'd46,-30'd21,30'd42,30'd36,-30'd32,-30'd37,-30'd38,30'd48,-30'd45,-30'd49,-30'd11,30'd39,-30'd20,-30'd39,30'd43,-30'd49,-30'd11,-30'd38,-30'd30,-30'd28,-30'd33,-30'd41,30'd36,30'd25,30'd21,30'd33,30'd18,-30'd5,30'd43,-30'd31,-30'd25,30'd5,30'd7,30'd0,30'd11,30'd25,-30'd10,30'd1,30'd35,-30'd15,30'd43,30'd1,30'd0,30'd39,30'd15,30'd21,30'd10,-30'd11,30'd45,-30'd44,-30'd35,30'd42,30'd39,30'd3,30'd45,-30'd25,30'd49,-30'd48,30'd9,-30'd32,-30'd32,30'd43,-30'd34,-30'd6,30'd44,-30'd40,-30'd4,-30'd12,-30'd43,30'd31,30'd10,-30'd31,30'd23,30'd14,30'd47,30'd35,30'd45,-30'd49,30'd25,-30'd40,30'd3,-30'd7,-30'd35,-30'd39,30'd41,30'd10,-30'd50,-30'd7,30'd29,30'd36,-30'd32,30'd10,30'd15,-30'd43,30'd30,-30'd28,30'd46,30'd26,-30'd40,30'd5,-30'd1,30'd6,-30'd19,-30'd18,-30'd39,30'd16,30'd29,-30'd18,-30'd29,-30'd21,-30'd49,-30'd28,-30'd16,30'd33,30'd21,-30'd47,-30'd10,30'd15,30'd26,30'd5,-30'd28,30'd0,30'd41,-30'd50,-30'd37,30'd32,30'd41,30'd13,-30'd8,30'd0,30'd1,30'd10,-30'd3,30'd2,30'd35,30'd45,30'd50,-30'd16,-30'd37,30'd20,-30'd3,-30'd7,30'd35,-30'd19,30'd45,30'd45,30'd47,30'd20,30'd41,-30'd35,30'd25,30'd2,30'd37,-30'd38,30'd10,30'd46,-30'd18,30'd37,30'd43,30'd13,-30'd31,-30'd9,-30'd16,30'd4,-30'd33,30'd16,-30'd44,-30'd43,-30'd22,30'd11,-30'd4,-30'd30,30'd35,-30'd23
		};
		Bias1 = {
			30'd3,30'd2,-30'd11,30'd6,-30'd14,30'd12,30'd3,30'd5,-30'd4,30'd12,30'd4,-30'd5,30'd10,-30'd13,30'd11,-30'd8,30'd6,-30'd4,30'd9,30'd7
		};
		weight2 = {
				30'd21,30'd2,-30'd4,30'd49,30'd3,-30'd6,-30'd43,30'd41,30'd10,30'd34,-30'd36,-30'd42,-30'd1,-30'd24,30'd28,30'd42,-30'd22,-30'd22,30'd22,-30'd23,-30'd1,-30'd45,-30'd5,-30'd9,30'd32,-30'd46,-30'd45,-30'd50,30'd11,30'd41,30'd36,-30'd43,30'd7,-30'd34,30'd47,-30'd2,30'd3,30'd20,30'd17,30'd30,-30'd43,30'd4,30'd35,30'd34,30'd45,30'd16,-30'd10,30'd42,30'd10,30'd31,-30'd25,30'd29,-30'd17,30'd29,-30'd4,-30'd4,-30'd23,-30'd3,-30'd14,-30'd25,-30'd42,30'd21,-30'd26,30'd38,-30'd6,-30'd21,-30'd6,-30'd12,-30'd30,30'd36,-30'd38,-30'd43,30'd40,30'd17,30'd41,30'd15,-30'd49,-30'd12,30'd45,30'd39,-30'd31,30'd42,30'd33,30'd44,-30'd36,30'd50,-30'd18,-30'd16,30'd47,30'd49,-30'd44,30'd7,-30'd40,-30'd12,-30'd12,-30'd46,30'd2,-30'd41,-30'd1,-30'd21,-30'd23,30'd27,30'd25,30'd14,-30'd29,-30'd28,-30'd27,-30'd43,-30'd12,30'd14,-30'd16,-30'd40,-30'd25,-30'd31,-30'd15,-30'd47,30'd0,-30'd20,-30'd32,30'd30,-30'd23,30'd36,-30'd20,30'd47,-30'd41,30'd44,30'd32,-30'd4,30'd12,30'd32,30'd8,30'd20,30'd40,30'd0,-30'd49,-30'd2,-30'd30,-30'd21,-30'd35,30'd16,-30'd29,-30'd19,30'd13,30'd21,30'd27,-30'd17,30'd37,30'd1,30'd40,30'd22,30'd17,-30'd5,30'd38,30'd0,-30'd23,-30'd19,-30'd3,-30'd19,-30'd46,-30'd9,30'd41,30'd33,30'd13,30'd0,30'd30,-30'd23,30'd33,-30'd19,30'd32,30'd32,-30'd2,-30'd2,30'd42,30'd9,30'd27,-30'd16,30'd35,-30'd14,30'd8,-30'd26,30'd5,30'd6,-30'd9,-30'd17,-30'd5,30'd44,30'd0,30'd12,-30'd42,-30'd16,-30'd19,-30'd41,-30'd43,-30'd18,-30'd29,-30'd2,-30'd27,30'd11,30'd32,-30'd1
		};
		Bias2 = {
			-30'd13, -30'd12, -30'd5, -30'd1, -30'd8, 30'd7, 30'd10, 30'd5, 30'd11, 30'd14
		};

	end
	



endmodule