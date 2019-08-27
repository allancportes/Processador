module Temporizador(clk_auto, clk);
	input clk_auto;
	output clk;
	reg[30:0] cont;
	
	always@(posedge clk_auto)
		begin
					cont <= cont + 31'd1; //registrador usa nao bloqueante (<=)
			
		end
		assign clk = cont[20];

endmodule
