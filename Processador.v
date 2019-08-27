//VERSÃO PLACA
module Processador (
							//clockReal,// addressIn, //addressOut, //PC
							//Instruction,							 //instMem
							//MuxBankOut, MuxBankSelect	//MuxRegBank
							//RegWrite, WriteData, WriteRegister, Data1, Data2 //, RegOut1, RegOut2 //RegBank
						   //MuxBankSelect, MUXULASelect, BIGMUXSelect, halt, 
							//jmp, beq, bneq, reset, MUXDMSelect, WriteFlag, RegWrite, ALUcode, inputcontrol
							//ALUcode, Data1, ULAout, MUXULAOutput, WriteData, Data, zero //ULA
							//WriteFlag, ULAout, DataMemOutput, Data2,   //DataMemory
							//MUXDMOutput, MUXDMSelect							//DataMemoryMUX
							//beq, bneq, beqz, BIGMUXSelect, addressOut, BitExtender16_32, BitExtender26_32, Data1, zero  //BIGMUX

							//halt, negative, centena_out, dezena_out, unidade_out, dezena_pcOUT, unidade_pcOUT,
							//dezena_regOUT,unidade_regOUT
							
							centena_out, dezena_out, unidade_out, switch, 
							clock, check, check1, reset, dezena_pcOUT, unidade_pcOUT, insinal, beq, zero,
							unidade_regOUT, dezena_regOUT
	
						 );
						 
													
//PC
	wire clockReal;
   input wire reset;
	wire PCBranch, jr;
   wire [31:0]addressIn;
   wire [31:0]addressOut; 

// Instructiom Memory
   wire [31:0] Instruction;
	 
// MuxBank1
  wire MuxBankSelect;
  wire [4:0] MuxBankOut;
  
// MuxBitExtender
  wire MUXBEControl;
  wire [15:0] MUXBEOut;
  
// BitExtender16
   wire [31:0] BitExtender16_32;
  
// BitExtender26
   wire [31:0] BitExtender26_32;

// Register Bank

   wire [31:0] WriteData;
   wire [31:0] Data2;
   wire [31:0]Data1;
   wire [4:0] RegOut1, RegOut2;
	wire [31:0] RegDataWrite;
   
// MUXULA
  wire [31:0] MUXULAOutput;
  wire MUXULASelect;

//Unidade de Controle
  				 						
	wire  jmp;	//pc flags	
	wire  WriteFlag;				//datamem write flag
	wire  RegWrite;				//reg bank write mark
	wire [4:0] ALUcode;		//alu opcode
	wire inputcontrol;			//controle de input
   wire halt; 
	
//ULA
   wire [31:0] ULAout;
   output wire zero;
	
//Data Memory
	wire [31:0] DataMemOutput;
	
//Data Memory MUX
	wire [31:0] MUXDMOutput;
	wire MUXDMSelect;
	
//BIGMUX
	 wire bneq; 
	 wire beqz;
	 wire [1:0]  BIGMUXSelect;
	 output wire beq;

//IO Module
	
	//Input
	 wire inputControl;
   input wire [4:0] switch;
	 wire [15:0] MUXINOutput;	
	input check1;
	input check;
	
	//Output
	
  wire negative;
	
		//Result
	wire [3:0] centena, dezena, unidade;
    output wire [6:0] centena_out, dezena_out, unidade_out;
	 wire [31:0] resultado;
	
		//PC
   wire [3:0] centena_pc, dezena_pc, unidade_pc;
	output  wire [6:0] dezena_pcOUT, unidade_pcOUT;
	wire [6:0] centena_pcOUT;
	
	//reg
		wire [3:0] centena_reg, dezena_reg, unidade_reg;
     wire [6:0] centena_regOUT;
	  output wire [6:0] unidade_regOUT, dezena_regOUT;
	 
	 wire [3:0] centena_reg2, dezena_reg2, unidade_reg2;
     wire [6:0] centena_regOUT2, dezena_regOUT2;
	  wire [6:0] unidade_regOUT2;
	
	 wire pin_button; 
	 input wire clock;	//clock/sinal de checagem para o término de in/out
	 output wire insinal;
	 wire outputControl;
	



Temporizador Temp (
							.clk_auto(clock),
							.clk(clockReal)
						);
				 
				 
Program_Counter PC (
		.clock(clockReal), 
		.adress(addressIn), 
		.reset(reset), 
		.hlt(halt), 
		.pgcount(addressOut),  
		.jump(jmp), 
		.jr(jr), 
		.insign(insinal)
		
		);
		
assign insinal = ((outputControl==1 && check1==0) || (check ==0 && inputControl==1)) ? 1 : (halt ==1) ? 1 : 0;
	
MemoryInstruction InstrMem (
						  .address(addressOut[9:0]), 
						  .InstructionOut(Instruction), 
						  .clock(clockReal));
					  
MuxBank1 MuxBR (
			.input1(Instruction[20:16]), 
			.input2(Instruction[15:11]), 
			.out(MuxBankOut), 
			.select(MuxBankSelect));

								
BitExtender BitExtender32(
				 .DataIn(Instruction[15:0]), 
				 .DataOut(BitExtender16_32)
				 );

				 
