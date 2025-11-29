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
CLKBUFX20 buf0(.A(C_clk),.Y(BUF_clk));

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
PDUSDGZ I_CLK(.PAD(clk), .C(C_clk));
PDUSDGZ I_RESET(.PAD(rst_n), .C(C_rst_n));
PDUSDGZ I_IN_VALID(.PAD(in_valid), .C(C_in_valid));
PDUSDGZ I_D_RE_0  (.PAD(D_re[0]),  .C(C_D_re[0]));
PDUSDGZ I_D_RE_1  (.PAD(D_re[1]),  .C(C_D_re[1]));
PDUSDGZ I_D_RE_2  (.PAD(D_re[2]),  .C(C_D_re[2]));
PDUSDGZ I_D_RE_3  (.PAD(D_re[3]),  .C(C_D_re[3]));
PDUSDGZ I_D_RE_4  (.PAD(D_re[4]),  .C(C_D_re[4]));
PDUSDGZ I_D_RE_5  (.PAD(D_re[5]),  .C(C_D_re[5]));
PDUSDGZ I_D_RE_6  (.PAD(D_re[6]),  .C(C_D_re[6]));
PDUSDGZ I_D_RE_7  (.PAD(D_re[7]),  .C(C_D_re[7]));
PDUSDGZ I_D_RE_8  (.PAD(D_re[8]),  .C(C_D_re[8]));
PDUSDGZ I_D_RE_9  (.PAD(D_re[9]),  .C(C_D_re[9]));
PDUSDGZ I_D_RE_10 (.PAD(D_re[10]), .C(C_D_re[10]));
PDUSDGZ I_D_RE_11 (.PAD(D_re[11]), .C(C_D_re[11]));
PDUSDGZ I_D_RE_12 (.PAD(D_re[12]), .C(C_D_re[12]));
PDUSDGZ I_D_RE_13 (.PAD(D_re[13]), .C(C_D_re[13]));
PDUSDGZ I_D_RE_14 (.PAD(D_re[14]), .C(C_D_re[14]));
PDUSDGZ I_D_RE_15 (.PAD(D_re[15]), .C(C_D_re[15]));
PDUSDGZ I_D_IM_0  (.PAD(D_im[0]),  .C(C_D_im[0]));
PDUSDGZ I_D_IM_1  (.PAD(D_im[1]),  .C(C_D_im[1]));
PDUSDGZ I_D_IM_2  (.PAD(D_im[2]),  .C(C_D_im[2]));
PDUSDGZ I_D_IM_3  (.PAD(D_im[3]),  .C(C_D_im[3]));
PDUSDGZ I_D_IM_4  (.PAD(D_im[4]),  .C(C_D_im[4]));
PDUSDGZ I_D_IM_5  (.PAD(D_im[5]),  .C(C_D_im[5]));
PDUSDGZ I_D_IM_6  (.PAD(D_im[6]),  .C(C_D_im[6]));
PDUSDGZ I_D_IM_7  (.PAD(D_im[7]),  .C(C_D_im[7]));
PDUSDGZ I_D_IM_8  (.PAD(D_im[8]),  .C(C_D_im[8]));
PDUSDGZ I_D_IM_9  (.PAD(D_im[9]),  .C(C_D_im[9]));
PDUSDGZ I_D_IM_10 (.PAD(D_im[10]), .C(C_D_im[10]));
PDUSDGZ I_D_IM_11 (.PAD(D_im[11]), .C(C_D_im[11]));
PDUSDGZ I_D_IM_12 (.PAD(D_im[12]), .C(C_D_im[12]));
PDUSDGZ I_D_IM_13 (.PAD(D_im[13]), .C(C_D_im[13]));
PDUSDGZ I_D_IM_14 (.PAD(D_im[14]), .C(C_D_im[14]));
PDUSDGZ I_D_IM_15 (.PAD(D_im[15]), .C(C_D_im[15]));

