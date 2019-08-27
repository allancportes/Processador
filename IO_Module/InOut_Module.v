module InOut_Module (centena, dezena, unidade, out, centena_out, dezena_out, unidade_out);

	input out;
	input [3:0] centena, dezena, unidade;
	output [6:0] centena_out, dezena_out, unidade_out;
	
	Display cent(.in(centena), .out(centena_out), .halt(out));
	Display dez(.in(dezena), .out(dezena_out), .halt(out));
	Display uni(.in(unidade), .out(unidade_out), .halt(out));

endmodule