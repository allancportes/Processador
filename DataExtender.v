module BitExtender (DataIn, DataOut); //Extensor de bits de 16 para 32

	input [15:0] DataIn;
	output reg [31:0] DataOut;


	always @ (*)
		begin
			if(DataIn[15])
				DataOut = {16'b1111111111111111, DataIn};
			else
				DataOut = {16'b0, DataIn};
		end


endmodule