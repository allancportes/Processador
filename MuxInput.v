module MuxInput (MUXDMOut, switch, out, inputControl); //Mux de saida da memória de dados

  input [31:0] MUXDMOut;
  input [15:0] switch;
  output reg [31:0] out;
  input inputControl;

 always @ (*) begin
	
	if(inputControl) begin
		out = {16'd0, switch};
	end
	else begin
		out = MUXDMOut;
	end
		
end

endmodule