RegBank RegBank (.clock(clockReal), 
					  .Reg1(Instruction[25:21]), 
					  .Reg2(Instruction[20:16]), 
					  .RegWrite(RegWrite), 
					  .WriteData(WriteData), 
					  .WriteRegister(MuxBankOut), 
					  .Data1(Data1), 
					  .Data2(Data2),
					  .Resultado(resultado),
					  .outputControl(outputControl),
					  .RegOut1(RegOut1),
					  .RegOut2(RegOut2),
					  .inputControl(inputControl), 
					  .DataIn({28'd0, switch})
					  
					  );				  
	
	
//unidadedade de Controle

ControlUnit UC ( 
					 .clock(clockReal), 
					 .opcode(Instruction[31:26]), 
					 .MuxBankSelect(MuxBankSelect), 
					 .MUXULASelect(MUXULASelect), 
					 .BIGMUXSelect(BIGMUXSelect), 
					 .hlt(halt), 
                .jmp(jmp), 
					 .beq(beq), 
					 .bneq(bneq), 
					 .MUXDMSelect(MUXDMSelect), 
					 .WriteFlag(WriteFlag), 
					 .RegWrite(RegWrite), 
					 .ULAcode(ALUcode), 
					 .inputControl(inputControl),
					 .outputControl(outputControl),
					 .jr(jr), 
					 .beqz(beqz)
					 );



//BitExtender26_32

BitExtender26 BitExtender26 (
						.DataIn(Instruction[25:0]), 
						.DataOut(BitExtender26_32)
						);
		
//MuxULA

MuxULA MUXULA(.input1(Data2), 
				  .input2(BitExtender16_32), 
				  .out(MUXULAOutput), 
				  .select(MUXULASelect)
				  );
			  

//ULA		 
ULA ULA (.op(ALUcode), 
			.data1(Data1), 
			.data2(MUXULAOutput), 
			.result(ULAout),
			.signal_zero(zero), 
			.shamt(Instruction[10:6]) 
			); 

			
			
					

//Data Memory				  
DataMemory DataMemory(
					.clock(clockReal), 
					.address(ULAout), 
				   .flag(WriteFlag), 
					.DataOut(DataMemOutput), 
					.data(Data2)
					);
				
	
//Mux Data Memory							
MuxDataMem MUXDM(
				.input1(DataMemOutput), 
				.input2(ULAout), 
				.out(WriteData), 
				.select(MUXDMSelect)
				);

				/*
//MUX Entrada				
	MuxInput MUXIN(
					.MUXDMOut(WriteData), 
					.switch(switch), 
					.out(RegDataWrite), 
					.inputControl(inputControl)
					);
					*/


//BigMux			
BigMux BIGMUX(.zero(zero), 
				  .beq(beq) , 
				  .bneq(bneq), 
				  .beqz(beqz), 
				  .selectbm(BIGMUXSelect), 
				  .outputbm(addressIn), 
				  .outputpc(addressOut),
				  .sum(BitExtender16_32), 
				  .signal(BitExtender26_32), 
				  .regdata(Data1)
				 
				 );
				  
//IN AND OUT MODULE


//PC

Conversor_BCD PC_IOModule(
								.bin(addressOut[7:0]),
								.centena(centena_pc),
								.dezena(dezena_pc),
								.unidade(unidade_pc));

InOut_Module InOut_PC (
							.centena(centena_pc),
							.dezena(dezena_pc),
							.unidade(unidade_pc),
							.out(1'b1),
							.centena_out(centena_pcOUT),
							.dezena_out(dezena_pcOUT), 
							.unidade_out(unidade_pcOUT));
							
				

//Register Bank
						
Conversor_BCD reg_address_value(
			    		.bin({28'd0, switch}),
						.centena(centena_reg),
			     	  .dezena(dezena_reg),
			     	  .unidade(unidade_reg));

InOut_Module InOut_Reg (
				 .centena(centena_reg),
			    .dezena(dezena_reg),
			    .unidade(unidade_reg),
			    .out(1'b1),
			    .dezena_out(dezena_regOUT), 
			    .unidade_out(unidade_regOUT)); 
				 
		  
Conversor_BCD reg_address_value2(
			    		.bin(MUXULAOutput),
						.centena(centena_reg2),
			     	  .dezena(dezena_reg2),
			     	  .unidade(unidade_reg2));

InOut_Module InOut_Reg2 (
				 .centena(centena_reg2),
			    .dezena(dezena_reg2),
			    .unidade(unidade_reg2),
			    .out(1'b1),
			    .dezena_out(dezena_regOUT2), 
			    .unidade_out(unidade_regOUT2)); 
				 

//Resultado (operações) 


				  
Conversor_BCD Result_IOModule (
								.bin(resultado),
								.centena(centena),
								.dezena(dezena),
								.unidade(unidade),
								.neg(negative)
								);

InOut_Module InOut_Result (
						.centena(centena),
						.dezena(dezena),
						.unidade(unidade),
						.out(outputControl),
						.centena_out(centena_out),
						.dezena_out(dezena_out), 
						.unidade_out(unidade_out)); 
	  

/*	
Debouncer Debounce(
				 .clk(clock),
		       .PB(~pin_button),
		       .PB_state(clockReal));
				 
				 
DeBounce_v  Debouce (
							.clk(clock),
							 .n_reset(1'b1),
							 .button_in(pin_button),
							 .DB_out(botaosaida)); 
*/
									 


					
endmodule				
				