`ifdef RTL
	`define CYCLE_TIME 8
`elsif GATE
	`define CYCLE_TIME 8
`elsif POST
	`define CYCLE_TIME 16
`endif
`timescale 1ns/1ps

module PATTERN(
// output signals
    clk,
    rst_n,
    in_valid,
    D_re,
    D_im,
// input signals
    O_re,
    O_im,
    out_valid
);

output reg clk, rst_n,in_valid;
output reg signed [15:0] D_re, D_im;
input signed [25:0] O_re,O_im;
input out_valid;

integer mem_txt,patcount,output_file;
reg signed [31:0] data_in [0:2047];
reg signed [51:0] data_out [0:2047];

//==============CLK==============
initial clk = 0;
always #(`CYCLE_TIME/2) clk=~clk;
//===============================

initial begin
    $readmemb("test.txt", data_in) ;
    output_file = $fopen("output_file.txt","w");
    rst_n = 1'b1;
    in_valid = 0;
    force clk = 0;
    reset_task;
    for(patcount = 0;patcount < 2048;patcount = patcount + 1) begin
        in_valid = 1;
        D_re = data_in[patcount][31:16];
        D_im = data_in[patcount][15:0];
        @(negedge clk);
    end
    in_valid = 0;
    D_re = 'bx;
    D_im = 'bx;
    wait_valid;
    for(patcount = 0;patcount < 2048;patcount = patcount + 1)begin
        data_out[patcount][25:0] = O_im;
        data_out[patcount][51:26] = O_re;
        $fwrite(output_file, "%b\n", {data_out[patcount][51:26],data_out[patcount][25:0]});
        @(negedge clk);
    end
    @(negedge clk);
    $finish;
end

task reset_task;
begin
    #10; rst_n = 1'b0;
    #10;if((O_re != 'b0) || (O_im != 'b0)) begin
        $display ("------------------------------------------------------------------------------------------------------------------------");
		$display ("                          All output signals should be reset after the reset signal is asserted.                        ");
		$display ("------------------------------------------------------------------------------------------------------------------------");
    repeat(2) @(negedge clk);
    $finish;
    end
    #10; rst_n = 1'b1;
    #(3.0) release clk;
end
endtask

task wait_valid;
begin
    while(out_valid == 0) begin
        //$display("***************************************************************");
		//$display("*     		    wait wait wait      						*");
		//$display("***************************************************************");
        @(negedge clk);
    end
end
endtask


endmodule
