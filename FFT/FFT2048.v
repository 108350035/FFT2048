//synopsys translate_off
`include "ROM_Wp.v"
`include "ROM_W2p.v"
`include "ROM_W3p.v"
`include "R2_Wp.v"
`include "DRAM_256_52.v"
`include "/home/synopsys/syn/O-2018.06-SP1/dw/sim_ver/DW02_mult_2_stage.v"
//synopsys translate_on
`include "complex_mult.v"
`include "twiddle.v"
`include "RAM_ctr.v"
`include "gen_addr.v"
`include "radix.v"
module FFT2048(
input [15:0] D_re,D_im,
input clk,rst_n,in_valid,
output reg signed [25:0] O_re,O_im,
output reg out_valid);

parameter [2:0] IDLE=3'b0,INPUT=3'd1,R4=3'd2,R2=3'd3,OUTPUT=3'd4;
reg [2:0] cs,ns;
wire AR_EN,BR_EN;
//0 write 1 read
wire A0_CEN,A1_CEN,A2_CEN,A3_CEN;
wire A0_WEN,A1_WEN,A2_WEN,A3_WEN;
wire OP_valid0,OP_valid1,OP_done0,OP2_done0,OP_done1;
wire [1:0] ram_sel,A_sel,B_sel,C_sel,D_sel;
reg [1:0] A_sel_reg [4:0],B_sel_reg[4:0],C_sel_reg[4:0],D_sel_reg[4:0],ram_sel_reg[4:0];
reg B_CEN;
wire [7:0] A0_addr,A1_addr,A2_addr,A3_addr;
wire [51:0] A0_d,A1_d,A2_d,A3_d;
wire [51:0] A0_q,A1_q,A2_q,A3_q;
reg [7:0] B0_addr,B1_addr,B2_addr,B3_addr;
wire [51:0] B0_q,B1_q,B2_q,B3_q;

wire A4_CEN,A5_CEN,A6_CEN,A7_CEN;
wire A4_WEN,A5_WEN,A6_WEN,A7_WEN;
wire [51:0] A4_d,A5_d,A6_d,A7_d;
wire [51:0] A4_q,A5_q,A6_q,A7_q;
wire [51:0] B4_q,B5_q,B6_q,B7_q;

RAM_ctr R00(.ctrl(AR_EN) ,.op_wr(OP_done0 | OP_done1) ,.sel(ram_sel) ,.R2_sel(ram_sel_reg[0]) ,.mode(cs[1:0])
            ,.CEN({A3_CEN,A2_CEN,A1_CEN,A0_CEN}) ,.WEN({A3_WEN,A2_WEN,A1_WEN,A0_WEN}));
RAM_ctr R01(.ctrl(BR_EN) ,.op_wr(OP2_done0 | OP_done1) ,.sel(ram_sel) ,.R2_sel(ram_sel_reg[0]) ,.mode(cs[1:0])
            ,.CEN({A7_CEN,A6_CEN,A5_CEN,A4_CEN}) ,.WEN({A7_WEN,A6_WEN,A5_WEN,A4_WEN}));

integer i;
wire [7:0] OP_A_addr,OP_B_addr,OP_C_addr,OP_D_addr;
wire [55:0] Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
wire [51:0] CQ0,CQ1;
wire [51:0] AOPA,AOPB,AOPC,AOPD,BOPA,BOPB,BOPC,BOPD,OUT_DATA;
reg [51:0] AQ0,AQ1,AQ2,AQ3,BQ0,BQ1,BQ2,BQ3;
reg [31:0] buffer;
reg [11:0] cnt;
reg R_EN,valid[2:0],valid1[2:0],out_start,out_start0,out_start1;
reg S_EN;
wire R4_START,R2_START;
reg [7:0] Q0_addr [4:0],Q1_addr [4:0],Q2_addr [4:0],Q3_addr [4:0];
assign ram_sel[0] = cnt[8] ^ cnt[6] ^ cnt[4] ^ cnt[2] ^ cnt[0];
assign ram_sel[1] = cnt[9] ^ cnt[7] ^ cnt[5] ^ cnt[3] ^ cnt[1];
assign A_sel[0] = cnt[6] ^ cnt[4] ^ cnt[2] ^ cnt[0];
assign A_sel[1] = cnt[7] ^ cnt[5] ^ cnt[3] ^ cnt[1];
assign D_sel[0] = 1 ^ cnt[6] ^ cnt[4] ^ cnt[2] ^ cnt[0];
assign D_sel[1] = 1 ^ cnt[7] ^ cnt[5] ^ cnt[3] ^ cnt[1];
assign B_sel = {A_sel[1],D_sel[0]};
assign C_sel = {D_sel[1],A_sel[0]};
assign AR_EN = R_EN & ~S_EN;
assign BR_EN = R_EN & S_EN;
assign R4_START = (cs == R4)?((cnt[10:8] == 3'b001)?0:1):0;
assign R2_START = (cs == R2)?((cnt[10:8] == 3'b100)?0:1):0;

RAM_IN_ctr R10(.cs(cs) ,.AQ0(AQ0) ,.AQ1(AQ1) ,.AQ2(AQ2) ,.AQ3(AQ3) ,.buffer(buffer)
            ,.A_sel(A_sel_reg[0]) ,.B_sel(B_sel_reg[0])
            ,.C_sel(C_sel_reg[0]) ,.RAM_0d(A0_d) ,.RAM_1d(A1_d) ,.RAM_2d(A2_d)
            ,.RAM_3d(A3_d));
RAM_IN_ctr R11(.cs(cs) ,.AQ0(BQ0) ,.AQ1(BQ1) ,.AQ2(BQ2) ,.AQ3(BQ3) ,.buffer(buffer)
            ,.A_sel(A_sel_reg[0]) ,.B_sel(B_sel_reg[0])
            ,.C_sel(C_sel_reg[0]) ,.RAM_0d(A4_d) ,.RAM_1d(A5_d) ,.RAM_2d(A6_d)
            ,.RAM_3d(A7_d));

RAM_ADDR_ctr R20(.cnt(cnt[9:2]) ,.cs(cs) ,.A_sel(A_sel_reg[0]) ,.A0_addr(A0_addr)
                ,.B_sel(B_sel_reg[0]) ,.C_sel(C_sel_reg[0]) ,.A1_addr(A1_addr)
                ,.Q0_addr(Q0_addr[0]) ,.Q1_addr(Q1_addr[0]) ,.A2_addr(A2_addr)
                ,.Q2_addr(Q2_addr[0]) ,.Q3_addr(Q3_addr[0]) ,.A3_addr(A3_addr));

RAM_OUT_ctr R7(.clk(clk) ,.rst_n(rst_n) ,.ready(R4_START | R2_START) ,.A_sel(A_sel_reg[4])
            ,.B_sel(B_sel_reg[4]) ,.C_sel(C_sel_reg[4]) ,.D_sel(D_sel_reg[4]) ,.ram_sel(ram_sel_reg[4])
            ,.out_valid(OP_valid0) ,.A(AOPA) ,.B(AOPB) ,.C(AOPC) ,.D(AOPD) ,.mode(cs[1:0])
            ,.D0(B0_q) ,.D1(B1_q) ,.D2(B2_q) ,.D3(B3_q));
RAM_OUT_ctr R9(.clk(clk) ,.rst_n(rst_n) ,.ready(R4_START | R2_START) ,.A_sel(A_sel_reg[4])
            ,.B_sel(B_sel_reg[4]) ,.C_sel(C_sel_reg[4]) ,.D_sel(D_sel_reg[4]) ,.ram_sel(ram_sel_reg[4])
            ,.out_valid(OP_valid1) ,.A(BOPA) ,.B(BOPB) ,.C(BOPC) ,.D(BOPD) ,.mode(cs[1:0])
            ,.D0(B4_q) ,.D1(B5_q) ,.D2(B6_q) ,.D3(B7_q));

gen_addr G0(.mode(cs[1:0]) ,.cnt(cnt[10:0]) ,.A_addr(OP_A_addr) ,.B_addr(OP_B_addr) ,.C_addr(OP_C_addr) ,.D_addr(OP_D_addr));
wire [31:0] W0,W1,W2,W3;
wire TF_valid,TF_valid2,factor;
twiddle T1(.clk(clk) ,.rst_n(rst_n) ,.ready(R4_START | R2_START) ,.cnt(cnt),.R4_valid(TF_valid) ,.R2_valid(TF_valid2)
            ,.mode(cs[1:0]) ,.factor(factor) ,.W0(W0) ,.W1(W1) ,.W2(W2) ,.W3(W3));

radix_4 #(26) U0(.clk(clk) ,.rst_n(rst_n) ,.start(valid[1]) ,.A_r(AOPA[51:26]) ,.A_i(AOPA[25:0]) ,.B_r(AOPB[51:26]) ,.B_i(AOPB[25:0])
            ,.C_r(AOPC[51:26]) ,.C_i(AOPC[25:0]) ,.D_r(AOPD[51:26]) ,.D_i(AOPD[25:0]) ,.W0_r(W0[31:16]) ,.W0_i(W0[15:0]) ,.W1_r(W1[31:16]) 
            ,.W1_i(W1[15:0]) ,.W2_r(W2[31:16]) ,.W2_i(W2[15:0]) ,.done(OP_done0) ,.Q0_r(Q0[55:28]) ,.Q0_i(Q0[27:0]) 
            ,.Q1_r(Q1[55:28]) ,.Q1_i(Q1[27:0]) ,.Q2_r(Q2[55:28]) ,.Q2_i(Q2[27:0]) ,.Q3_r(Q3[55:28]) ,.Q3_i(Q3[27:0]) );
radix_4 #(26) U1(.clk(clk) ,.rst_n(rst_n) ,.start(valid[1]) ,.A_r(BOPA[51:26]) ,.A_i(BOPA[25:0]) ,.B_r(BOPB[51:26]) ,.B_i(BOPB[25:0])
            ,.C_r(BOPC[51:26]) ,.C_i(BOPC[25:0]) ,.D_r(BOPD[51:26]) ,.D_i(BOPD[25:0]) ,.W0_r(W0[31:16]) ,.W0_i(W0[15:0]) ,.W1_r(W1[31:16]) 
            ,.W1_i(W1[15:0]) ,.W2_r(W2[31:16]) ,.W2_i(W2[15:0]) ,.done(OP2_done0) ,.Q0_r(Q4[55:28]) ,.Q0_i(Q4[27:0]) 
            ,.Q1_r(Q5[55:28]) ,.Q1_i(Q5[27:0]) ,.Q2_r(Q6[55:28]) ,.Q2_i(Q6[27:0]) ,.Q3_r(Q7[55:28]) ,.Q3_i(Q7[27:0]) );

radix_2 U2(.clk(clk) ,.rst_n(rst_n) ,.in_valid(valid1[1]) ,.factor(factor) ,.A(AOPA) ,.B(BOPA) 
            ,.W3(W3) ,.Q0(CQ0) ,.Q1(CQ1) ,.out_valid(OP_done1));
reg [7:0] S0_addr,S1_addr,S2_addr,S3_addr;
reg out_sel;

DRAM_256_52 DS0 (.QA(A0_q) ,.CLKA(clk) ,.CENA(A0_CEN) ,.WENA(A0_WEN) ,.AA(A0_addr),.DA(A0_d),.OENA(1'b0)
               ,.QB(B0_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B0_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS1 (.QA(A1_q) ,.CLKA(clk) ,.CENA(A1_CEN) ,.WENA(A1_WEN) ,.AA(A1_addr),.DA(A1_d),.OENA(1'b0)
                ,.QB(B1_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B1_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS2 (.QA(A2_q) ,.CLKA(clk) ,.CENA(A2_CEN) ,.WENA(A2_WEN) ,.AA(A2_addr),.DA(A2_d),.OENA(1'b0)
                ,.QB(B2_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B2_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS3 (.QA(A3_q) ,.CLKA(clk) ,.CENA(A3_CEN) ,.WENA(A3_WEN) ,.AA(A3_addr),.DA(A3_d),.OENA(1'b0)
                ,.QB(B3_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B3_addr) ,.DB(52'b0) ,.OENB(1'b0));

DRAM_256_52 DS4 (.QA(A4_q) ,.CLKA(clk) ,.CENA(A4_CEN) ,.WENA(A4_WEN) ,.AA(A0_addr),.DA(A4_d),.OENA(1'b0)
                ,.QB(B4_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B0_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS5 (.QA(A5_q) ,.CLKA(clk) ,.CENA(A5_CEN) ,.WENA(A5_WEN) ,.AA(A1_addr),.DA(A5_d),.OENA(1'b0)
                ,.QB(B5_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B1_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS6 (.QA(A6_q) ,.CLKA(clk) ,.CENA(A6_CEN) ,.WENA(A6_WEN) ,.AA(A2_addr),.DA(A6_d),.OENA(1'b0)
                ,.QB(B6_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B2_addr) ,.DB(52'b0) ,.OENB(1'b0));
DRAM_256_52 DS7 (.QA(A7_q) ,.CLKA(clk) ,.CENA(A7_CEN) ,.WENA(A7_WEN) ,.AA(A3_addr),.DA(A7_d),.OENA(1'b0)
                ,.QB(B7_q) ,.CLKB(clk) ,.CENB(B_CEN) ,.WENB(1'b1) ,.AB(B3_addr) ,.DB(52'b0) ,.OENB(1'b0));

reg [51:0] DATA,DATA0;

always@(*)
begin
    if(cs == OUTPUT) begin
        case(ram_sel_reg[4]) 
            2'b00:DATA = (out_sel)?B4_q:B0_q;
            2'b01:DATA = (out_sel)?B5_q:B1_q;
            2'b10:DATA = (out_sel)?B6_q:B2_q;
            2'b11:DATA = (out_sel)?B7_q:B3_q;
        endcase
    end
    else DATA = 0;
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) DATA0<=0;
    else DATA0<=DATA;
end

always@(*)
begin
    if(A_sel == 2'd0) S0_addr = OP_A_addr;
    else if(B_sel == 2'd0) S0_addr = OP_B_addr;
    else if(C_sel == 2'd0) S0_addr = OP_C_addr;
    else S0_addr = OP_D_addr;
end

always@(*)
begin
    if(A_sel == 2'd1) S1_addr = OP_A_addr;
    else if(B_sel == 2'd1) S1_addr = OP_B_addr;
    else if(C_sel == 2'd1) S1_addr = OP_C_addr;
    else S1_addr = OP_D_addr;
end

always@(*)
begin
    if(A_sel == 2'd2) S2_addr = OP_A_addr;
    else if(B_sel == 2'd2) S2_addr = OP_B_addr;
    else if(C_sel == 2'd2) S2_addr = OP_C_addr;
    else S2_addr = OP_D_addr;
end

always@(*)
begin
    if(A_sel == 2'd3) S3_addr = OP_A_addr;
    else if(B_sel == 2'd3) S3_addr = OP_B_addr;
    else if(C_sel == 2'd3) S3_addr = OP_C_addr;
    else S3_addr = OP_D_addr;
end

always@(*)
begin
    if(cs == 3'b100 || cs == R2) begin
        B0_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        B1_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        B2_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        B3_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
    end
    else begin
        B0_addr = S0_addr;
        B1_addr = S1_addr;
        B2_addr = S2_addr;
        B3_addr = S3_addr;
    end
end

always@(*)
begin
    if(R4_START | R2_START | cs == OUTPUT) B_CEN = 0;
    else B_CEN = 1;
end


always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) S_EN<=0;
    else if(R_EN) S_EN<=~S_EN;
    else S_EN<=0;
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) out_sel<=0;
    else if(cs == OUTPUT) begin
        out_sel<=cnt[10];
    end
end


always@(*)
begin
    AQ0=(OP_done0)?{Q0[53:28],Q0[25:0]}:CQ0;
    AQ1=(OP_done0)?{Q1[53:28],Q1[25:0]}:CQ0;
    AQ2=(OP2_done0)?{Q2[53:28],Q2[25:0]}:CQ0; 
    AQ3=(OP2_done0)?{Q3[53:28],Q3[25:0]}:CQ0; 
    BQ0=(OP_done0)?{Q4[53:28],Q4[25:0]}:CQ1;
    BQ1=(OP_done1)?CQ1:{Q5[53:28],Q5[25:0]};
    BQ2=(OP_done1)?CQ1:{Q6[53:28],Q6[25:0]};
    BQ3=(OP_done1)?CQ1:{Q7[53:28],Q7[25:0]};
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        for(i=0;i<5;i=i+1) begin
            A_sel_reg[i]<=0;
            B_sel_reg[i]<=0;
            C_sel_reg[i]<=0;
            D_sel_reg[i]<=0;
            ram_sel_reg[i]<=0;
        end
    end
    else if(cs == R2 || cs == R4 || cs == OUTPUT) begin
        for(i=0;i<4;i=i+1) begin
            ram_sel_reg[4]<=ram_sel;
            ram_sel_reg[i]<=ram_sel_reg[i+1];
            A_sel_reg[4]<=A_sel;
            A_sel_reg[i]<=A_sel_reg[i+1];
            B_sel_reg[4]<={A_sel[1],D_sel[0]};
            B_sel_reg[i]<=B_sel_reg[i+1];
            C_sel_reg[4]<={D_sel[1],A_sel[0]};
            C_sel_reg[i]<=C_sel_reg[i+1];
            D_sel_reg[4]<=D_sel;
            D_sel_reg[i]<=D_sel_reg[i+1];
        end
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        R_EN<=0;
        valid[0]<=0;
        valid[1]<=0;
        valid[2]<=0;
        valid1[0]<=0;
        valid1[1]<=0;
        valid1[2]<=0;
    end
    else begin
        R_EN<=in_valid;
        valid[2]<=R4_START;
        valid[1]<=valid[2];
        valid[0]<=valid[1];
        valid1[2]<=R2_START;
        valid1[1]<=valid1[2];
        valid1[0]<=valid1[1];
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) buffer<=0;
    else if(in_valid) buffer<={D_re,D_im};
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) cs<=IDLE;
    else cs<=ns;
end

always@(*)
begin
    case(cs)
        IDLE:ns=(in_valid)?INPUT:IDLE;
        INPUT:ns=(R_EN)?INPUT:R4;
        R4:ns=(cnt[10:8] == 3'b1 & OP_done0 == 0)?R2:R4; 
        R2:ns=(cnt[10] && OP_done1 == 0)?OUTPUT:R2;
        OUTPUT:ns=(cnt[11:9] == 3'b100 && out_start == 0)?IDLE:OUTPUT;
        default:ns=IDLE;
    endcase
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) cnt<=0;
    else begin
        case(cs)
            IDLE:cnt<=0;
            INPUT:cnt<=(S_EN)?cnt+1:cnt;
            R4:cnt<=(cnt[10:8] == 3'b1 & OP_done0 == 0)?0:cnt+1;
            R2:cnt<=(cnt[10] && OP_done1 == 0)?0:cnt+1;
            default:cnt<=(out_start)?cnt+1:cnt;
        endcase
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        for(i=0;i<5;i=i+1) begin
            Q0_addr[i]<=0;
            Q1_addr[i]<=0;
            Q2_addr[i]<=0;
            Q3_addr[i]<=0;
        end
    end
    else if(cs == R4 || cs == R2) begin
        for(i=0;i<4;i=i+1) begin
            Q0_addr[4]<=OP_A_addr;
            Q0_addr[i]<=Q0_addr[i+1];
            Q1_addr[4]<=OP_B_addr;
            Q1_addr[i]<=Q1_addr[i+1];
            Q2_addr[4]<=OP_C_addr;
            Q2_addr[i]<=Q2_addr[i+1];
            Q3_addr[4]<=OP_D_addr;
            Q3_addr[i]<=Q3_addr[i+1];
        end
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        out_start<=0;
        out_start0<=0;
        out_start1<=0;
        out_valid<=0;
    end
    else if(cs == OUTPUT) begin
        out_start<=(cnt[11:9] == 3'b100)?0:1;
        out_start0<=out_start;
        out_start1<=out_start0;        
        out_valid<=out_start1;
    end
    else begin
        out_start<=0;
        out_start0<=out_start;
        out_start1<=out_start0;        
        out_valid<=out_start1;
    end
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        O_re<=0;
        O_im<=0;
    end
    else if(out_start1) begin
        O_re<=DATA0[51:26];
        O_im<=DATA0[25:0];
    end
    else begin
        O_re<=0;
        O_im<=0;
    end

end
endmodule
