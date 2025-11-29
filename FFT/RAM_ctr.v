module RAM_ctr(
input ctrl,op_wr,
input [1:0] sel,R2_sel,mode,
output reg [3:0] CEN,
output reg [3:0] WEN);

reg [3:0] en;
always@(*) 
begin
    if(mode == 3'b11) begin
        case(R2_sel) 
            2'b00:en = 4'b1110;
            2'b01:en = 4'b1101;
            2'b10:en = 4'b1011;
            2'b11:en = 4'b0111;
        endcase
    end
    else en = 4'b0;
end

always@(*) 
begin
    if(ctrl) begin
        case(sel)
            2'b00:begin
                CEN[0] = 0;
                CEN[1] = 1;
                CEN[2] = 1;
                CEN[3] = 1;
            end
            2'b01:begin
                CEN[0] = 1;
                CEN[1] = 0;
                CEN[2] = 1;
                CEN[3] = 1;
            end
            2'b10:begin
                CEN[0]=  1;
                CEN[1] = 1;
                CEN[2] = 0;
                CEN[3] = 1;
            end
            2'b11:begin
                CEN[0] = 1;
                CEN[1] = 1;
                CEN[2] = 1;
                CEN[3] = 0;
            end
        endcase
    end
    else begin
        CEN[0] = 0;
        CEN[1] = 0;
        CEN[2] = 0;
        CEN[3] = 0;
    end
end

always@(*)
begin
    if(ctrl) begin
        WEN[0] = 0;
        WEN[1] = 0;
        WEN[2] = 0;
        WEN[3] = 0;
    end
    else begin
        WEN[0] = (~op_wr) | en[0];
        WEN[1] = (~op_wr) | en[1];
        WEN[2] = (~op_wr) | en[2];
        WEN[3] = (~op_wr) | en[3];
    end
end

endmodule

module RAM_IN_ctr(
input [51:0] AQ0,AQ1,AQ2,AQ3,
input [31:0] buffer,
input [1:0] A_sel,B_sel,C_sel,
input [2:0] cs,
output reg [51:0] RAM_0d,RAM_1d,RAM_2d,RAM_3d);

always@(*) begin
    if(cs == 3'b001) 
        RAM_0d = {{10{buffer[31]}}, buffer[31:16], {10{buffer[15]}}, buffer[15:0]};
    else begin
        if(A_sel == 2'd0) RAM_0d = AQ0;
        else if(B_sel == 2'd0) RAM_0d = AQ1;
        else if(C_sel == 2'd0) RAM_0d = AQ2;
        else RAM_0d = AQ3;
    end
end

always@(*) begin
    if(cs == 3'b001) 
        RAM_1d = {{10{buffer[31]}}, buffer[31:16], {10{buffer[15]}}, buffer[15:0]};
    else begin
        if(A_sel == 2'd1) RAM_1d = AQ0;
        else if(B_sel == 2'd1) RAM_1d = AQ1;
        else if(C_sel == 2'd1) RAM_1d = AQ2;
        else RAM_1d = AQ3;
    end
end


always@(*) begin
    if(cs == 3'b001) 
        RAM_2d = {{10{buffer[31]}}, buffer[31:16], {10{buffer[15]}}, buffer[15:0]};
    else begin
        if(A_sel == 2'd2) RAM_2d = AQ0;
        else if(B_sel == 2'd2) RAM_2d = AQ1;
        else if(C_sel == 2'd2) RAM_2d = AQ2;
        else RAM_2d = AQ3;
    end
end

always@(*) begin
    if(cs == 3'b001) 
        RAM_3d = {{10{buffer[31]}}, buffer[31:16], {10{buffer[15]}}, buffer[15:0]};
    else begin
        if(A_sel == 2'd3) RAM_3d = AQ0;
        else if(B_sel == 2'd3) RAM_3d = AQ1;
        else if(C_sel == 2'd3) RAM_3d = AQ2;
        else RAM_3d = AQ3;
    end
end
endmodule

module RAM_ADDR_ctr(
input [7:0] Q0_addr,Q1_addr,
input [7:0] Q2_addr,Q3_addr,cnt,
input [2:0] cs,
input [1:0] A_sel,B_sel,C_sel,
output reg [7:0] A0_addr,A1_addr,A2_addr,A3_addr);

reg [7:0] S0_addr,S1_addr,S2_addr,S3_addr;

always@(*)
begin
    if(A_sel == 2'd0) S0_addr = Q0_addr;
    else if(B_sel == 2'd0) S0_addr = Q1_addr;
    else if(C_sel == 2'd0) S0_addr = Q2_addr;
    else S0_addr = Q3_addr;
end

always@(*)
begin
    if(A_sel == 2'd1) S1_addr = Q0_addr;
    else if(B_sel == 2'd1) S1_addr = Q1_addr;
    else if(C_sel == 2'd1) S1_addr = Q2_addr;
    else S1_addr = Q3_addr;
end

always@(*)
begin
    if(A_sel == 2'd2) S2_addr = Q0_addr;
    else if(B_sel == 2'd2) S2_addr = Q1_addr;
    else if(C_sel == 2'd2) S2_addr = Q2_addr;
    else S2_addr = Q3_addr;
end

always@(*)
begin
    if(A_sel == 2'd3) S3_addr = Q0_addr;
    else if(B_sel == 2'd3) S3_addr = Q1_addr;
    else if(C_sel == 2'd3) S3_addr = Q2_addr;
    else S3_addr = Q3_addr;
end


always@(*)
begin
    if(cs == 3'b001) A0_addr = cnt;
    else A0_addr = S0_addr;
end

always@(*)
begin
    if(cs == 3'b001) A1_addr = cnt;
    else A1_addr = S1_addr;
end

always@(*)
begin
    if(cs == 3'b001) A2_addr = cnt;
    else A2_addr = S2_addr;
end

always@(*)
begin
    if(cs == 3'b001) A3_addr = cnt;
    else A3_addr = S3_addr;
end

endmodule

module RAM_OUT_ctr(
input [1:0] A_sel,B_sel,C_sel,D_sel,ram_sel,mode,
input [51:0] D0,D1,D2,D3,
input clk,rst_n,ready,
output reg [51:0] A,B,C,D,
output reg out_valid);
reg valid;
reg [51:0] OPA,OPB,OPC,OPD,OPE;

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        out_valid<=0;
        valid<=0;
    end
    else begin
        out_valid<=valid;
        valid<=ready;
    end
end

always@(*)
begin
    case(ram_sel)
        2'b0:OPE = D0;
        2'b1:OPE = D1;
        2'd2:OPE = D2;
        default:OPE = D3;
    endcase
end

always@(*)
begin
    case(A_sel)
        2'b0:OPA = D0;
        2'b1:OPA = D1;
        2'd2:OPA = D2;
        default:OPA = D3;
    endcase
end

always@(*)
begin
    case(B_sel)
        2'b0:OPB = D0;
        2'b1:OPB = D1;
        2'd2:OPB = D2;
        default:OPB = D3;
    endcase
end

always@(*)
begin
    case(C_sel)
        2'b0:OPC = D0;
        2'b1:OPC = D1;
        2'd2:OPC = D2;
        default:OPC = D3;
    endcase
end

always@(*)
begin
    case(D_sel)
        2'b0:OPD = D0;
        2'b1:OPD = D1;
        2'd2:OPD = D2;
        default:OPD = D3;
    endcase
end

always@(posedge clk,negedge rst_n)
begin
    if(!rst_n) begin
        A<=0;
        B<=0;
        C<=0;
        D<=0;
    end
    else if(valid) begin
        A<=(mode == 3'b11)?OPE:OPA;
        B<=OPB;
        C<=OPC;
        D<=OPD;
    end
end

endmodule

