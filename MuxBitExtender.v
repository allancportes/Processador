module MuxBitExtender(control, offset, out, in); //Mux de entrada do extensor de bit

	input control;
	input [15:0] offset, in;
	output reg[15:0] out;
	
	always @ (*) begin
		
		case (control)
			1'b0 : out = offset;
			1'b1 : out = in;
		endcase
		
	end
	
endmodule