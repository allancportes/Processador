module Program_Counter (clock, adress, reset, hlt, pgcount, jump, jr, insign);

	input clock, reset, hlt, jump, jr, insign;
	input[9:0]adress;
	output reg [9:0]pgcount;  
	
	wire [9:0]  newValue;
	assign newValue = adress;

	
	always @(posedge clock) begin 
						
			if(reset) begin
				pgcount = 0;
			end
			
			else if(insign ==1) begin

			end
			
			else if((jump==1) || (jr==1)) 
				pgcount <= newValue;
			
	
			else begin
				pgcount <= adress + 1;
			end
	
		end
	

endmodule  



