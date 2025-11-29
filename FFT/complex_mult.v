module complex_mult #(
    parameter WIDTH_A=26
)(
input signed [WIDTH_A-1:0] A_r,A_i, 
input signed [15:0] B_r,B_i,
input clk,
output signed [WIDTH_A:0] I,Q);

wire signed [WIDTH_A:0] z0;
wire signed [16:0] z1,z2;

assign z0 = (A_r >>> 0) - (A_i >>> 0);
assign z1 = (B_r >>> 0) - (B_i >>> 0);
assign z2 = (B_r >>> 0) + (B_i >>> 0);

wire signed [WIDTH_A+16:0] y0,y1,y2;
wire signed [WIDTH_A+17:0] w1,w2;

mult #(16,WIDTH_A+1,WIDTH_A+17) A0(.A(B_i >>> 0) ,.B(z0 >>> 0) ,.clk(clk) ,.C(y0));
mult #(WIDTH_A,17,WIDTH_A+17) A1(.A(A_r >>> 0) ,.B(z1 >>> 0) ,.clk(clk) ,.C(y1));
mult #(WIDTH_A,17,WIDTH_A+17) A2(.A(A_i >>> 0) ,.B(z2 >>> 0) ,.clk(clk) ,.C(y2));
assign w1 = y0 + y1;
assign w2 = y0 + y2;
wire signed [WIDTH_A:0] I_tmp, Q_tmp;
wire signed [WIDTH_A+17:0] I_round = w1 + (1 << 13);
wire signed [WIDTH_A+17:0] Q_round = w2 + (1 << 13);

assign I_tmp = I_round[WIDTH_A+17 : 14];
assign Q_tmp = Q_round[WIDTH_A+17 : 14];

assign I = I_tmp;
assign Q = Q_tmp;

endmodule

module mult #(
    parameter WIDTH_A=26,
    parameter WIDTH_B=16,
    parameter WIDTH_C=26
)(
    input [WIDTH_A-1:0] A,
    input [WIDTH_B-1:0] B,
    input clk,
    output reg [WIDTH_C-1:0] C);

wire signed [WIDTH_A+WIDTH_B-1:0] Y0;
DW02_mult_2_stage #(WIDTH_A,WIDTH_B) U0 (.A(A) ,.B(B) ,.TC(1'b1), .CLK(clk) ,.PRODUCT(Y0));

always@(*)
begin
    C = Y0;
end

endmodule

