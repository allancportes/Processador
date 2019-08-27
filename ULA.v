module ULA (op, data1, data2, result, signal_zero, shamt); 


	input [31:0]data1;
	input [31:0]data2; 
	input [4:0]shamt; 
	input [4:0]op;

	output signal_zero; 
	//output signal_neg; VERIFICAR
	output reg [31:0]result; 
	
	
	//always @(data1 or data2 or op or shamt) begin
	always @(*) begin
		case(op[4:0])
			5'b00000: result = data1 + data2; //add
		   5'b00001: result = data1 - data2; //sub
		   5'b00010: result = data1 + 1; 	//addi
		   5'b00011: result = data1 - 1;  //subi
		   5'b00100: result = data1 < data2 ? 1 : 0; //slt
		   5'b00101: result = data1[15:0] * data2[15:0]; //mult
		   5'b00110: result = data1 > data2 ? 1 : 0; // sgt Set greater than (Branch)
		   5'b00111: result = data1 << shamt;//shfl
		   5'b01000: result = data1 >> shamt; //shfr
		   5'b01001: result = ~data1; //not
		   5'b01010: result = data1 & data2; //and
		   5'b01011: result = data1 | data2; //or
		   5'b01100: result = data1 ^ data2; //xor
			5'b01101: result = data1 == data2 ? 0 : 1; // seq Set equal than (Branch) deixei zero pois uso no beq 
			5'b01110: result = data1 <= data2 ? 1 : 0; // sle Set less or equal than (Branch)
			5'b01111: result = data1 >= data2 ? 1 : 0; // sge Set greater or equal than (Branch)
			5'b10000: result = data1 != data2 ? 1 : 0; // Set different	
			5'b10001: result = data1 == 0 ? 0 : 1; //Branch and equal zero - beqz 
			5'b10010: result = data1[15:0] / data2[15:0]; //div
			5'b10011: result = data1 % data2; //mod
			
			default : result = 0;
		endcase
	end
	
	assign signal_zero = (result == 0); 
//	assign signal_neg = (($signed(result) < 0));
	
	
endmodule 