// Output Pads
PDD08SDGZ O_OUT_VALID(.OEN(1'b0), .I(C_out_valid), .PAD(out_valid), .C());
PDD08SDGZ O_O_RE_0  (.OEN(1'b0), .I(C_O_re[0]),  .PAD(O_re[0]),  .C());
PDD08SDGZ O_O_RE_1  (.OEN(1'b0), .I(C_O_re[1]),  .PAD(O_re[1]),  .C());
PDD08SDGZ O_O_RE_2  (.OEN(1'b0), .I(C_O_re[2]),  .PAD(O_re[2]),  .C());
PDD08SDGZ O_O_RE_3  (.OEN(1'b0), .I(C_O_re[3]),  .PAD(O_re[3]),  .C());
PDD08SDGZ O_O_RE_4  (.OEN(1'b0), .I(C_O_re[4]),  .PAD(O_re[4]),  .C());
PDD08SDGZ O_O_RE_5  (.OEN(1'b0), .I(C_O_re[5]),  .PAD(O_re[5]),  .C());
PDD08SDGZ O_O_RE_6  (.OEN(1'b0), .I(C_O_re[6]),  .PAD(O_re[6]),  .C());
PDD08SDGZ O_O_RE_7  (.OEN(1'b0), .I(C_O_re[7]),  .PAD(O_re[7]),  .C());
PDD08SDGZ O_O_RE_8  (.OEN(1'b0), .I(C_O_re[8]),  .PAD(O_re[8]),  .C());
PDD08SDGZ O_O_RE_9  (.OEN(1'b0), .I(C_O_re[9]),  .PAD(O_re[9]),  .C());
PDD08SDGZ O_O_RE_10 (.OEN(1'b0), .I(C_O_re[10]), .PAD(O_re[10]), .C());
PDD08SDGZ O_O_RE_11 (.OEN(1'b0), .I(C_O_re[11]), .PAD(O_re[11]), .C());
PDD08SDGZ O_O_RE_12 (.OEN(1'b0), .I(C_O_re[12]), .PAD(O_re[12]), .C());
PDD08SDGZ O_O_RE_13 (.OEN(1'b0), .I(C_O_re[13]), .PAD(O_re[13]), .C());
PDD08SDGZ O_O_RE_14 (.OEN(1'b0), .I(C_O_re[14]), .PAD(O_re[14]), .C());
PDD08SDGZ O_O_RE_15 (.OEN(1'b0), .I(C_O_re[15]), .PAD(O_re[15]), .C());
PDD08SDGZ O_O_RE_16 (.OEN(1'b0), .I(C_O_re[16]), .PAD(O_re[16]), .C());
PDD08SDGZ O_O_RE_17 (.OEN(1'b0), .I(C_O_re[17]), .PAD(O_re[17]), .C());
PDD08SDGZ O_O_RE_18 (.OEN(1'b0), .I(C_O_re[18]), .PAD(O_re[18]), .C());
PDD08SDGZ O_O_RE_19 (.OEN(1'b0), .I(C_O_re[19]), .PAD(O_re[19]), .C());
PDD08SDGZ O_O_RE_20 (.OEN(1'b0), .I(C_O_re[20]), .PAD(O_re[20]), .C());
PDD08SDGZ O_O_RE_21 (.OEN(1'b0), .I(C_O_re[21]), .PAD(O_re[21]), .C());
PDD08SDGZ O_O_RE_22 (.OEN(1'b0), .I(C_O_re[22]), .PAD(O_re[22]), .C());
PDD08SDGZ O_O_RE_23 (.OEN(1'b0), .I(C_O_re[23]), .PAD(O_re[23]), .C());
PDD08SDGZ O_O_RE_24 (.OEN(1'b0), .I(C_O_re[24]), .PAD(O_re[24]), .C());
PDD08SDGZ O_O_RE_25 (.OEN(1'b0), .I(C_O_re[25]), .PAD(O_re[25]), .C());
PDD08SDGZ O_O_IM_0  (.OEN(1'b0), .I(C_O_im[0]),  .PAD(O_im[0]),  .C());
PDD08SDGZ O_O_IM_1  (.OEN(1'b0), .I(C_O_im[1]),  .PAD(O_im[1]),  .C());
PDD08SDGZ O_O_IM_2  (.OEN(1'b0), .I(C_O_im[2]),  .PAD(O_im[2]),  .C());
PDD08SDGZ O_O_IM_3  (.OEN(1'b0), .I(C_O_im[3]),  .PAD(O_im[3]),  .C());
PDD08SDGZ O_O_IM_4  (.OEN(1'b0), .I(C_O_im[4]),  .PAD(O_im[4]),  .C());
PDD08SDGZ O_O_IM_5  (.OEN(1'b0), .I(C_O_im[5]),  .PAD(O_im[5]),  .C());
PDD08SDGZ O_O_IM_6  (.OEN(1'b0), .I(C_O_im[6]),  .PAD(O_im[6]),  .C());
PDD08SDGZ O_O_IM_7  (.OEN(1'b0), .I(C_O_im[7]),  .PAD(O_im[7]),  .C());
PDD08SDGZ O_O_IM_8  (.OEN(1'b0), .I(C_O_im[8]),  .PAD(O_im[8]),  .C());
PDD08SDGZ O_O_IM_9  (.OEN(1'b0), .I(C_O_im[9]),  .PAD(O_im[9]),  .C());
PDD08SDGZ O_O_IM_10 (.OEN(1'b0), .I(C_O_im[10]), .PAD(O_im[10]), .C());
PDD08SDGZ O_O_IM_11 (.OEN(1'b0), .I(C_O_im[11]), .PAD(O_im[11]), .C());
PDD08SDGZ O_O_IM_12 (.OEN(1'b0), .I(C_O_im[12]), .PAD(O_im[12]), .C());
PDD08SDGZ O_O_IM_13 (.OEN(1'b0), .I(C_O_im[13]), .PAD(O_im[13]), .C());
PDD08SDGZ O_O_IM_14 (.OEN(1'b0), .I(C_O_im[14]), .PAD(O_im[14]), .C());
PDD08SDGZ O_O_IM_15 (.OEN(1'b0), .I(C_O_im[15]), .PAD(O_im[15]), .C());
PDD08SDGZ O_O_IM_16 (.OEN(1'b0), .I(C_O_im[16]), .PAD(O_im[16]), .C());
PDD08SDGZ O_O_IM_17 (.OEN(1'b0), .I(C_O_im[17]), .PAD(O_im[17]), .C());
PDD08SDGZ O_O_IM_18 (.OEN(1'b0), .I(C_O_im[18]), .PAD(O_im[18]), .C());
PDD08SDGZ O_O_IM_19 (.OEN(1'b0), .I(C_O_im[19]), .PAD(O_im[19]), .C());
PDD08SDGZ O_O_IM_20 (.OEN(1'b0), .I(C_O_im[20]), .PAD(O_im[20]), .C());
PDD08SDGZ O_O_IM_21 (.OEN(1'b0), .I(C_O_im[21]), .PAD(O_im[21]), .C());
PDD08SDGZ O_O_IM_22 (.OEN(1'b0), .I(C_O_im[22]), .PAD(O_im[22]), .C());
PDD08SDGZ O_O_IM_23 (.OEN(1'b0), .I(C_O_im[23]), .PAD(O_im[23]), .C());
PDD08SDGZ O_O_IM_24 (.OEN(1'b0), .I(C_O_im[24]), .PAD(O_im[24]), .C());
PDD08SDGZ O_O_IM_25 (.OEN(1'b0), .I(C_O_im[25]), .PAD(O_im[25]), .C());


// IO power 
PVDD2DGZ VDDP0 ();
PVSS2DGZ GNDP0 ();
PVDD2DGZ VDDP1 ();
PVSS2DGZ GNDP1 ();
PVDD2DGZ VDDP2 ();
PVSS2DGZ GNDP2 ();
PVDD2DGZ VDDP3 ();
PVSS2DGZ GNDP3 ();
PVDD2DGZ VDDP4 ();
PVSS2DGZ GNDP4 ();
PVDD2DGZ VDDP5 ();
PVSS2DGZ GNDP5 ();
PVDD2DGZ VDDP6 ();
PVSS2DGZ GNDP6 ();
PVDD2DGZ VDDP7 ();
PVSS2DGZ GNDP7 ();
PVDD2DGZ VDDP8 ();
PVSS2DGZ GNDP8 ();
PVDD2DGZ VDDP9 ();
PVSS2DGZ GNDP9 ();
PVDD2DGZ VDDP10 ();
PVSS2DGZ GNDP10 ();
PVDD2DGZ VDDP11 ();
PVSS2DGZ GNDP11 ();


// Core power
PVDD1DGZ VDDC0 ();
PVSS1DGZ GNDC0 ();
PVDD1DGZ VDDC1 ();
PVSS1DGZ GNDC1 ();
PVDD1DGZ VDDC2 ();
PVSS1DGZ GNDC2 ();
PVDD1DGZ VDDC3 ();
PVSS1DGZ GNDC3 ();
PVDD1DGZ VDDC4 ();
PVSS1DGZ GNDC4 ();
PVDD1DGZ VDDC5 ();
PVSS1DGZ GNDC5 ();
PVDD1DGZ VDDC6 ();
PVSS1DGZ GNDC6 ();
PVDD1DGZ VDDC7 ();
PVSS1DGZ GNDC7 ();
PVDD1DGZ VDDC8 ();
PVSS1DGZ GNDC8 ();
PVDD1DGZ VDDC9 ();
PVSS1DGZ GNDC9 ();
PVDD1DGZ VDDC10 ();
PVSS1DGZ GNDC10 ();
PVDD1DGZ VDDC11 ();
PVSS1DGZ GNDC11 ();

endmodule

