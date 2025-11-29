module twiddle(
input clk,rst_n,ready,
input [11:0] cnt,
input [1:0] mode,
output reg [31:0] W0,W1,W2,W3,
output reg R4_valid,R2_valid,factor);

reg valid;
reg [7:0] rom_addr;
reg [8:0] rom_addr1;
wire [31:0] rom0_q,rom1_q,rom2_q,rom3_q;
ROM_Wp  Wp0(.CLK(clk) ,.CEN(1'b0) ,.Q(rom0_q) ,.A(rom_addr));
ROM_W2p Wp1(.CLK(clk) ,.CEN(1'b0) ,.Q(rom1_q) ,.A(rom_addr));
ROM_W3p Wp2(.CLK(clk) ,.CEN(1'b0) ,.Q(rom2_q) ,.A(rom_addr));
R2_Wp Wp3(.CLK(clk) ,.CEN(1'b0) ,.Q(rom3_q) ,.A(rom_addr1));

always@(*)
begin//R4
    case(cnt[10:8])
        3'b101:rom_addr = {cnt[7:6],6'b0}; //ST2
        3'b110:rom_addr = {cnt[5:4],cnt[7:6],4'b0}; //ST3
        3'b111:rom_addr = {cnt[3:2],cnt[5:4],cnt[7:6],2'b0}; //ST4
        3'b000:rom_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]}; //ST5
        default:rom_addr = 0; // ST1
    endcase
end

always@(*)
begin//R2
    rom_addr1 = cnt[8:0];
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        R4_valid<=0;
        R2_valid<=0;        
        valid<=0;
        factor<=0;
    end
    else begin
        R4_valid<=(mode == 2'b10)?valid:0;
        R2_valid<=(mode == 2'b10)?0:valid;        
        valid<=ready;
        factor<=(valid && mode == 2'b11)?((cnt[9])?1:0):0;
    end
end


always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        W0<=0;
        W1<=0;
        W2<=0;
        W3<=0;
    end
    else begin
        W0<=rom0_q;
        W1<=rom1_q;
        W2<=rom2_q;
        W3<=rom3_q;
    end
end

endmodule