module ControlUnit(clock, opcode, MuxBankSelect, MUXULASelect, BIGMUXSelect, hlt, 
                   jmp, beq, bneq, MUXDMSelect, WriteFlag, RegWrite, ULAcode, inputControl, outputControl, jr, beqz);

	input clock;
	input [5:0] opcode;		
	output reg MuxBankSelect;			//pre-regbank mux 
	output reg MUXULASelect;			//pre-alu mux 
	output reg [1:0] BIGMUXSelect;		//big mux 
	output reg hlt, jmp, beq, bneq, jr, beqz;	//pc flags	
	output reg MUXDMSelect;			//post-data mem mux 
	output reg WriteFlag;				//datamem write flag
	output reg RegWrite;				//reg bank write mark
	output reg[4:0] ULAcode;		//alu opcode
	output reg inputControl;			//controle de input
	output reg outputControl;
	
	always @ (*) begin
	case(opcode[5:0])
	
	6'b000000: 
		begin //ADD 
		
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0;
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
				
			6'b000001: begin //SUB 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0 ;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0;
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00001; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			
			end
				
			6'b000010: begin //ADDI 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				end
				
			6'b000011: begin //SUBI 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0;
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00001; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				end
				
			6'b000100: begin //MULT
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00101; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b000101: begin //NOT 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01001; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b000110: begin //AND 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01010; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b000111: begin //OR 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01011; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b001000: begin //XOR 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01100; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b001001: begin //SLT 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00100; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b001010: begin //SHFL 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00111; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b001011: begin //SHFR 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b001100: begin //LW
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			
			end
			
			6'b001101: begin //Li
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
			end
	
			
			6'b001110: begin //SW
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b1;
				RegWrite = 1'b0;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			
			end
			
			6'b001111: begin //BEQ 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b01;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b1;
				bneq = 1'b0;
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b01101; 
				inputControl = 1'b0;
				outputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b010000: begin //BNEQ 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b01;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b1;
				outputControl = 1'b0;
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b10000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b010001: begin //BEQZ     ARRUMAR
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b01;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b10001; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b1;
				
			end	
						
			6'b010010: begin //JMP 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b10;
				hlt = 1'b0;
				jmp = 1'b1;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b00010; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
				end
				
			6'b010011: begin //JMPR 
					MuxBankSelect = 1'b0;
					MUXULASelect = 1'b0;
					BIGMUXSelect = 2'b11;
					hlt = 1'b0;
					jmp = 1'b1;
					beq = 1'b0;
					bneq = 1'b0;
					outputControl = 1'b0; 
					MUXDMSelect = 1'b0;
					WriteFlag = 1'b0;
					RegWrite = 1'b0;
					ULAcode = 5'b00000; 
					inputControl = 1'b0;
					jr = 1'b1;
				   beqz = 1'b0;
				end
				
			6'b010100: begin //NOP 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				end

			6'b010101: begin //IN 		
			
						MuxBankSelect = 1'b0;
						MUXULASelect = 1'b1;
						BIGMUXSelect = 2'b00;
						outputControl = 1'b0;
						hlt = 1'b0;
						jmp = 1'b0;
						beq = 1'b0;
						bneq = 1'b0;
						MUXDMSelect = 1'b1;
						WriteFlag = 1'b0;
						RegWrite = 1'b1;
						ULAcode = 5'b00000; 
						inputControl = 1'b1;
						jr = 1'b0;
				      beqz = 1'b0;
					
				end
			6'b010110: begin //OUT 

						MuxBankSelect = 1'b1;
						MUXULASelect = 1'b0;
						BIGMUXSelect = 2'b00;
						hlt = 1'b0;
						jmp = 1'b0;
						beq = 1'b0;
						bneq = 1'b0;
						outputControl = 1'b1; 
						MUXDMSelect = 1'b1;
						WriteFlag = 1'b0;
						RegWrite = 1'b0;
						ULAcode = 5'b00000; 
						inputControl = 1'b0;
						jr = 1'b0;
				      beqz = 1'b0;		
				end
				
			6'b010111: begin //HLT 
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b1;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b00000; 	
				inputControl = 1'b0;
				outputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
			
			
			
			6'b011000: begin //MOVE  (add com i=0)
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b1;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
			
			6'b011001: begin //DIV (mult com outra operacao em alu)
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b10010; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
			
			6'b011010: begin //MOD (add com outra operaçao)
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0;
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b10011; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
			
			6'b011011: begin //SGT (a > b) 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b00110; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
				
			end
			
			6'b011100: begin //SLE (a <= b) 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01110; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end
		
			6'b011101: begin //SGE (a >= b) 
				MuxBankSelect = 1'b1;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0;
				outputControl = 1'b0; 
				MUXDMSelect = 1'b1;
				WriteFlag = 1'b0;
				RegWrite = 1'b1;
				ULAcode = 5'b01111; 
				inputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end

			default: begin
				MuxBankSelect = 1'b0;
				MUXULASelect = 1'b0;
				BIGMUXSelect = 2'b00;
				hlt = 1'b0;
				jmp = 1'b0;
				beq = 1'b0;
				bneq = 1'b0; 
				MUXDMSelect = 1'b0;
				WriteFlag = 1'b0;
				RegWrite = 1'b0;
				ULAcode = 5'b00000; 
				inputControl = 1'b0;
				outputControl = 1'b0;
				jr = 1'b0;
				beqz = 1'b0;
			end	
		endcase
	end

endmodule 
			