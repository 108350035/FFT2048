`include "FFT_2048_tb.v"
/*`ifdef RTL
`include "FFT2048.v"
`elsif GATE
`include "FFT2048_SYN.v"
`elsif POST
`include "CHIP.v"
`endif*/
`include "CHIP.v"
module TESTBED();

wire clk,in_valid;
wire rst_n,out_valid;
wire signed [15:0] D_re,D_im;
wire signed [25:0] O_re,O_im;

`ifdef RTL
FFT2048 U_FFT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .D_re(D_re), 
    .D_im(D_im),
    .out_valid(out_valid),
	.O_re(O_re),
	.O_im(O_im)
);
`elsif GATE
FFT2048 U_FFT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .D_re(D_re), 
    .D_im(D_im),
    .out_valid(out_valid),
	.O_re(O_re),
	.O_im(O_im)
);
`elsif POST
CHIP U_FFT(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .D_re(D_re), 
    .D_im(D_im),
    .out_valid(out_valid),
	.O_re(O_re),
	.O_im(O_im)
);
`endif

PATTERN U_PATTERN(
	.clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .D_re(D_re), 
    .D_im(D_im),
    .out_valid(out_valid),
	.O_re(O_re),
	.O_im(O_im)
);



initial begin
	`ifdef RTL
		$fsdbDumpfile("FFT2048.fsdb");
		$fsdbDumpvars(0,"+mda");
		$fsdbDumpvars();
	`elsif GATE
		$sdf_annotate("FFT2048_SYN.sdf",U_FFT);
		$fsdbDumpfile("FFT2048_SYN.fsdb");
		$fsdbDumpvars();
	`elsif POST
		$sdf_annotate("CHIP.sdf",U_FFT);
		$fsdbDumpfile("CHIP.fsdb");
		$fsdbDumpvars();

	`endif
end

endmodule
