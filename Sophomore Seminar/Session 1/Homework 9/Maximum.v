module Maximum (
	input [2999:0] image,
    output reg [3:0] max_index_1,
    output reg [3:0] max_index_2,
    output reg [3:0] max_index_3,
    output reg [3:0] max_index_4,
    output reg [3:0] max_index_5,
    output reg [3:0] max_index_6,
    output reg [3:0] max_index_7,
    output reg [3:0] max_index_8,
    output reg [3:0] max_index_9,
    output reg [3:0] max_index_10
);
    reg [29:0] A1 [0:9][0:9];
    reg [29:0] max [0:9]; 
    reg [3:0] max_index_inter [0:9];

    integer i, j;

    always @( *) begin
        {
		    A1[0][0],A1[0][1],A1[0][2],A1[0][3],A1[0][4],A1[0][5],A1[0][6],A1[0][7],A1[0][8],A1[0][9],A1[1][0],A1[1][1],A1[1][2],A1[1][3],A1[1][4],A1[1][5],A1[1][6],A1[1][7],A1[1][8],A1[1][9],A1[2][0],A1[2][1],A1[2][2],A1[2][3],A1[2][4],A1[2][5],A1[2][6],A1[2][7],A1[2][8],A1[2][9],A1[3][0],A1[3][1],A1[3][2],A1[3][3],A1[3][4],A1[3][5],A1[3][6],A1[3][7],A1[3][8],A1[3][9],A1[4][0],A1[4][1],A1[4][2],A1[4][3],A1[4][4],A1[4][5],A1[4][6],A1[4][7],A1[4][8],A1[4][9],A1[5][0],A1[5][1],A1[5][2],A1[5][3],A1[5][4],A1[5][5],A1[5][6],A1[5][7],A1[5][8],A1[5][9],A1[6][0],A1[6][1],A1[6][2],A1[6][3],A1[6][4],A1[6][5],A1[6][6],A1[6][7],A1[6][8],A1[6][9],A1[7][0],A1[7][1],A1[7][2],A1[7][3],A1[7][4],A1[7][5],A1[7][6],A1[7][7],A1[7][8],A1[7][9],A1[8][0],A1[8][1],A1[8][2],A1[8][3],A1[8][4],A1[8][5],A1[8][6],A1[8][7],A1[8][8],A1[8][9],A1[9][0],A1[9][1],A1[9][2],A1[9][3],A1[9][4],A1[9][5],A1[9][6],A1[9][7],A1[9][8],A1[9][9]
        } = image;

        {
            max[0], max[1], max[2], max[3], max[4], max[5], max[6], max[7], max[8], max[9]
        } = 300'd0;

        {
            max_index_inter[0], max_index_inter[1], max_index_inter[2], max_index_inter[3], max_index_inter[4], max_index_inter[5], max_index_inter[6], max_index_inter[7], max_index_inter[8], max_index_inter[9]
        } = 40'd0;

        for (i = 0; i<10; i=i+1) begin
            for (j = 0; j<10 ; j=j+1 ) begin
                if (A1[i][j] > max[i]) begin
                    max[i] = A1[i][j];
                    max_index_inter[i] = j+1; 
                end
            end
        end

        max_index_1 = max_index_inter[0];
        max_index_2 = max_index_inter[1];
        max_index_3 = max_index_inter[2];
        max_index_4 = max_index_inter[3];
        max_index_5 = max_index_inter[4];
        max_index_6 = max_index_inter[5];
        max_index_7 = max_index_inter[6];
        max_index_8 = max_index_inter[7];
        max_index_9 = max_index_inter[8];
        max_index_10 = max_index_inter[9];


    end

endmodule //Maximum