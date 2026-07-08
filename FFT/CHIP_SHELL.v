module CHIP( 	
	clk,
    rst_n,
    in_valid,
    D_re,
    D_im,
    out_valid,
    O_re,
    O_im);

input clk,rst_n;
input in_valid;
input [15:0] D_re,D_im;

output out_valid;
output [25:0] O_re,O_im;

wire   C_clk;
wire   C_rst_n;
wire   C_in_valid;
wire  [15:0] C_D_re,C_D_im;

wire  C_out_valid;
wire  [25:0] C_O_re,C_O_im;

wire BUF_clk;
DCCKBD12BWP7T40P140 buf0(.I(C_clk),.Z(BUF_clk));

FFT2048 U_FFT(
    .clk(BUF_clk),
    .rst_n(C_rst_n),
    .in_valid(C_in_valid),
    .D_re(C_D_re), 
    .D_im(C_D_im),
    .out_valid(C_out_valid),
	.O_re(C_O_re),
	.O_im(C_O_im)
);

// Input Pads
PDDW08SDGZ_H_G I_CLK(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(clk), .C(C_clk));
PDDW08SDGZ_H_G I_RESET(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(rst_n), .C(C_rst_n));
PDDW08DGZ_H_G I_IN_VALID(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(in_valid), .C(C_in_valid));
PDDW08DGZ_H_G I_RE0(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[0]), .C(C_D_re[0]));
PDDW08DGZ_H_G I_RE1(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[1]), .C(C_D_re[1]));
PDDW08DGZ_H_G I_RE2(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[2]), .C(C_D_re[2]));
PDDW08DGZ_H_G I_RE3(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[3]), .C(C_D_re[3]));
PDDW08DGZ_H_G I_RE4(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[4]), .C(C_D_re[4]));
PDDW08DGZ_H_G I_RE5(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[5]), .C(C_D_re[5]));
PDDW08DGZ_H_G I_RE6(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[6]), .C(C_D_re[6]));
PDDW08DGZ_H_G I_RE7(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[7]), .C(C_D_re[7]));
PDDW08DGZ_H_G I_RE8(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[8]), .C(C_D_re[8]));
PDDW08DGZ_H_G I_RE9(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[9]), .C(C_D_re[9]));
PDDW08DGZ_H_G I_RE10(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[10]), .C(C_D_re[10]));
PDDW08DGZ_H_G I_RE11(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[11]), .C(C_D_re[11]));
PDDW08DGZ_H_G I_RE12(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[12]), .C(C_D_re[12]));
PDDW08DGZ_H_G I_RE13(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[13]), .C(C_D_re[13]));
PDDW08DGZ_H_G I_RE14(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[14]), .C(C_D_re[14]));
PDDW08DGZ_H_G I_RE15(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_re[15]), .C(C_D_re[15]));
PDDW08DGZ_H_G I_IM0(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[0]), .C(C_D_im[0]));
PDDW08DGZ_H_G I_IM1(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[1]), .C(C_D_im[1]));
PDDW08DGZ_H_G I_IM2(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[2]), .C(C_D_im[2]));
PDDW08DGZ_H_G I_IM3(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[3]), .C(C_D_im[3]));
PDDW08DGZ_H_G I_IM4(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[4]), .C(C_D_im[4]));
PDDW08DGZ_H_G I_IM5(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[5]), .C(C_D_im[5]));
PDDW08DGZ_H_G I_IM6(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[6]), .C(C_D_im[6]));
PDDW08DGZ_H_G I_IM7(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[7]), .C(C_D_im[7]));
PDDW08DGZ_H_G I_IM8(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[8]), .C(C_D_im[8]));
PDDW08DGZ_H_G I_IM9(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[9]), .C(C_D_im[9]));
PDDW08DGZ_H_G I_IM10(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[10]), .C(C_D_im[10]));
PDDW08DGZ_H_G I_IM11(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[11]), .C(C_D_im[11]));
PDDW08DGZ_H_G I_IM12(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[12]), .C(C_D_im[12]));
PDDW08DGZ_H_G I_IM13(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[13]), .C(C_D_im[13]));
PDDW08DGZ_H_G I_IM14(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[14]), .C(C_D_im[14]));
PDDW08DGZ_H_G I_IM15(.I(1'b0), .OEN(1'b1), .REN(1'b0), .PAD(D_im[15]), .C(C_D_im[15]));

// Output Pads
PDDW08DGZ_H_G O_OUT_VALID (.I(C_out_valid),  .OEN(1'b0), .REN(1'b0), .PAD(out_valid),  .C());
PDDW08DGZ_H_G O_RE0 (.I(C_O_re[0]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[0]),  .C());
PDDW08DGZ_H_G O_RE1 (.I(C_O_re[1]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[1]),  .C());
PDDW08DGZ_H_G O_RE2 (.I(C_O_re[2]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[2]),  .C());
PDDW08DGZ_H_G O_RE3 (.I(C_O_re[3]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[3]),  .C());
PDDW08DGZ_V_G O_RE4 (.I(C_O_re[4]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[4]),  .C());
PDDW08DGZ_V_G O_RE5 (.I(C_O_re[5]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[5]),  .C());
PDDW08DGZ_V_G O_RE6 (.I(C_O_re[6]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[6]),  .C());
PDDW08DGZ_V_G O_RE7 (.I(C_O_re[7]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[7]),  .C());
PDDW08DGZ_V_G O_RE8 (.I(C_O_re[8]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[8]),  .C());
PDDW08DGZ_V_G O_RE9 (.I(C_O_re[9]),  .OEN(1'b0), .REN(1'b0), .PAD(O_re[9]),  .C());
PDDW08DGZ_V_G O_RE10(.I(C_O_re[10]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[10]), .C());
PDDW08DGZ_V_G O_RE11(.I(C_O_re[11]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[11]), .C());
PDDW08DGZ_V_G O_RE12(.I(C_O_re[12]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[12]), .C());
PDDW08DGZ_V_G O_RE13(.I(C_O_re[13]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[13]), .C());
PDDW08DGZ_V_G O_RE14(.I(C_O_re[14]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[14]), .C());
PDDW08DGZ_V_G O_RE15(.I(C_O_re[15]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[15]), .C());
PDDW08DGZ_V_G O_RE16(.I(C_O_re[16]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[16]), .C());
PDDW08DGZ_V_G O_RE17(.I(C_O_re[17]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[17]), .C());
PDDW08DGZ_V_G O_RE18(.I(C_O_re[18]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[18]), .C());
PDDW08DGZ_V_G O_RE19(.I(C_O_re[19]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[19]), .C());
PDDW08DGZ_V_G O_RE20(.I(C_O_re[20]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[20]), .C());
PDDW08DGZ_V_G O_RE21(.I(C_O_re[21]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[21]), .C());
PDDW08DGZ_V_G O_RE22(.I(C_O_re[22]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[22]), .C());
PDDW08DGZ_V_G O_RE23(.I(C_O_re[23]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[23]), .C());
PDDW08DGZ_V_G O_RE24(.I(C_O_re[24]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[24]), .C());
PDDW08DGZ_V_G O_RE25(.I(C_O_re[25]), .OEN(1'b0), .REN(1'b0), .PAD(O_re[25]), .C());
PDDW08DGZ_H_G O_IM0 (.I(C_O_im[0]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[0]),  .C());
PDDW08DGZ_H_G O_IM1 (.I(C_O_im[1]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[1]),  .C());
PDDW08DGZ_H_G O_IM2 (.I(C_O_im[2]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[2]),  .C());
PDDW08DGZ_H_G O_IM3 (.I(C_O_im[3]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[3]),  .C());
PDDW08DGZ_V_G O_IM4 (.I(C_O_im[4]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[4]),  .C());
PDDW08DGZ_V_G O_IM5 (.I(C_O_im[5]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[5]),  .C());
PDDW08DGZ_V_G O_IM6 (.I(C_O_im[6]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[6]),  .C());
PDDW08DGZ_V_G O_IM7 (.I(C_O_im[7]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[7]),  .C());
PDDW08DGZ_V_G O_IM8 (.I(C_O_im[8]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[8]),  .C());
PDDW08DGZ_V_G O_IM9 (.I(C_O_im[9]),  .OEN(1'b0), .REN(1'b0), .PAD(O_im[9]),  .C());
PDDW08DGZ_V_G O_IM10(.I(C_O_im[10]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[10]), .C());
PDDW08DGZ_V_G O_IM11(.I(C_O_im[11]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[11]), .C());
PDDW08DGZ_V_G O_IM12(.I(C_O_im[12]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[12]), .C());
PDDW08DGZ_V_G O_IM13(.I(C_O_im[13]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[13]), .C());
PDDW08DGZ_V_G O_IM14(.I(C_O_im[14]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[14]), .C());
PDDW08DGZ_V_G O_IM15(.I(C_O_im[15]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[15]), .C());
PDDW08DGZ_V_G O_IM16(.I(C_O_im[16]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[16]), .C());
PDDW08DGZ_V_G O_IM17(.I(C_O_im[17]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[17]), .C());
PDDW08DGZ_V_G O_IM18(.I(C_O_im[18]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[18]), .C());
PDDW08DGZ_V_G O_IM19(.I(C_O_im[19]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[19]), .C());
PDDW08DGZ_V_G O_IM20(.I(C_O_im[20]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[20]), .C());
PDDW08DGZ_V_G O_IM21(.I(C_O_im[21]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[21]), .C());
PDDW08DGZ_V_G O_IM22(.I(C_O_im[22]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[22]), .C());
PDDW08DGZ_V_G O_IM23(.I(C_O_im[23]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[23]), .C());
PDDW08DGZ_V_G O_IM24(.I(C_O_im[24]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[24]), .C());
PDDW08DGZ_V_G O_IM25(.I(C_O_im[25]), .OEN(1'b0), .REN(1'b0), .PAD(O_im[25]), .C());

// IO power 
PVDD2DGZ_H_G VDDP0 (.VDDPST(VDDIO));
PVSS2DGZ_H_G GNDP0 (.VSSPST(VSSIO));
PVDD2DGZ_V_G VDDP1 (.VDDPST(VDDIO));
PVSS2DGZ_V_G GNDP1 (.VSSPST(VSSIO));
PVDD2DGZ_H_G VDDP2 (.VDDPST(VDDIO));
PVSS2DGZ_H_G GNDP2 (.VSSPST(VSSIO));
PVDD2DGZ_V_G VDDP3 (.VDDPST(VDDIO));
PVSS2DGZ_V_G GNDP3 (.VSSPST(VSSIO));


// Core power
PVDD1DGZ_H_G VDDC0 (.VDD(VDDC));
PVSS1DGZ_H_G GNDC0 (.VSS(VSSC));
PVDD1DGZ_V_G VDDC1 (.VDD(VDDC));
PVSS1DGZ_V_G GNDC1 (.VSS(VSSC));
PVDD1DGZ_H_G VDDC2 (.VDD(VDDC));
PVSS1DGZ_H_G GNDC2 (.VSS(VSSC));
PVDD1DGZ_V_G VDDC3 (.VDD(VDDC));
PVSS1DGZ_V_G GNDC3 (.VSS(VSSC));

endmodule

