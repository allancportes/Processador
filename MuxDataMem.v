module MuxDataMem(input1, input2, out, select); //Mux de saida da memória de dados

  input select;
  input [31:0] input1, input2;
  output reg [31:0] out;


 always @ (*) begin
	
	if(select) begin
		out = input2;
	end
	else begin
		out = input1;
	end

end
		


endmodule
