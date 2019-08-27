module MUXInput(MUXINSelect, offset, Input, Output);

	input MUXINSelect;
	input [15:0] offset, Input;
	output reg [15:0] Output;
	
	always @ (*) begin
		
		case (MUXINSelect)
			1'b0 : Output = offset;
			1'b1 : Output = Input;
		endcase
		
	end
	
endmodule