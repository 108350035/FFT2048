//
//      CONFIDENTIAL AND PROPRIETARY SOFTWARE/DATA OF ARTISAN COMPONENTS, INC.
//      
//      Copyright (c) 2025 Artisan Components, Inc.  All Rights Reserved.
//      
//      Use of this Software/Data is subject to the terms and conditions of
//      the applicable license agreement between Artisan Components, Inc. and
//      Taiwan Semiconductor Manufacturing Company Ltd..  In addition, this Software/Data
//      is protected by copyright law and international treaties.
//      
//      The copyright notice(s) in this Software/Data does not indicate actual
//      or intended publication of this Software/Data.
//      name:			SRAM-DP-HS SRAM Generator
//           			TSMC CL018G Process
//      version:		2003Q2V1
//      comment:		
//      configuration:	 -instname "DRAM_256_52" -words 256 -bits 52 -frequency 200 -ring_width 2 -mux 16 -drive 12 -write_mask off -wp_size 8 -top_layer met6 -power_type rings -horiz met3 -vert met4 -cust_comment "" -left_bus_delim "[" -right_bus_delim "]" -pwr_gnd_rename "VDD:VDD,GND:VSS" -prefix "" -pin_space 0.0 -name_case upper -check_instname on -diodes on -inside_ring_type GND
//
//      Verilog model for Synchronous Dual-Port Ram
//
//      Instance Name:  DRAM_256_52
//      Words:          256
//      Word Width:     52
//      Pipeline:       No
//
//      Creation Date:  2025-11-22 02:54:46Z
//      Version: 	2003Q2V1
//
//      Verified With: Cadence Verilog-XL
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: The output hold function has been deleted
//          completely from this model.  Most Verilog simulators are 
//          incapable of scheduling more than 1 event on the rising 
//          edge of clock.  Therefore, it is impossible to model
//          the output hold (to x) action correctly.  It is necessary
//          to run static path timing tools using Artisan supplied
//          timing models to insure that the output hold time is
//          sufficient enough to not violate hold time constraints
//          of downstream flip-flops.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
`celldefine
module DRAM_256_52 (
   QA,
   CLKA,
   CENA,
   WENA,
   AA,
   DA,
   OENA,
   QB,
   CLKB,
   CENB,
   WENB,
   AB,
   DB,
   OENB
);
   parameter		   BITS = 52;
   parameter		   word_depth = 256;
   parameter		   addr_width = 8;
   parameter		   wordx = {BITS{1'bx}};
   parameter		   addrx = {addr_width{1'bx}};
	
   output [51:0] QA;
   input CLKA;
   input CENA;
   input WENA;
   input [7:0] AA;
   input [51:0] DA;
   input OENA;
   output [51:0] QB;
   input CLKB;
   input CENB;
   input WENB;
   input [7:0] AB;
   input [51:0] DB;
   input OENB;

   reg [BITS-1:0]	   mem [word_depth-1:0];
   reg                     NOT_CONTA;
   reg                     NOT_CONTB;

   reg			   NOT_CENA;
   reg			   NOT_WENA;

   reg			   NOT_AA0;
   reg			   NOT_AA1;
   reg			   NOT_AA2;
   reg			   NOT_AA3;
   reg			   NOT_AA4;
   reg			   NOT_AA5;
   reg			   NOT_AA6;
   reg			   NOT_AA7;
   reg [addr_width-1:0]	   NOT_AA;
   reg			   NOT_DA0;
   reg			   NOT_DA1;
   reg			   NOT_DA2;
   reg			   NOT_DA3;
   reg			   NOT_DA4;
   reg			   NOT_DA5;
   reg			   NOT_DA6;
   reg			   NOT_DA7;
   reg			   NOT_DA8;
   reg			   NOT_DA9;
   reg			   NOT_DA10;
   reg			   NOT_DA11;
   reg			   NOT_DA12;
   reg			   NOT_DA13;
   reg			   NOT_DA14;
   reg			   NOT_DA15;
   reg			   NOT_DA16;
   reg			   NOT_DA17;
   reg			   NOT_DA18;
   reg			   NOT_DA19;
   reg			   NOT_DA20;
   reg			   NOT_DA21;
   reg			   NOT_DA22;
   reg			   NOT_DA23;
   reg			   NOT_DA24;
   reg			   NOT_DA25;
   reg			   NOT_DA26;
   reg			   NOT_DA27;
   reg			   NOT_DA28;
   reg			   NOT_DA29;
   reg			   NOT_DA30;
   reg			   NOT_DA31;
   reg			   NOT_DA32;
   reg			   NOT_DA33;
   reg			   NOT_DA34;
   reg			   NOT_DA35;
   reg			   NOT_DA36;
   reg			   NOT_DA37;
   reg			   NOT_DA38;
   reg			   NOT_DA39;
   reg			   NOT_DA40;
   reg			   NOT_DA41;
   reg			   NOT_DA42;
   reg			   NOT_DA43;
   reg			   NOT_DA44;
   reg			   NOT_DA45;
   reg			   NOT_DA46;
   reg			   NOT_DA47;
   reg			   NOT_DA48;
   reg			   NOT_DA49;
   reg			   NOT_DA50;
   reg			   NOT_DA51;
   reg [BITS-1:0]	   NOT_DA;
   reg			   NOT_CLKA_PER;
   reg			   NOT_CLKA_MINH;
   reg			   NOT_CLKA_MINL;
   reg			   NOT_CENB;
   reg			   NOT_WENB;

   reg			   NOT_AB0;
   reg			   NOT_AB1;
   reg			   NOT_AB2;
   reg			   NOT_AB3;
   reg			   NOT_AB4;
   reg			   NOT_AB5;
   reg			   NOT_AB6;
   reg			   NOT_AB7;
   reg [addr_width-1:0]	   NOT_AB;
   reg			   NOT_DB0;
   reg			   NOT_DB1;
   reg			   NOT_DB2;
   reg			   NOT_DB3;
   reg			   NOT_DB4;
   reg			   NOT_DB5;
   reg			   NOT_DB6;
   reg			   NOT_DB7;
   reg			   NOT_DB8;
   reg			   NOT_DB9;
   reg			   NOT_DB10;
   reg			   NOT_DB11;
   reg			   NOT_DB12;
   reg			   NOT_DB13;
   reg			   NOT_DB14;
   reg			   NOT_DB15;
   reg			   NOT_DB16;
   reg			   NOT_DB17;
   reg			   NOT_DB18;
   reg			   NOT_DB19;
   reg			   NOT_DB20;
   reg			   NOT_DB21;
   reg			   NOT_DB22;
   reg			   NOT_DB23;
   reg			   NOT_DB24;
   reg			   NOT_DB25;
   reg			   NOT_DB26;
   reg			   NOT_DB27;
   reg			   NOT_DB28;
   reg			   NOT_DB29;
   reg			   NOT_DB30;
   reg			   NOT_DB31;
   reg			   NOT_DB32;
   reg			   NOT_DB33;
   reg			   NOT_DB34;
   reg			   NOT_DB35;
   reg			   NOT_DB36;
   reg			   NOT_DB37;
   reg			   NOT_DB38;
   reg			   NOT_DB39;
   reg			   NOT_DB40;
   reg			   NOT_DB41;
   reg			   NOT_DB42;
   reg			   NOT_DB43;
   reg			   NOT_DB44;
   reg			   NOT_DB45;
   reg			   NOT_DB46;
   reg			   NOT_DB47;
   reg			   NOT_DB48;
   reg			   NOT_DB49;
   reg			   NOT_DB50;
   reg			   NOT_DB51;
   reg [BITS-1:0]	   NOT_DB;
   reg			   NOT_CLKB_PER;
   reg			   NOT_CLKB_MINH;
   reg			   NOT_CLKB_MINL;

   reg			   LAST_NOT_CENA;
   reg			   LAST_NOT_WENA;
   reg [addr_width-1:0]	   LAST_NOT_AA;
   reg [BITS-1:0]	   LAST_NOT_DA;
   reg			   LAST_NOT_CLKA_PER;
   reg			   LAST_NOT_CLKA_MINH;
   reg			   LAST_NOT_CLKA_MINL;
   reg			   LAST_NOT_CENB;
   reg			   LAST_NOT_WENB;
   reg [addr_width-1:0]	   LAST_NOT_AB;
   reg [BITS-1:0]	   LAST_NOT_DB;
   reg			   LAST_NOT_CLKB_PER;
   reg			   LAST_NOT_CLKB_MINH;
   reg			   LAST_NOT_CLKB_MINL;

   reg                     LAST_NOT_CONTA;
   reg                     LAST_NOT_CONTB;
   wire                    contA_flag;
   wire                    contB_flag;
   wire                    cont_flag;

   wire [BITS-1:0]   _QA;
   wire			   _OENAi;
   wire [addr_width-1:0]   _AA;
   wire			   _CLKA;
   wire			   _CENA;
   wire			   _OENA;
   wire                    _WENA;

   wire [BITS-1:0]   _DA;
   wire                    re_flagA;
   wire                    re_data_flagA;

   wire [BITS-1:0]   _QB;
   wire			   _OENBi;
   wire [addr_width-1:0]   _AB;
   wire			   _CLKB;
   wire			   _CENB;
   wire			   _OENB;
   wire                    _WENB;

   wire [BITS-1:0]   _DB;
   wire                    re_flagB;
   wire                    re_data_flagB;


   reg			   LATCHED_CENA;
   reg	                  LATCHED_WENA;
   reg [addr_width-1:0]	   LATCHED_AA;
   reg [BITS-1:0]	   LATCHED_DA;
   reg			   LATCHED_CENB;
   reg	                  LATCHED_WENB;
   reg [addr_width-1:0]	   LATCHED_AB;
   reg [BITS-1:0]	   LATCHED_DB;

   reg			   CENAi;
   reg           	   WENAi;
   reg [addr_width-1:0]	   AAi;
   reg [BITS-1:0]	   DAi;
   reg [BITS-1:0]	   QAi;
   reg [BITS-1:0]	   LAST_QAi;
   reg			   CENBi;
   reg           	   WENBi;
   reg [addr_width-1:0]	   ABi;
   reg [BITS-1:0]	   DBi;
   reg [BITS-1:0]	   QBi;
   reg [BITS-1:0]	   LAST_QBi;



   reg			   LAST_CLKA;
   reg			   LAST_CLKB;



   reg                     valid_cycleA;
   reg                     valid_cycleB;


   task update_Anotifier_buses;
   begin
      NOT_AA = {
               NOT_AA7,
               NOT_AA6,
               NOT_AA5,
               NOT_AA4,
               NOT_AA3,
               NOT_AA2,
               NOT_AA1,
               NOT_AA0};
      NOT_DA = {
               NOT_DA51,
               NOT_DA50,
               NOT_DA49,
               NOT_DA48,
               NOT_DA47,
               NOT_DA46,
               NOT_DA45,
               NOT_DA44,
               NOT_DA43,
               NOT_DA42,
               NOT_DA41,
               NOT_DA40,
               NOT_DA39,
               NOT_DA38,
               NOT_DA37,
               NOT_DA36,
               NOT_DA35,
               NOT_DA34,
               NOT_DA33,
               NOT_DA32,
               NOT_DA31,
               NOT_DA30,
               NOT_DA29,
               NOT_DA28,
               NOT_DA27,
               NOT_DA26,
               NOT_DA25,
               NOT_DA24,
               NOT_DA23,
               NOT_DA22,
               NOT_DA21,
               NOT_DA20,
               NOT_DA19,
               NOT_DA18,
               NOT_DA17,
               NOT_DA16,
               NOT_DA15,
               NOT_DA14,
               NOT_DA13,
               NOT_DA12,
               NOT_DA11,
               NOT_DA10,
               NOT_DA9,
               NOT_DA8,
               NOT_DA7,
               NOT_DA6,
               NOT_DA5,
               NOT_DA4,
               NOT_DA3,
               NOT_DA2,
               NOT_DA1,
               NOT_DA0};
   end
   endtask
   task update_Bnotifier_buses;
   begin
      NOT_AB = {
               NOT_AB7,
               NOT_AB6,
               NOT_AB5,
               NOT_AB4,
               NOT_AB3,
               NOT_AB2,
               NOT_AB1,
               NOT_AB0};
      NOT_DB = {
               NOT_DB51,
               NOT_DB50,
               NOT_DB49,
               NOT_DB48,
               NOT_DB47,
               NOT_DB46,
               NOT_DB45,
               NOT_DB44,
               NOT_DB43,
               NOT_DB42,
               NOT_DB41,
               NOT_DB40,
               NOT_DB39,
               NOT_DB38,
               NOT_DB37,
               NOT_DB36,
               NOT_DB35,
               NOT_DB34,
               NOT_DB33,
               NOT_DB32,
               NOT_DB31,
               NOT_DB30,
               NOT_DB29,
               NOT_DB28,
               NOT_DB27,
               NOT_DB26,
               NOT_DB25,
               NOT_DB24,
               NOT_DB23,
               NOT_DB22,
               NOT_DB21,
               NOT_DB20,
               NOT_DB19,
               NOT_DB18,
               NOT_DB17,
               NOT_DB16,
               NOT_DB15,
               NOT_DB14,
               NOT_DB13,
               NOT_DB12,
               NOT_DB11,
               NOT_DB10,
               NOT_DB9,
               NOT_DB8,
               NOT_DB7,
               NOT_DB6,
               NOT_DB5,
               NOT_DB4,
               NOT_DB3,
               NOT_DB2,
               NOT_DB1,
               NOT_DB0};
   end
   endtask

   task mem_cycleA;
   begin
      valid_cycleA = 1'bx;
      casez({WENAi,CENAi})

	2'b10: begin
	   valid_cycleA = 1;
	   read_memA(1,0);
	end
	2'b00: begin
	   valid_cycleA = 0;
	   write_mem(AAi,DAi);
	   read_memA(0,0);
	end
	2'b?1: ;
	2'b1x: begin
	   valid_cycleA = 1;
	   read_memA(0,1);
	end
	2'bx0: begin
	   valid_cycleA = 0;
	   write_mem_x(AAi);
	   read_memA(0,1);
	end
	2'b0x,
	2'bxx: begin
	   valid_cycleA = 0;
	   write_mem_x(AAi);
	   read_memA(0,1);
	end
      endcase
   end
   endtask
   task mem_cycleB;
   begin
      valid_cycleB = 1'bx;
      casez({WENBi,CENBi})

	2'b10: begin
	   valid_cycleB = 1;
	   read_memB(1,0);
	end
	2'b00: begin
	   valid_cycleB = 0;
	   write_mem(ABi,DBi);
	   read_memB(0,0);
	end
	2'b?1: ;
	2'b1x: begin
	   valid_cycleB = 1;
	   read_memB(0,1);
	end
	2'bx0: begin
	   valid_cycleB = 0;
	   write_mem_x(ABi);
	   read_memB(0,1);
	end
	2'b0x,
	2'bxx: begin
	   valid_cycleB = 0;
	   write_mem_x(ABi);
	   read_memB(0,1);
	end
      endcase
   end
   endtask
      
   task contentionA;
   begin
      casez({valid_cycleB,WENAi})
	2'bx?: ;
	2'b00,
	2'b0x:begin
           write_mem_x(AAi);
	end
	2'b10,
	2'b1x:begin
	   read_memB(0,1);
	end
	2'b01:begin
	   read_memA(0,1);
	end
	2'b11: ;
      endcase
   end
   endtask

   task contentionB;
   begin
      casez({valid_cycleA,WENBi})
	2'bx?: ;
	2'b00,
	2'b0x:begin
	   write_mem_x(ABi);
	end
	2'b10,
	2'b1x:begin
	   read_memA(0,1);
	end
	2'b01:begin
	   read_memB(0,1);
	end
	2'b11: ;
      endcase
   end
   endtask

   task update_Alast_notifiers;
   begin
      LAST_NOT_AA = NOT_AA;
      LAST_NOT_DA = NOT_DA;
      LAST_NOT_WENA = NOT_WENA;
      LAST_NOT_CENA = NOT_CENA;
      LAST_NOT_CLKA_PER = NOT_CLKA_PER;
      LAST_NOT_CLKA_MINH = NOT_CLKA_MINH;
      LAST_NOT_CLKA_MINL = NOT_CLKA_MINL;
      LAST_NOT_CONTA = NOT_CONTA;
   end
   endtask
   task update_Blast_notifiers;
   begin
      LAST_NOT_AB = NOT_AB;
      LAST_NOT_DB = NOT_DB;
      LAST_NOT_WENB = NOT_WENB;
      LAST_NOT_CENB = NOT_CENB;
      LAST_NOT_CLKB_PER = NOT_CLKB_PER;
      LAST_NOT_CLKB_MINH = NOT_CLKB_MINH;
      LAST_NOT_CLKB_MINL = NOT_CLKB_MINL;
      LAST_NOT_CONTB = NOT_CONTB;
   end
   endtask

   task latch_Ainputs;
   begin
      LATCHED_AA = _AA ;
      LATCHED_DA = _DA ;
      LATCHED_WENA = _WENA ;
      LATCHED_CENA = _CENA ;
      LAST_QAi = QAi;
   end
   endtask
   task latch_Binputs;
   begin
      LATCHED_AB = _AB ;
      LATCHED_DB = _DB ;
      LATCHED_WENB = _WENB ;
      LATCHED_CENB = _CENB ;
      LAST_QBi = QBi;
   end
   endtask


   task update_Alogic;
   begin
      CENAi = LATCHED_CENA;
      WENAi = LATCHED_WENA;
      AAi = LATCHED_AA;
      DAi = LATCHED_DA;
   end
   endtask
   task update_Blogic;
   begin
      CENBi = LATCHED_CENB;
      WENBi = LATCHED_WENB;
      ABi = LATCHED_AB;
      DBi = LATCHED_DB;
   end
   endtask



   task x_Ainputs;
      integer n;
   begin
      for (n=0; n<addr_width; n=n+1)
	 begin
	    LATCHED_AA[n] = (NOT_AA[n]!==LAST_NOT_AA[n]) ? 1'bx : LATCHED_AA[n] ;
	 end
      for (n=0; n<BITS; n=n+1)
	 begin
	    LATCHED_DA[n] = (NOT_DA[n]!==LAST_NOT_DA[n]) ? 1'bx : LATCHED_DA[n] ;
	 end
      LATCHED_WENA = (NOT_WENA!==LAST_NOT_WENA) ? 1'bx : LATCHED_WENA ;

      LATCHED_CENA = (NOT_CENA!==LAST_NOT_CENA) ? 1'bx : LATCHED_CENA ;
   end
   endtask
   task x_Binputs;
      integer n;
   begin
      for (n=0; n<addr_width; n=n+1)
	 begin
	    LATCHED_AB[n] = (NOT_AB[n]!==LAST_NOT_AB[n]) ? 1'bx : LATCHED_AB[n] ;
	 end
      for (n=0; n<BITS; n=n+1)
	 begin
	    LATCHED_DB[n] = (NOT_DB[n]!==LAST_NOT_DB[n]) ? 1'bx : LATCHED_DB[n] ;
	 end
      LATCHED_WENB = (NOT_WENB!==LAST_NOT_WENB) ? 1'bx : LATCHED_WENB ;

      LATCHED_CENB = (NOT_CENB!==LAST_NOT_CENB) ? 1'bx : LATCHED_CENB ;
   end
   endtask

   task read_memA;
      input r_wb;
      input xflag;
   begin
      if (r_wb)
	 begin
	    if (valid_address(AAi))
	       begin
                     QAi=mem[AAi];
	       end
	    else
	       begin
		  QAi=wordx;
	       end
	 end
      else
	 begin
	    if (xflag)
	       begin
		  QAi=wordx;
	       end
	    else
	       begin
	          QAi=DAi;
	       end
	 end
   end
   endtask
   task read_memB;
      input r_wb;
      input xflag;
   begin
      if (r_wb)
	 begin
	    if (valid_address(ABi))
	       begin
                     QBi=mem[ABi];
	       end
	    else
	       begin
		  QBi=wordx;
	       end
	 end
      else
	 begin
	    if (xflag)
	       begin
		  QBi=wordx;
	       end
	    else
	       begin
	          QBi=DBi;
	       end
	 end
   end
   endtask

   task write_mem;
      input [addr_width-1:0] a;
      input [BITS-1:0] d;
 
   begin
      casez({valid_address(a)})
	1'b0: 
		x_mem;
	1'b1: mem[a]=d;
      endcase
   end
   endtask

   task write_mem_x;
      input [addr_width-1:0] a;
   begin
      casez({valid_address(a)})
	1'b0: 
		x_mem;
	1'b1: mem[a]=wordx;
      endcase
   end
   endtask

   task x_mem;
      integer n;
   begin
      for (n=0; n<word_depth; n=n+1)
	 mem[n]=wordx;
   end
   endtask

   task process_violationsA;
   begin
      if ((NOT_CLKA_PER!==LAST_NOT_CLKA_PER) ||
	  (NOT_CLKA_MINH!==LAST_NOT_CLKA_MINH) ||
	  (NOT_CLKA_MINL!==LAST_NOT_CLKA_MINL))
	 begin
	    if (CENAi !== 1'b1)
               begin
		  x_mem;
		  read_memA(0,1);
	       end
	 end
      else
	 begin
	    update_Anotifier_buses;
	    x_Ainputs;
	    update_Alogic;
            if (NOT_CONTA!==LAST_NOT_CONTA)
               begin
		  contentionA;
               end
            else
               begin
                  mem_cycleA;
               end
	 end
      update_Alast_notifiers;
   end
   endtask

   task process_violationsB;
   begin
      if ((NOT_CLKB_PER!==LAST_NOT_CLKB_PER) ||
	  (NOT_CLKB_MINH!==LAST_NOT_CLKB_MINH) ||
	  (NOT_CLKB_MINL!==LAST_NOT_CLKB_MINL))
	 begin
	    if (CENBi !== 1'b1)
               begin
		  x_mem;
		  read_memB(0,1);
	       end
	 end
      else
	 begin
	    update_Bnotifier_buses;
	    x_Binputs;
	    update_Blogic;
            if (NOT_CONTB!==LAST_NOT_CONTB)
               begin
		  contentionB;
               end
            else
               begin
                  mem_cycleB;
               end
	 end
      update_Blast_notifiers;
   end
   endtask

   function valid_address;
      input [addr_width-1:0] a;
   begin
      valid_address = (^(a) !== 1'bx);
   end
   endfunction


   bufif0 (QA[0], _QA[0], _OENAi);
   bufif0 (QA[1], _QA[1], _OENAi);
   bufif0 (QA[2], _QA[2], _OENAi);
   bufif0 (QA[3], _QA[3], _OENAi);
   bufif0 (QA[4], _QA[4], _OENAi);
   bufif0 (QA[5], _QA[5], _OENAi);
   bufif0 (QA[6], _QA[6], _OENAi);
   bufif0 (QA[7], _QA[7], _OENAi);
   bufif0 (QA[8], _QA[8], _OENAi);
   bufif0 (QA[9], _QA[9], _OENAi);
   bufif0 (QA[10], _QA[10], _OENAi);
   bufif0 (QA[11], _QA[11], _OENAi);
   bufif0 (QA[12], _QA[12], _OENAi);
   bufif0 (QA[13], _QA[13], _OENAi);
   bufif0 (QA[14], _QA[14], _OENAi);
   bufif0 (QA[15], _QA[15], _OENAi);
   bufif0 (QA[16], _QA[16], _OENAi);
   bufif0 (QA[17], _QA[17], _OENAi);
   bufif0 (QA[18], _QA[18], _OENAi);
   bufif0 (QA[19], _QA[19], _OENAi);
   bufif0 (QA[20], _QA[20], _OENAi);
   bufif0 (QA[21], _QA[21], _OENAi);
   bufif0 (QA[22], _QA[22], _OENAi);
   bufif0 (QA[23], _QA[23], _OENAi);
   bufif0 (QA[24], _QA[24], _OENAi);
   bufif0 (QA[25], _QA[25], _OENAi);
   bufif0 (QA[26], _QA[26], _OENAi);
   bufif0 (QA[27], _QA[27], _OENAi);
   bufif0 (QA[28], _QA[28], _OENAi);
   bufif0 (QA[29], _QA[29], _OENAi);
   bufif0 (QA[30], _QA[30], _OENAi);
   bufif0 (QA[31], _QA[31], _OENAi);
   bufif0 (QA[32], _QA[32], _OENAi);
   bufif0 (QA[33], _QA[33], _OENAi);
   bufif0 (QA[34], _QA[34], _OENAi);
   bufif0 (QA[35], _QA[35], _OENAi);
   bufif0 (QA[36], _QA[36], _OENAi);
   bufif0 (QA[37], _QA[37], _OENAi);
   bufif0 (QA[38], _QA[38], _OENAi);
   bufif0 (QA[39], _QA[39], _OENAi);
   bufif0 (QA[40], _QA[40], _OENAi);
   bufif0 (QA[41], _QA[41], _OENAi);
   bufif0 (QA[42], _QA[42], _OENAi);
   bufif0 (QA[43], _QA[43], _OENAi);
   bufif0 (QA[44], _QA[44], _OENAi);
   bufif0 (QA[45], _QA[45], _OENAi);
   bufif0 (QA[46], _QA[46], _OENAi);
   bufif0 (QA[47], _QA[47], _OENAi);
   bufif0 (QA[48], _QA[48], _OENAi);
   bufif0 (QA[49], _QA[49], _OENAi);
   bufif0 (QA[50], _QA[50], _OENAi);
   bufif0 (QA[51], _QA[51], _OENAi);
   buf (_DA[0], DA[0]);
   buf (_DA[1], DA[1]);
   buf (_DA[2], DA[2]);
   buf (_DA[3], DA[3]);
   buf (_DA[4], DA[4]);
   buf (_DA[5], DA[5]);
   buf (_DA[6], DA[6]);
   buf (_DA[7], DA[7]);
   buf (_DA[8], DA[8]);
   buf (_DA[9], DA[9]);
   buf (_DA[10], DA[10]);
   buf (_DA[11], DA[11]);
   buf (_DA[12], DA[12]);
   buf (_DA[13], DA[13]);
   buf (_DA[14], DA[14]);
   buf (_DA[15], DA[15]);
   buf (_DA[16], DA[16]);
   buf (_DA[17], DA[17]);
   buf (_DA[18], DA[18]);
   buf (_DA[19], DA[19]);
   buf (_DA[20], DA[20]);
   buf (_DA[21], DA[21]);
   buf (_DA[22], DA[22]);
   buf (_DA[23], DA[23]);
   buf (_DA[24], DA[24]);
   buf (_DA[25], DA[25]);
   buf (_DA[26], DA[26]);
   buf (_DA[27], DA[27]);
   buf (_DA[28], DA[28]);
   buf (_DA[29], DA[29]);
   buf (_DA[30], DA[30]);
   buf (_DA[31], DA[31]);
   buf (_DA[32], DA[32]);
   buf (_DA[33], DA[33]);
   buf (_DA[34], DA[34]);
   buf (_DA[35], DA[35]);
   buf (_DA[36], DA[36]);
   buf (_DA[37], DA[37]);
   buf (_DA[38], DA[38]);
   buf (_DA[39], DA[39]);
   buf (_DA[40], DA[40]);
   buf (_DA[41], DA[41]);
   buf (_DA[42], DA[42]);
   buf (_DA[43], DA[43]);
   buf (_DA[44], DA[44]);
   buf (_DA[45], DA[45]);
   buf (_DA[46], DA[46]);
   buf (_DA[47], DA[47]);
   buf (_DA[48], DA[48]);
   buf (_DA[49], DA[49]);
   buf (_DA[50], DA[50]);
   buf (_DA[51], DA[51]);
   buf (_AA[0], AA[0]);
   buf (_AA[1], AA[1]);
   buf (_AA[2], AA[2]);
   buf (_AA[3], AA[3]);
   buf (_AA[4], AA[4]);
   buf (_AA[5], AA[5]);
   buf (_AA[6], AA[6]);
   buf (_AA[7], AA[7]);
   buf (_CLKA, CLKA);
   buf (_WENA, WENA);
   buf (_OENA, OENA);
   buf (_CENA, CENA);
   bufif0 (QB[0], _QB[0], _OENBi);
   bufif0 (QB[1], _QB[1], _OENBi);
   bufif0 (QB[2], _QB[2], _OENBi);
   bufif0 (QB[3], _QB[3], _OENBi);
   bufif0 (QB[4], _QB[4], _OENBi);
   bufif0 (QB[5], _QB[5], _OENBi);
   bufif0 (QB[6], _QB[6], _OENBi);
   bufif0 (QB[7], _QB[7], _OENBi);
   bufif0 (QB[8], _QB[8], _OENBi);
   bufif0 (QB[9], _QB[9], _OENBi);
   bufif0 (QB[10], _QB[10], _OENBi);
   bufif0 (QB[11], _QB[11], _OENBi);
   bufif0 (QB[12], _QB[12], _OENBi);
   bufif0 (QB[13], _QB[13], _OENBi);
   bufif0 (QB[14], _QB[14], _OENBi);
   bufif0 (QB[15], _QB[15], _OENBi);
   bufif0 (QB[16], _QB[16], _OENBi);
   bufif0 (QB[17], _QB[17], _OENBi);
   bufif0 (QB[18], _QB[18], _OENBi);
   bufif0 (QB[19], _QB[19], _OENBi);
   bufif0 (QB[20], _QB[20], _OENBi);
   bufif0 (QB[21], _QB[21], _OENBi);
   bufif0 (QB[22], _QB[22], _OENBi);
   bufif0 (QB[23], _QB[23], _OENBi);
   bufif0 (QB[24], _QB[24], _OENBi);
   bufif0 (QB[25], _QB[25], _OENBi);
   bufif0 (QB[26], _QB[26], _OENBi);
   bufif0 (QB[27], _QB[27], _OENBi);
   bufif0 (QB[28], _QB[28], _OENBi);
   bufif0 (QB[29], _QB[29], _OENBi);
   bufif0 (QB[30], _QB[30], _OENBi);
   bufif0 (QB[31], _QB[31], _OENBi);
   bufif0 (QB[32], _QB[32], _OENBi);
   bufif0 (QB[33], _QB[33], _OENBi);
   bufif0 (QB[34], _QB[34], _OENBi);
   bufif0 (QB[35], _QB[35], _OENBi);
   bufif0 (QB[36], _QB[36], _OENBi);
   bufif0 (QB[37], _QB[37], _OENBi);
   bufif0 (QB[38], _QB[38], _OENBi);
   bufif0 (QB[39], _QB[39], _OENBi);
   bufif0 (QB[40], _QB[40], _OENBi);
   bufif0 (QB[41], _QB[41], _OENBi);
   bufif0 (QB[42], _QB[42], _OENBi);
   bufif0 (QB[43], _QB[43], _OENBi);
   bufif0 (QB[44], _QB[44], _OENBi);
   bufif0 (QB[45], _QB[45], _OENBi);
   bufif0 (QB[46], _QB[46], _OENBi);
   bufif0 (QB[47], _QB[47], _OENBi);
   bufif0 (QB[48], _QB[48], _OENBi);
   bufif0 (QB[49], _QB[49], _OENBi);
   bufif0 (QB[50], _QB[50], _OENBi);
   bufif0 (QB[51], _QB[51], _OENBi);
   buf (_DB[0], DB[0]);
   buf (_DB[1], DB[1]);
   buf (_DB[2], DB[2]);
   buf (_DB[3], DB[3]);
   buf (_DB[4], DB[4]);
   buf (_DB[5], DB[5]);
   buf (_DB[6], DB[6]);
   buf (_DB[7], DB[7]);
   buf (_DB[8], DB[8]);
   buf (_DB[9], DB[9]);
   buf (_DB[10], DB[10]);
   buf (_DB[11], DB[11]);
   buf (_DB[12], DB[12]);
   buf (_DB[13], DB[13]);
   buf (_DB[14], DB[14]);
   buf (_DB[15], DB[15]);
   buf (_DB[16], DB[16]);
   buf (_DB[17], DB[17]);
   buf (_DB[18], DB[18]);
   buf (_DB[19], DB[19]);
   buf (_DB[20], DB[20]);
   buf (_DB[21], DB[21]);
   buf (_DB[22], DB[22]);
   buf (_DB[23], DB[23]);
   buf (_DB[24], DB[24]);
   buf (_DB[25], DB[25]);
   buf (_DB[26], DB[26]);
   buf (_DB[27], DB[27]);
   buf (_DB[28], DB[28]);
   buf (_DB[29], DB[29]);
   buf (_DB[30], DB[30]);
   buf (_DB[31], DB[31]);
   buf (_DB[32], DB[32]);
   buf (_DB[33], DB[33]);
   buf (_DB[34], DB[34]);
   buf (_DB[35], DB[35]);
   buf (_DB[36], DB[36]);
   buf (_DB[37], DB[37]);
   buf (_DB[38], DB[38]);
   buf (_DB[39], DB[39]);
   buf (_DB[40], DB[40]);
   buf (_DB[41], DB[41]);
   buf (_DB[42], DB[42]);
   buf (_DB[43], DB[43]);
   buf (_DB[44], DB[44]);
   buf (_DB[45], DB[45]);
   buf (_DB[46], DB[46]);
   buf (_DB[47], DB[47]);
   buf (_DB[48], DB[48]);
   buf (_DB[49], DB[49]);
   buf (_DB[50], DB[50]);
   buf (_DB[51], DB[51]);
   buf (_AB[0], AB[0]);
   buf (_AB[1], AB[1]);
   buf (_AB[2], AB[2]);
   buf (_AB[3], AB[3]);
   buf (_AB[4], AB[4]);
   buf (_AB[5], AB[5]);
   buf (_AB[6], AB[6]);
   buf (_AB[7], AB[7]);
   buf (_CLKB, CLKB);
   buf (_WENB, WENB);
   buf (_OENB, OENB);
   buf (_CENB, CENB);


   assign _OENAi = _OENA;
   assign _QA = QAi;
   assign re_flagA = !(_CENA);
   assign re_data_flagA = !(_CENA || _WENA);
   assign _OENBi = _OENB;
   assign _QB = QBi;
   assign re_flagB = !(_CENB);
   assign re_data_flagB = !(_CENB || _WENB);

   assign contA_flag = 
      (_AA === ABi) && 
      !((_WENA === 1'b1) && (WENBi === 1'b1)) &&
      (_CENA !== 1'b1) &&
      (CENBi !== 1'b1);
   
   assign contB_flag = 
      (_AB === AAi) && 
      !((_WENB === 1'b1) && (WENAi === 1'b1)) &&
      (_CENB !== 1'b1) &&
      (CENAi !== 1'b1);

   assign cont_flag = 
      (_AB === _AA) && 
      !((_WENB === 1'b1) && (_WENA === 1'b1)) &&
      (_CENB !== 1'b1) &&
      (_CENA !== 1'b1);

   always @(
	    NOT_AA0 or
	    NOT_AA1 or
	    NOT_AA2 or
	    NOT_AA3 or
	    NOT_AA4 or
	    NOT_AA5 or
	    NOT_AA6 or
	    NOT_AA7 or
	    NOT_DA0 or
	    NOT_DA1 or
	    NOT_DA2 or
	    NOT_DA3 or
	    NOT_DA4 or
	    NOT_DA5 or
	    NOT_DA6 or
	    NOT_DA7 or
	    NOT_DA8 or
	    NOT_DA9 or
	    NOT_DA10 or
	    NOT_DA11 or
	    NOT_DA12 or
	    NOT_DA13 or
	    NOT_DA14 or
	    NOT_DA15 or
	    NOT_DA16 or
	    NOT_DA17 or
	    NOT_DA18 or
	    NOT_DA19 or
	    NOT_DA20 or
	    NOT_DA21 or
	    NOT_DA22 or
	    NOT_DA23 or
	    NOT_DA24 or
	    NOT_DA25 or
	    NOT_DA26 or
	    NOT_DA27 or
	    NOT_DA28 or
	    NOT_DA29 or
	    NOT_DA30 or
	    NOT_DA31 or
	    NOT_DA32 or
	    NOT_DA33 or
	    NOT_DA34 or
	    NOT_DA35 or
	    NOT_DA36 or
	    NOT_DA37 or
	    NOT_DA38 or
	    NOT_DA39 or
	    NOT_DA40 or
	    NOT_DA41 or
	    NOT_DA42 or
	    NOT_DA43 or
	    NOT_DA44 or
	    NOT_DA45 or
	    NOT_DA46 or
	    NOT_DA47 or
	    NOT_DA48 or
	    NOT_DA49 or
	    NOT_DA50 or
	    NOT_DA51 or
	    NOT_WENA or
	    NOT_CENA or
            NOT_CONTA or
	    NOT_CLKA_PER or
	    NOT_CLKA_MINH or
	    NOT_CLKA_MINL
	    )
      begin
         process_violationsA;
      end
   always @(
	    NOT_AB0 or
	    NOT_AB1 or
	    NOT_AB2 or
	    NOT_AB3 or
	    NOT_AB4 or
	    NOT_AB5 or
	    NOT_AB6 or
	    NOT_AB7 or
	    NOT_DB0 or
	    NOT_DB1 or
	    NOT_DB2 or
	    NOT_DB3 or
	    NOT_DB4 or
	    NOT_DB5 or
	    NOT_DB6 or
	    NOT_DB7 or
	    NOT_DB8 or
	    NOT_DB9 or
	    NOT_DB10 or
	    NOT_DB11 or
	    NOT_DB12 or
	    NOT_DB13 or
	    NOT_DB14 or
	    NOT_DB15 or
	    NOT_DB16 or
	    NOT_DB17 or
	    NOT_DB18 or
	    NOT_DB19 or
	    NOT_DB20 or
	    NOT_DB21 or
	    NOT_DB22 or
	    NOT_DB23 or
	    NOT_DB24 or
	    NOT_DB25 or
	    NOT_DB26 or
	    NOT_DB27 or
	    NOT_DB28 or
	    NOT_DB29 or
	    NOT_DB30 or
	    NOT_DB31 or
	    NOT_DB32 or
	    NOT_DB33 or
	    NOT_DB34 or
	    NOT_DB35 or
	    NOT_DB36 or
	    NOT_DB37 or
	    NOT_DB38 or
	    NOT_DB39 or
	    NOT_DB40 or
	    NOT_DB41 or
	    NOT_DB42 or
	    NOT_DB43 or
	    NOT_DB44 or
	    NOT_DB45 or
	    NOT_DB46 or
	    NOT_DB47 or
	    NOT_DB48 or
	    NOT_DB49 or
	    NOT_DB50 or
	    NOT_DB51 or
	    NOT_WENB or
	    NOT_CENB or
            NOT_CONTB or
	    NOT_CLKB_PER or
	    NOT_CLKB_MINH or
	    NOT_CLKB_MINL
	    )
      begin
         process_violationsB;
      end

   always @( _CLKA )
      begin
         casez({LAST_CLKA,_CLKA})
	   2'b01: begin
	      latch_Ainputs;
	      update_Alogic;
	      mem_cycleA;
	   end

	   2'b10,
	   2'bx?,
	   2'b00,
	   2'b11: ;

	   2'b?x: begin
	      x_mem;
              read_memA(0,1);
	   end
	   
	 endcase
	 LAST_CLKA = _CLKA;
      end
   always @( _CLKB )
      begin
         casez({LAST_CLKB,_CLKB})
	   2'b01: begin
	      latch_Binputs;
	      update_Blogic;
	      mem_cycleB;
	   end

	   2'b10,
	   2'bx?,
	   2'b00,
	   2'b11: ;

	   2'b?x: begin
	      x_mem;
              read_memB(0,1);
	   end
	   
	 endcase
	 LAST_CLKB = _CLKB;
      end

   specify
      $setuphold(posedge CLKA, posedge CENA, 1.000, 0.500, NOT_CENA);
      $setuphold(posedge CLKA, negedge CENA, 1.000, 0.500, NOT_CENA);
      $setuphold(posedge CLKA &&& re_flagA, posedge WENA, 1.000, 0.500, NOT_WENA);
      $setuphold(posedge CLKA &&& re_flagA, negedge WENA, 1.000, 0.500, NOT_WENA);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[0], 1.000, 0.500, NOT_AA0);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[0], 1.000, 0.500, NOT_AA0);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[1], 1.000, 0.500, NOT_AA1);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[1], 1.000, 0.500, NOT_AA1);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[2], 1.000, 0.500, NOT_AA2);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[2], 1.000, 0.500, NOT_AA2);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[3], 1.000, 0.500, NOT_AA3);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[3], 1.000, 0.500, NOT_AA3);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[4], 1.000, 0.500, NOT_AA4);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[4], 1.000, 0.500, NOT_AA4);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[5], 1.000, 0.500, NOT_AA5);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[5], 1.000, 0.500, NOT_AA5);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[6], 1.000, 0.500, NOT_AA6);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[6], 1.000, 0.500, NOT_AA6);
      $setuphold(posedge CLKA &&& re_flagA, posedge AA[7], 1.000, 0.500, NOT_AA7);
      $setuphold(posedge CLKA &&& re_flagA, negedge AA[7], 1.000, 0.500, NOT_AA7);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[0], 1.000, 0.500, NOT_DA0);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[0], 1.000, 0.500, NOT_DA0);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[1], 1.000, 0.500, NOT_DA1);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[1], 1.000, 0.500, NOT_DA1);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[2], 1.000, 0.500, NOT_DA2);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[2], 1.000, 0.500, NOT_DA2);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[3], 1.000, 0.500, NOT_DA3);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[3], 1.000, 0.500, NOT_DA3);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[4], 1.000, 0.500, NOT_DA4);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[4], 1.000, 0.500, NOT_DA4);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[5], 1.000, 0.500, NOT_DA5);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[5], 1.000, 0.500, NOT_DA5);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[6], 1.000, 0.500, NOT_DA6);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[6], 1.000, 0.500, NOT_DA6);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[7], 1.000, 0.500, NOT_DA7);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[7], 1.000, 0.500, NOT_DA7);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[8], 1.000, 0.500, NOT_DA8);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[8], 1.000, 0.500, NOT_DA8);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[9], 1.000, 0.500, NOT_DA9);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[9], 1.000, 0.500, NOT_DA9);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[10], 1.000, 0.500, NOT_DA10);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[10], 1.000, 0.500, NOT_DA10);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[11], 1.000, 0.500, NOT_DA11);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[11], 1.000, 0.500, NOT_DA11);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[12], 1.000, 0.500, NOT_DA12);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[12], 1.000, 0.500, NOT_DA12);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[13], 1.000, 0.500, NOT_DA13);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[13], 1.000, 0.500, NOT_DA13);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[14], 1.000, 0.500, NOT_DA14);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[14], 1.000, 0.500, NOT_DA14);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[15], 1.000, 0.500, NOT_DA15);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[15], 1.000, 0.500, NOT_DA15);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[16], 1.000, 0.500, NOT_DA16);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[16], 1.000, 0.500, NOT_DA16);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[17], 1.000, 0.500, NOT_DA17);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[17], 1.000, 0.500, NOT_DA17);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[18], 1.000, 0.500, NOT_DA18);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[18], 1.000, 0.500, NOT_DA18);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[19], 1.000, 0.500, NOT_DA19);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[19], 1.000, 0.500, NOT_DA19);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[20], 1.000, 0.500, NOT_DA20);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[20], 1.000, 0.500, NOT_DA20);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[21], 1.000, 0.500, NOT_DA21);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[21], 1.000, 0.500, NOT_DA21);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[22], 1.000, 0.500, NOT_DA22);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[22], 1.000, 0.500, NOT_DA22);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[23], 1.000, 0.500, NOT_DA23);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[23], 1.000, 0.500, NOT_DA23);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[24], 1.000, 0.500, NOT_DA24);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[24], 1.000, 0.500, NOT_DA24);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[25], 1.000, 0.500, NOT_DA25);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[25], 1.000, 0.500, NOT_DA25);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[26], 1.000, 0.500, NOT_DA26);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[26], 1.000, 0.500, NOT_DA26);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[27], 1.000, 0.500, NOT_DA27);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[27], 1.000, 0.500, NOT_DA27);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[28], 1.000, 0.500, NOT_DA28);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[28], 1.000, 0.500, NOT_DA28);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[29], 1.000, 0.500, NOT_DA29);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[29], 1.000, 0.500, NOT_DA29);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[30], 1.000, 0.500, NOT_DA30);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[30], 1.000, 0.500, NOT_DA30);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[31], 1.000, 0.500, NOT_DA31);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[31], 1.000, 0.500, NOT_DA31);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[32], 1.000, 0.500, NOT_DA32);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[32], 1.000, 0.500, NOT_DA32);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[33], 1.000, 0.500, NOT_DA33);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[33], 1.000, 0.500, NOT_DA33);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[34], 1.000, 0.500, NOT_DA34);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[34], 1.000, 0.500, NOT_DA34);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[35], 1.000, 0.500, NOT_DA35);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[35], 1.000, 0.500, NOT_DA35);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[36], 1.000, 0.500, NOT_DA36);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[36], 1.000, 0.500, NOT_DA36);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[37], 1.000, 0.500, NOT_DA37);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[37], 1.000, 0.500, NOT_DA37);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[38], 1.000, 0.500, NOT_DA38);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[38], 1.000, 0.500, NOT_DA38);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[39], 1.000, 0.500, NOT_DA39);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[39], 1.000, 0.500, NOT_DA39);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[40], 1.000, 0.500, NOT_DA40);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[40], 1.000, 0.500, NOT_DA40);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[41], 1.000, 0.500, NOT_DA41);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[41], 1.000, 0.500, NOT_DA41);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[42], 1.000, 0.500, NOT_DA42);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[42], 1.000, 0.500, NOT_DA42);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[43], 1.000, 0.500, NOT_DA43);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[43], 1.000, 0.500, NOT_DA43);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[44], 1.000, 0.500, NOT_DA44);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[44], 1.000, 0.500, NOT_DA44);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[45], 1.000, 0.500, NOT_DA45);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[45], 1.000, 0.500, NOT_DA45);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[46], 1.000, 0.500, NOT_DA46);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[46], 1.000, 0.500, NOT_DA46);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[47], 1.000, 0.500, NOT_DA47);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[47], 1.000, 0.500, NOT_DA47);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[48], 1.000, 0.500, NOT_DA48);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[48], 1.000, 0.500, NOT_DA48);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[49], 1.000, 0.500, NOT_DA49);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[49], 1.000, 0.500, NOT_DA49);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[50], 1.000, 0.500, NOT_DA50);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[50], 1.000, 0.500, NOT_DA50);
      $setuphold(posedge CLKA &&& re_data_flagA, posedge DA[51], 1.000, 0.500, NOT_DA51);
      $setuphold(posedge CLKA &&& re_data_flagA, negedge DA[51], 1.000, 0.500, NOT_DA51);
      $setuphold(posedge CLKB, posedge CENB, 1.000, 0.500, NOT_CENB);
      $setuphold(posedge CLKB, negedge CENB, 1.000, 0.500, NOT_CENB);
      $setuphold(posedge CLKB &&& re_flagB, posedge WENB, 1.000, 0.500, NOT_WENB);
      $setuphold(posedge CLKB &&& re_flagB, negedge WENB, 1.000, 0.500, NOT_WENB);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[0], 1.000, 0.500, NOT_AB0);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[0], 1.000, 0.500, NOT_AB0);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[1], 1.000, 0.500, NOT_AB1);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[1], 1.000, 0.500, NOT_AB1);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[2], 1.000, 0.500, NOT_AB2);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[2], 1.000, 0.500, NOT_AB2);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[3], 1.000, 0.500, NOT_AB3);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[3], 1.000, 0.500, NOT_AB3);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[4], 1.000, 0.500, NOT_AB4);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[4], 1.000, 0.500, NOT_AB4);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[5], 1.000, 0.500, NOT_AB5);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[5], 1.000, 0.500, NOT_AB5);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[6], 1.000, 0.500, NOT_AB6);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[6], 1.000, 0.500, NOT_AB6);
      $setuphold(posedge CLKB &&& re_flagB, posedge AB[7], 1.000, 0.500, NOT_AB7);
      $setuphold(posedge CLKB &&& re_flagB, negedge AB[7], 1.000, 0.500, NOT_AB7);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[0], 1.000, 0.500, NOT_DB0);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[0], 1.000, 0.500, NOT_DB0);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[1], 1.000, 0.500, NOT_DB1);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[1], 1.000, 0.500, NOT_DB1);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[2], 1.000, 0.500, NOT_DB2);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[2], 1.000, 0.500, NOT_DB2);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[3], 1.000, 0.500, NOT_DB3);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[3], 1.000, 0.500, NOT_DB3);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[4], 1.000, 0.500, NOT_DB4);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[4], 1.000, 0.500, NOT_DB4);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[5], 1.000, 0.500, NOT_DB5);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[5], 1.000, 0.500, NOT_DB5);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[6], 1.000, 0.500, NOT_DB6);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[6], 1.000, 0.500, NOT_DB6);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[7], 1.000, 0.500, NOT_DB7);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[7], 1.000, 0.500, NOT_DB7);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[8], 1.000, 0.500, NOT_DB8);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[8], 1.000, 0.500, NOT_DB8);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[9], 1.000, 0.500, NOT_DB9);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[9], 1.000, 0.500, NOT_DB9);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[10], 1.000, 0.500, NOT_DB10);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[10], 1.000, 0.500, NOT_DB10);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[11], 1.000, 0.500, NOT_DB11);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[11], 1.000, 0.500, NOT_DB11);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[12], 1.000, 0.500, NOT_DB12);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[12], 1.000, 0.500, NOT_DB12);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[13], 1.000, 0.500, NOT_DB13);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[13], 1.000, 0.500, NOT_DB13);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[14], 1.000, 0.500, NOT_DB14);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[14], 1.000, 0.500, NOT_DB14);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[15], 1.000, 0.500, NOT_DB15);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[15], 1.000, 0.500, NOT_DB15);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[16], 1.000, 0.500, NOT_DB16);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[16], 1.000, 0.500, NOT_DB16);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[17], 1.000, 0.500, NOT_DB17);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[17], 1.000, 0.500, NOT_DB17);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[18], 1.000, 0.500, NOT_DB18);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[18], 1.000, 0.500, NOT_DB18);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[19], 1.000, 0.500, NOT_DB19);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[19], 1.000, 0.500, NOT_DB19);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[20], 1.000, 0.500, NOT_DB20);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[20], 1.000, 0.500, NOT_DB20);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[21], 1.000, 0.500, NOT_DB21);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[21], 1.000, 0.500, NOT_DB21);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[22], 1.000, 0.500, NOT_DB22);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[22], 1.000, 0.500, NOT_DB22);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[23], 1.000, 0.500, NOT_DB23);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[23], 1.000, 0.500, NOT_DB23);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[24], 1.000, 0.500, NOT_DB24);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[24], 1.000, 0.500, NOT_DB24);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[25], 1.000, 0.500, NOT_DB25);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[25], 1.000, 0.500, NOT_DB25);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[26], 1.000, 0.500, NOT_DB26);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[26], 1.000, 0.500, NOT_DB26);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[27], 1.000, 0.500, NOT_DB27);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[27], 1.000, 0.500, NOT_DB27);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[28], 1.000, 0.500, NOT_DB28);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[28], 1.000, 0.500, NOT_DB28);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[29], 1.000, 0.500, NOT_DB29);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[29], 1.000, 0.500, NOT_DB29);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[30], 1.000, 0.500, NOT_DB30);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[30], 1.000, 0.500, NOT_DB30);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[31], 1.000, 0.500, NOT_DB31);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[31], 1.000, 0.500, NOT_DB31);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[32], 1.000, 0.500, NOT_DB32);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[32], 1.000, 0.500, NOT_DB32);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[33], 1.000, 0.500, NOT_DB33);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[33], 1.000, 0.500, NOT_DB33);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[34], 1.000, 0.500, NOT_DB34);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[34], 1.000, 0.500, NOT_DB34);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[35], 1.000, 0.500, NOT_DB35);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[35], 1.000, 0.500, NOT_DB35);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[36], 1.000, 0.500, NOT_DB36);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[36], 1.000, 0.500, NOT_DB36);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[37], 1.000, 0.500, NOT_DB37);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[37], 1.000, 0.500, NOT_DB37);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[38], 1.000, 0.500, NOT_DB38);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[38], 1.000, 0.500, NOT_DB38);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[39], 1.000, 0.500, NOT_DB39);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[39], 1.000, 0.500, NOT_DB39);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[40], 1.000, 0.500, NOT_DB40);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[40], 1.000, 0.500, NOT_DB40);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[41], 1.000, 0.500, NOT_DB41);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[41], 1.000, 0.500, NOT_DB41);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[42], 1.000, 0.500, NOT_DB42);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[42], 1.000, 0.500, NOT_DB42);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[43], 1.000, 0.500, NOT_DB43);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[43], 1.000, 0.500, NOT_DB43);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[44], 1.000, 0.500, NOT_DB44);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[44], 1.000, 0.500, NOT_DB44);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[45], 1.000, 0.500, NOT_DB45);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[45], 1.000, 0.500, NOT_DB45);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[46], 1.000, 0.500, NOT_DB46);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[46], 1.000, 0.500, NOT_DB46);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[47], 1.000, 0.500, NOT_DB47);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[47], 1.000, 0.500, NOT_DB47);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[48], 1.000, 0.500, NOT_DB48);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[48], 1.000, 0.500, NOT_DB48);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[49], 1.000, 0.500, NOT_DB49);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[49], 1.000, 0.500, NOT_DB49);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[50], 1.000, 0.500, NOT_DB50);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[50], 1.000, 0.500, NOT_DB50);
      $setuphold(posedge CLKB &&& re_data_flagB, posedge DB[51], 1.000, 0.500, NOT_DB51);
      $setuphold(posedge CLKB &&& re_data_flagB, negedge DB[51], 1.000, 0.500, NOT_DB51);
      $setup(posedge CLKA, posedge CLKB &&& contB_flag, 3.000, NOT_CONTB);
      $setup(posedge CLKB, posedge CLKA &&& contA_flag, 3.000, NOT_CONTA);
      $hold(posedge CLKA, posedge CLKB &&& cont_flag, 0.001, NOT_CONTB);

      $period(posedge CLKA, 3.000, NOT_CLKA_PER);
      $width(posedge CLKA, 1.000, 0, NOT_CLKA_MINH);
      $width(negedge CLKA, 1.000, 0, NOT_CLKA_MINL);
      $period(posedge CLKB, 3.000, NOT_CLKB_PER);
      $width(posedge CLKB, 1.000, 0, NOT_CLKB_MINH);
      $width(negedge CLKB, 1.000, 0, NOT_CLKB_MINL);

      (CLKA => QA[0])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[1])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[2])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[3])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[4])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[5])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[6])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[7])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[8])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[9])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[10])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[11])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[12])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[13])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[14])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[15])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[16])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[17])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[18])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[19])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[20])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[21])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[22])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[23])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[24])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[25])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[26])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[27])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[28])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[29])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[30])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[31])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[32])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[33])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[34])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[35])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[36])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[37])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[38])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[39])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[40])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[41])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[42])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[43])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[44])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[45])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[46])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[47])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[48])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[49])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[50])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKA => QA[51])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (OENA => QA[0])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[1])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[2])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[3])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[4])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[5])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[6])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[7])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[8])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[9])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[10])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[11])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[12])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[13])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[14])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[15])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[16])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[17])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[18])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[19])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[20])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[21])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[22])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[23])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[24])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[25])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[26])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[27])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[28])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[29])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[30])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[31])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[32])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[33])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[34])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[35])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[36])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[37])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[38])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[39])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[40])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[41])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[42])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[43])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[44])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[45])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[46])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[47])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[48])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[49])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[50])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENA => QA[51])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (CLKB => QB[0])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[1])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[2])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[3])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[4])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[5])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[6])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[7])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[8])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[9])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[10])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[11])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[12])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[13])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[14])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[15])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[16])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[17])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[18])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[19])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[20])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[21])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[22])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[23])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[24])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[25])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[26])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[27])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[28])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[29])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[30])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[31])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[32])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[33])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[34])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[35])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[36])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[37])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[38])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[39])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[40])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[41])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[42])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[43])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[44])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[45])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[46])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[47])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[48])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[49])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[50])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (CLKB => QB[51])=(1.000, 1.000, 0.500, 1.000, 0.500, 1.000);
      (OENB => QB[0])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[1])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[2])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[3])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[4])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[5])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[6])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[7])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[8])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[9])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[10])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[11])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[12])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[13])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[14])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[15])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[16])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[17])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[18])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[19])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[20])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[21])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[22])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[23])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[24])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[25])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[26])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[27])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[28])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[29])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[30])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[31])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[32])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[33])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[34])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[35])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[36])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[37])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[38])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[39])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[40])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[41])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[42])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[43])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[44])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[45])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[46])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[47])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[48])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[49])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[50])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
      (OENB => QB[51])=(1.000, 1.000, 1.000, 1.000, 1.000, 1.000);
   endspecify

endmodule
`endcelldefine
