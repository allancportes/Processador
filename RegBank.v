module RegBank (clock, Reg1, Reg2, RegWrite, WriteData, WriteRegister, Data1, Data2, Resultado, outputControl, RegOut1, RegOut2, inputControl, DataIn);

	input [4:0] Reg1, Reg2, WriteRegister;
	input [31:0] WriteData;
	input RegWrite, clock, outputControl, inputControl;
	output [31:0] Data1, Data2;
	reg [31:0] Register [31:0];
	output [4:0] RegOut1, RegOut2;
	input [31:0] DataIn;

   output reg [31:0] Resultado;
	
	always @(posedge clock)
		begin
			Register[0] = 32'b0;
			
			if(RegWrite) 
				Register [WriteRegister] = WriteData;
			
			if(outputControl) begin
				Resultado = Register[Reg1];

			end
			else begin
				Resultado = 8'b0;	
			end
			
			if(inputControl) begin
				Register [WriteRegister] = DataIn;
			end			
			

				
				
		end
		
		assign Data1 = Register[Reg1];
		assign Data2 = Register[Reg2];
		assign RegOut1 = Reg1;
		assign RegOut2 = Reg2;

endmodule