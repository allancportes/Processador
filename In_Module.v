module In_Module (Switches, Out, In_Signal, clock); 

	input [15:0] Switches;
	input In_Signal, clock;
	output reg [15:0] Out;
	
	always @(posedge clock)
		begin
			if (In_Signal)
				Out = Switches;
		end
		
endmodule