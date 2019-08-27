module BitExtender26 (DataIn, DataOut); //Extensor de bits de 26 para 32

	input [25:0] DataIn;
	output reg [31:0] DataOut;


	always @ (*)
		begin
			if(DataIn[25] == 1'b1)
				DataOut = {6'b111111, DataIn};
			else
				DataOut = {6'b000000, DataIn};
		end


endmodule