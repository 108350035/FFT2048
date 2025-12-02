module gen_addr(
input [10:0] cnt,
input [1:0] mode,
output reg [7:0] A_addr,B_addr,C_addr,D_addr);

always@(*)
begin
    if(mode == 2'b11) begin
        A_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        B_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        C_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
        D_addr = {cnt[1:0],cnt[3:2],cnt[5:4],cnt[7:6]};
    end
    else begin
    case(cnt[10:8])
        3'b100:begin //ST1
            A_addr = {2'b0,cnt[7:2]};
            B_addr = {2'b1,cnt[7:2]};
            C_addr = {2'd2,cnt[7:2]};
            D_addr = {2'd3,cnt[7:2]};
        end

        3'b101:begin //ST2
            A_addr = {cnt[7:6],2'b0,cnt[5:2]};
            B_addr = {cnt[7:6],2'b1,cnt[5:2]};
            C_addr = {cnt[7:6],2'd2,cnt[5:2]};
            D_addr = {cnt[7:6],2'd3,cnt[5:2]};
        end

        3'b110:begin //ST3
            A_addr = {cnt[7:4],2'b0,cnt[3:2]};
            B_addr = {cnt[7:4],2'b1,cnt[3:2]};
            C_addr = {cnt[7:4],2'd2,cnt[3:2]};
            D_addr = {cnt[7:4],2'd3,cnt[3:2]};
        end

        3'b111:begin //ST4
            A_addr = {cnt[7:2],2'b0};
            B_addr = {cnt[7:2],2'b1};
            C_addr = {cnt[7:2],2'd2};
            D_addr = {cnt[7:2],2'd3};
        end

        default:begin //ST5
            A_addr = cnt[7:0];
            B_addr = cnt[7:0];
            C_addr = cnt[7:0];
            D_addr = cnt[7:0];
        end
    endcase
    end
end

endmodule
