module 3RCA (
    input  wire [2:0] a,
    input  wire [2:0] b,
    output wire [2:0] sum,
    output wire cout
);
    wire [2:0] cout_inter;
    HA u1 (.a(a[0]), .b(b[0]), .sum(sum[0]), .cout(cout_inter[0]));
    FA u2 (.a(a[1]), .b(b[1]), .sum(sum[1]), .cin(cout_inter[0]), .cout(cout_inter[1]));
    FA u3 (.a(a[2]), .b(b[2]), .sum(sum[2]), .cin(cout_inter[1]), .cout(cout_inter[2]));

    assign cout = cout_inter[2];

endmodule //3RCA