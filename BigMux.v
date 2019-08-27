module BigMux(zero, beq, bneq, beqz, selectbm, outputbm, outputpc, sum, signal, regdata);
  
  input zero, beq, bneq, beqz;
  input [1:0]  selectbm; 
  input [31:0]  outputpc, sum, signal, regdata;
  output reg [31:0] outputbm;

always @ (*) begin

		case(selectbm[1:0])
			2'b01: //branch
				begin	
					if(bneq == 1 && zero == 0)
						outputbm = outputpc;
						
					else if(bneq == 1 && zero == 1)
						outputbm = sum-1;   //pula
						
					else if(beq == 1 && zero == 1)
						outputbm = sum-1;				//pula
						
					else if(beq == 1 && zero == 0)
						outputbm = outputpc;
						
					else if(beqz == 1 && zero == 1) 
						outputbm = sum-1;	//pula
						
					else if(beqz == 1 && zero == 0)
						outputbm = outputpc;
					else
						outputbm = outputpc;

				end
				
			2'b10: outputbm = signal;//jump
			
			2'b11 : outputbm = regdata;//jump register	
			
			default: outputbm = outputpc; //2'b00
			
        	endcase
end

endmodule