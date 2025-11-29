module radix_4#(
    parameter WIDTH=26
)(
    input clk, start, rst_n,
    input signed [WIDTH-1:0] A_r, A_i, B_r, B_i, C_r, C_i, D_r, D_i,
    input signed [15:0] W0_r, W0_i, W1_r, W1_i, W2_r, W2_i,
    output reg done,
    output reg signed [WIDTH+1:0] Q0_r, Q0_i, Q1_r, Q1_i, Q2_r, Q2_i, Q3_r, Q3_i
);

reg [1:0] valid;
reg signed [WIDTH-1:0] A_r_d0,A_i_d0;
wire signed [WIDTH:0] z0_r, z0_i, z1_r, z1_i, z2_r, z2_i;
reg signed [WIDTH+1:0] pipe0, pipe1, pipe2, pipe3, pipe4, pipe5, pipe6, pipe7;
reg signed [WIDTH+1:0] pipe8, pipe9, pipe10, pipe11, pipe12, pipe13, pipe14, pipe15;

complex_mult #(WIDTH) U0(.clk(clk), .A_r(B_r), .A_i(B_i), .B_r(W0_r), .B_i(W0_i), .I(z0_r), .Q(z0_i));
complex_mult #(WIDTH) U1(.clk(clk), .A_r(C_r), .A_i(C_i), .B_r(W1_r), .B_i(W1_i), .I(z1_r), .Q(z1_i));
complex_mult #(WIDTH) U2(.clk(clk), .A_r(D_r), .A_i(D_i), .B_r(W2_r), .B_i(W2_i), .I(z2_r), .Q(z2_i));

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        done <= 0;
        valid <= 0;
    end
    else begin
        done <= valid[1];
        valid <= {valid[0], start};
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        A_r_d0<=0;
        A_i_d0<=0;
    end
    else begin
        A_r_d0<=A_r;
        A_i_d0<=A_i;
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        pipe0 <= 0; pipe1 <= 0; pipe2 <= 0; pipe3 <= 0;
        pipe4 <= 0; pipe5 <= 0; pipe6 <= 0; pipe7 <= 0;
        pipe8 <= 0; pipe9 <= 0; pipe10 <= 0; pipe11 <= 0;
        pipe12 <= 0; pipe13 <= 0; pipe14 <= 0; pipe15 <= 0;
    end
    else if(valid[0]) begin
        pipe0 <= A_r_d0 + z0_r;
        pipe1 <= z1_r + z2_r;
        pipe2 <= A_r_d0 - z0_r;
        pipe3 <= z2_r - z1_r;
        pipe4 <= A_i_d0  + z0_i ;
        pipe5 <= z1_i  + z2_i;
        pipe6 <= A_i_d0  - z0_i ;
        pipe7 <= z1_i - z2_i ;
        pipe8 <= A_r_d0 + z0_i;
        pipe9 <= z1_r + z2_i ;
        pipe10 <= A_i_d0  - z0_r ;
        pipe11 <= z2_r - z1_i;
        pipe12 <= A_r_d0  - z0_i;
        pipe13 <= z1_r - z2_i;
        pipe14 <= A_i_d0  + z0_r;
        pipe15 <= z2_r + z1_i;
    end
end


always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        Q0_r <= 0; Q1_r <= 0; Q2_r <= 0; Q3_r <= 0;
        Q0_i <= 0; Q1_i <= 0; Q2_i <= 0; Q3_i <= 0;
    end
    else if(valid[1]) begin

        Q0_r <= ((pipe0 + pipe1) + 2) >>> 2;
        Q0_i <= ((pipe4 + pipe5) + 2) >>> 2;
        Q1_r <= ((pipe8 - pipe9) + 2) >>> 2;
        Q1_i <= ((pipe10 + pipe11) + 2) >>> 2;
        Q2_r <= ((pipe2 - pipe3) + 2) >>> 2;
        Q2_i <= ((pipe6 + pipe7) + 2) >>> 2;
        Q3_r <= ((pipe12 - pipe13) + 2) >>> 2;
        Q3_i <= ((pipe14 - pipe15) + 2) >>> 2;
    end
end

endmodule

module radix_2(
input [51:0] A,B,
input [31:0] W3,
input in_valid,clk,rst_n,factor,
output reg [51:0] Q0,Q1,
output reg out_valid);

reg factor_reg;
wire signed [25:0] A_r,A_i,B_r,B_i;
wire signed [15:0] W3_r,W3_i;
assign A_r = A[51:26];
assign B_r = (factor_reg)?B[25:0]:B[51:26];
assign A_i = A[25:0];
assign B_i = (factor_reg)?(~B[51:26]) + 26'b1:B[25:0];
assign W3_r = W3[31:16];
assign W3_i = W3[15:0];

reg signed [25:0] A_r_d,A_i_d;
reg [1:0] valid;
wire signed [26:0] z0_r,z0_i;
reg signed [27:0] pipe0,pipe1,pipe2,pipe3;

complex_mult #(26) U0(.clk(clk), .A_r(B_r), .A_i(B_i), .B_r(W3_r), .B_i(W3_i), .I(z0_r), .Q(z0_i));

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        A_r_d<=0;
        A_i_d<=0;
        factor_reg<=0;
    end
    else begin
        A_r_d<=A_r;
        A_i_d<=A_i;
        factor_reg<=factor;

    end
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        pipe0 <= 0; 
        pipe1 <= 0; 
        pipe2 <= 0;
        pipe3 <= 0;
    end
    else if(valid[0]) begin
        pipe0 <= A_r_d + z0_r;
        pipe1 <= A_i_d + z0_i;
        pipe2 <= A_r_d - z0_r;
        pipe3 <= A_i_d - z0_i;
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        valid<=0;
        out_valid<=0;
    end
    else begin
        out_valid<=valid[1];
        valid[1]<=valid[0];
        valid[0]<=in_valid;
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        Q0<=0;
        Q1<=0;
    end
    else if(valid[1]) begin
        Q0[51:26] <= pipe0;
        Q0[25:0]  <= pipe1;
        Q1[51:26] <= pipe2;
        Q1[25:0]  <= pipe3;
    end
end

endmodule

