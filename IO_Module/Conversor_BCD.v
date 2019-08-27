module Conversor_BCD(bin, centena, dezena, unidade, neg);

	integer i;
	input [7:0] bin;
	reg [7:0] binaux ;
	output reg neg;
	output reg [3:0] dezena, unidade, centena;
	
	always@(bin) begin
		
		centena = 4'D0;
		dezena = 4'D0;
		unidade = 4'D0;
		
		if(bin[7]) begin
			binaux = ~bin + 8'd1;
			neg = 1;
		end
		else begin
			binaux = bin;
			neg = 0;
		end
			

		for(i = 7; i>=0; i=i-1) begin
			
			if(centena >= 5)
				centena = centena + 4'd3;
			if (dezena >= 5)
				dezena = dezena + 4'd3;
			if (unidade >= 5)
				unidade = unidade + 4'd3;

			centena = centena << 1;
			centena[0] = dezena[3];
			dezena = dezena << 1;
			dezena[0] = unidade[3];
			unidade = unidade << 1;
			unidade[0] = binaux[i];
		end
	end

endmodule