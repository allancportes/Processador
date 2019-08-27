module MemoryInstruction (address, InstructionOut, clock);

	input [9:0] address;
	input clock;
	output [31:0] InstructionOut;
	reg [31:0] mem [68:0];

	
  always @ (posedge clock) begin
	
	
	/*
		//FIBONACCI 
		//1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
		mem[0]  = 32'b010x100_00000_00000_00000_00000_000000; // nop
	   mem[1]  = 32'b001101_00000_00001_00000_00000_000001; // li r[1] = Im(1)	
		mem[2]  = 32'b001101_00000_00010_00000_00000_000001; // li r[2] = Im(1)			
		mem[3]  = 32'b001101_00000_00100_00000_00000_000000; // li r[4] = Im(0)	
		mem[4]  = 32'b010101_00000_00011_00000_00000_000000; // in reg[3] <= Valor
		mem[5]  = 32'b010110_00011_00000_00000_00000_000000; // out reg[3]	
		mem[6]  = 32'b000011_00011_00011_00000_00000_000001; // subi r[3] = r[3] - Im(1) 
		mem[7]  = 32'b001001_00000_00011_01010_00000_000000; // slt r[10] = r[0] < r[3]	
		mem[8]  = 32'b001111_01010_00000_00000_00000_001101; // beq r[10] == r[0], PC = 13
		mem[9]  = 32'b000000_00001_00100_00010_00000_000000; // add r[2] = r[1] + r[4] 
		mem[10] = 32'b000000_00000_00001_00100_00000_000000; // add (move) r[4] = r[0] + r[1]
		mem[11] = 32'b000000_00000_00010_00001_00000_000000; // add (move) r[1] = r[0] + r[2]
		mem[12] = 32'b010010_00000_00000_00000_00000_000110; // jump PC = 6
		mem[13] = 32'b001110_00000_00010_00000_00000_000011;  // sw MEM[r[0] + Im(3)] = r[2]
		mem[14] = 32'b001100_00000_01000_00000_00000_000011; // lw r[8] = MEM[r[0] + Im(3)]
		mem[17] = 32'b010110_01000_00000_00000_00000_000000; // out reg[8] 
		mem[18] = 32'b010111_00000_00000_00000_00000_000000;    //hlt
	*/
		
		/*
	   //OPERAÇÕES ARITMÉTICAS 
		mem[0]   = 32'b010100_00000000000000000000000000; // nop
		mem[1]   = 32'b010101_00000_00001_00000_00000_000000; // in reg[1]  // 7
		mem[2]   = 32'b010110_00001_00000_00000_00000_000000; // out reg[1]
		mem[3]   = 32'b010101_00000_00010_00000_00000_000000; // in reg[2]  //2
		mem[4]   = 32'b010110_00010_00000_00000_00000_000000; // out reg[2]
		mem[5]   = 32'b000000_00001_00010_00011_00000_000000; // add r[3] = r[1] + r[2] //9
		mem[6]   = 32'b010110_00011_00000_00000_00000_000000; // out reg[3]		
		mem[7]   = 32'b000001_00001_00010_00101_00000_000000; // sub r[5] = r[1] - r[2] //5
		mem[8]   = 32'b010110_00101_00000_00000_00000_000000; // out reg[5]
		mem[9]   = 32'b000010_00001_00100_00000_00000_000010; // addi r[4] = r[1] + Im(2) //9
		mem[10]  = 32'b010110_00100_00000_00000_00000_000000; // out reg[4]
		mem[11]  = 32'b000011_00100_00110_00000_00000_000011; // subi r[6] = r[4] - Im(3) //6
		mem[12]  = 32'b010110_00110_00000_00000_00000_000000; // out reg[6]
		mem[13]  = 32'b000100_00001_00010_01000_00000_000000; // mult r[8] = r[1] * r[2] //14
		mem[14]  = 32'b010110_01000_00000_00000_00000_000000; // out reg[8]
		mem[15]  = 32'b010111_00000_00000_00000_00000_000000;    //hlt
		*/
		
		/*
		//BRANCH E JUMP 
		mem[0]   = 32'b010100_00000000000000000000000000; // nop
		mem[1]   = 32'b010101_00000_00001_00000_00000_000000; // in reg[1] //colocar 5	
		mem[2]   = 32'b010011_00001_00000_00000_00000_000000;  //jmpr PC = reg[1]
			
		mem[5]   = 32'b010101_00000_00010_00000_00000_000000; // in reg[2] //colocar 1
		mem[6]   = 32'b010110_00010_00000_00000_00000_000000; // out reg[2]
		mem[7]   = 32'b001111_00010_00001_00000_00000_011110; // beq r[3] == r[1], PC = 30	
		mem[8]   = 32'b010100_00000_00000_00000_00000_000000; // nop	
		mem[9]   = 32'b010100_00000_00000_00000_00000_000000; // nop
		mem[10]  = 32'b010010_00000_00000_00000_00000_001111; // jump PC = 15
			
		mem[15]  = 32'b010101_00000_00010_00000_00000_000000; // in reg[2] //colocar 2	
		mem[16]  = 32'b010110_00010_00000_00000_00000_000000; // out reg[2]
		mem[17]  = 32'b010000_00001_00010_00000_00000_011101;  //bnq r[1] != r[2], PC = 29
		
		mem[29]  = 32'b001101_00000_01000_00000_00000_000000; // li r[8] = Im(0)		
		mem[30]  = 32'b010110_01000_00000_00000_00000_000000; // out reg[2]
		mem[31]  = 32'b010001_00000_01000_00000_00000_000001; // beqz PC = 1
		*/
		
		/*
		//LÓGICAS E SHIFT
		
		mem[0]  = 32'b010100_00000000000000000000000000; // nop
		mem[1]  = 32'b010101_00000_00001_00000_00000_000000; // in reg[1]    //COLOCAR 0
		mem[2]  = 32'b000101_00001_10000_00000_00000_000000; //not r[16] = ~r[1]	
		mem[3]  = 32'b000101_10000_10000_00000_00000_000000; //not r[16] = ~r[16]
		mem[4]  = 32'b010110_10000_00000_00000_00000_000000; // out reg[16] //SAIDA = 0
		
		mem[5]  = 32'b010101_00000_00010_00000_00000_000000; // in reg[2]  // COLOCAR 2
		mem[6]  = 32'b010110_00010_00000_00000_00000_000000; // out reg[2]
		mem[7]  = 32'b000110_00001_00010_01110_00000_000000; // and r[14] = r[1] && r[2]
		mem[8]  = 32'b010110_01110_00000_00000_00000_000000; // out reg[14] 	//SAIDA = 0 	
		
		mem[9] = 32'b000111_00010_00000_01111_00000_000000; // or r[15] = r[2] || r[0]
		mem[10] = 32'b010110_01111_00000_00000_00000_000000; // out reg[15] //SAIDA = 2	
		 
		mem[11] = 32'b001000_00010_00010_01101_00000_000000; // xor r[13] = r[2] ^ r[2]
		mem[12] = 32'b010110_01101_00000_00000_00000_000000; // out reg[13] //SAIDA = 0

		mem[13] = 32'b001010_01101_00100_00000_00001_000000; // shfl r[8] = r[13] << 1
		mem[14] = 32'b001011_00100_01011_00000_00001_000000; // shfr r[11] = r[8] >> 1
		mem[15] = 32'b010110_01011_00000_00000_00000_000000; // out reg[13] //SAIDA = 0
		*/
		
		
		/*
				//LOAD E STORE 
		mem[0]  = 32'b010100_00000000000000000000000000; // nop
		mem[1]  = 32'b010101_00000_00001_00000_00000_000000; // in reg[1]
		mem[2]  = 32'b010110_00001_00000_00000_00000_000000; // out reg[1]
		mem[3]  = 32'b001110_00000_00001_00000_00000_000011;  // sw MEM[r[0] + Im(3)] = r[1]
		mem[4]  = 32'b001100_00000_00111_00000_00000_000011; // lw r[7] = MEM[r[0] + Im(3)]
		mem[5]  = 32'b010110_00111_00000_00000_00000_000000; // out reg[7]
		*/
	
	
		
		
		/*
		//LISTA DE INSTRUÇÕES
		mem[0]  = 32'b000000_00001_00010_00011_00000_000000; // add r[3] = r[1] + r[2] 
		mem[1]  = 32'b000001_00001_00010_00101_00000_000000; // sub r[5] = r[1] - r[2] 
		mem[2]  = 32'b000010_00001_00100_00000_00000_001101; // addi r[4] = r[1] + Im(13)
		mem[3]  = 32'b000011_00100_00110_00000_00000_000111; // subi r[6] = r[4] - Im(7)
		mem[4]  = 32'b000100_00001_00010_01000_00000_000000; // mult r[8] = r[1] * r[2]
		mem[5]  = 32'b000101_00001_10000_00000_00000_000000; //not r[16] = ~r[1]
		mem[6]  = 32'b000110_00001_00010_01110_00000_000000; // and r[14] = r[1] && r[2]
		mem[7]  = 32'b000111_00001_00011_01111_00000_000000; // or r[15] = r[1] || r[3]
		mem[8]  = 32'b001000_00001_00010_01101_00000_000000; // xor r[13] = r[1] ^ r[2]	
		mem[9]  = 32'b001001_00001_00010_00111_00000_000000; // slt r[7] = r[1] < r[2]
		mem[10] = 32'b001010_01000_01100_00000_00001_000000; // shfl r[12] = r[8] << 1
		mem[11] = 32'b001011_00100_01011_00000_00001_000000; // shfr r[11] = r[4] >> 1
		mem[12] = 32'b001100_01001_01011_00000_00000_000000; // lw r[11] = MEM[r[9] + Im(0)]
		mem[13] = 32'b001101_00000_00010_00000_00000_000111; // li r[2] = Im(7)
		mem[14] = 32'b001110_01001_01011_00000_00000_000001;  // sw MEM[r[9] + Im(1)] = r[11]
		mem[15] = 32'b001111_00001_10100_00000_00000_101000; // beq r[1] == r[20], PC = 40
		mem[16] = 32'b010000_00001_10100_00000_00000_101000;  //bnq r[1] != r[20], PC = 40
		mem[17] = 32'b010001_00000_01000_00000_00000_000001; // beqz
		mem[18] = 32'b010010_00000_00000_00000_00000_011110; // jump PC = 30	
		mem[19] = 32'b010011_00001_00000_00000_00000_000000;  //jmpr PC = r[1]
		mem[20] = 32'b010100_00000_00000_00000_00000_000000; // nop
		mem[21] = 32'b010101_00000_00001_00000_00000_000000; // in reg[1]	
		mem[22] = 32'b010110_00111_00000_00000_00000_000000; // out reg[7]
		mem[23] = 32'b010111_00000_00000_00000_00000_000000;    //hlt

		*/ 
mem[0] = 32'b001101_00000_11011_0000000000000000;// ldi
mem[1] = 32'b001101_00000_11100_0000000000100000;// ldi
mem[2] = 32'b001101_00000_11101_0000000000101111;// ldi
mem[3] = 32'b010010_00000000000000000000101011;// jmp
//gcd
mem[4] = 32'b001110_11011_10001_0000000000000000;// str
mem[5] = 32'b001110_11011_10010_0000000000000001;// str
mem[6] = 32'b001100_11011_00001_0000000000000001;// load
mem[7] = 32'b001101_00000_00010_0000000000000000;// ldi
mem[8] = 32'b011101_00001_00010_00011_00000000000;// sge
mem[9] = 32'b011100_00001_00010_00100_00000000000;// sle
mem[10] = 32'b000110_00011_00100_00101_00000000000;// and
mem[11] = 32'b001111_00101_00000_0000000000010010;// beq
mem[12] = 32'b001100_11011_00110_0000000000000000;// load
mem[13] = 32'b011000_00110_11110_00000_00000000000;// move
mem[14] = 32'b000010_11101_11101_1111111111111111;// addi
mem[15] = 32'b001100_11101_11111_0000000000000000;// load
mem[16] = 32'b010011_11111_00000_0000000000000000;// jr
mem[17] = 32'b010010_00000000000000000000101000;// jmp
//L0
mem[18] = 32'b001100_11011_00111_0000000000000001;// load
mem[19] = 32'b011000_00111_10001_00000_00000000000;// move
mem[20] = 32'b001100_11011_01000_0000000000000000;// load
mem[21] = 32'b001100_11011_01001_0000000000000000;// load
mem[22] = 32'b001100_11011_01010_0000000000000001;// load
mem[23] = 32'b011001_01001_01010_01011_00000000000;// divi
mem[24] = 32'b001100_11011_01100_0000000000000001;// load
mem[25] = 32'b000100_01011_01100_01101_00000000000;// mult
mem[26] = 32'b000001_01000_01101_01110_00000000000;// sub
mem[27] = 32'b011000_01110_10010_00000_00000000000;// move
mem[28] = 32'b000010_11011_11011_0000000000000010;// addi
mem[29] = 32'b001101_00000_11111_0000000000100001;// ldi
mem[30] = 32'b001110_11101_11111_0000000000000000;// str
mem[31] = 32'b000010_11101_11101_0000000000000001;// addi
mem[32] = 32'b010010_00000000000000000000000100;// jmp
mem[33] = 32'b011000_11110_01111_00000_00000000000;// move
mem[34] = 32'b000010_11011_11011_1111111111111110;// addi
mem[35] = 32'b011000_01111_11110_00000_00000000000;// move
mem[36] = 32'b000010_11101_11101_1111111111111111;// addi
mem[37] = 32'b001100_11101_11111_0000000000000000;// load
mem[38] = 32'b010011_11111_00000_0000000000000000;// jr
mem[39] = 32'b010010_00000000000000000000101000;// jmp
//L1
mem[40] = 32'b000010_11101_11101_1111111111111111;// addi
mem[41] = 32'b001100_11101_11111_0000000000000000;// load
mem[42] = 32'b010011_11111_00000_0000000000000000;// jr
//main
mem[43] = 32'b001100_11011_10000_0000000000000000;// load
mem[44] = 32'b010101_00000_00001_00000_00000000000;// in
mem[45] = 32'b011000_00001_10000_00000_00000000000;// move
mem[46] = 32'b001110_11011_10000_0000000000000000;// str
mem[47] = 32'b001100_11011_00010_0000000000000001;// load
mem[48] = 32'b010101_00000_00011_00000_00000000000;// in
mem[49] = 32'b011000_00011_00010_00000_00000000000;// move
mem[50] = 32'b001110_11011_00010_0000000000000001;// str
mem[51] = 32'b001100_11011_00100_0000000000000000;// load
mem[52] = 32'b011000_00100_10001_00000_00000000000;// move
mem[53] = 32'b001100_11011_00101_0000000000000001;// load
mem[54] = 32'b011000_00101_10010_00000_00000000000;// move
mem[55] = 32'b000010_11011_11011_0000000000000010;// addi
mem[56] = 32'b001101_00000_11111_0000000000111100;// ldi
mem[57] = 32'b001110_11101_11111_0000000000000000;// str
mem[58] = 32'b000010_11101_11101_0000000000000001;// addi
mem[59] = 32'b010010_00000000000000000000000100;// jmp
mem[60] = 32'b011000_11110_00110_00000_00000000000;// move
mem[61] = 32'b000010_11011_11011_1111111111111110;// addi
mem[62] = 32'b011000_00110_10001_00000_00000000000;// move
mem[63] = 32'b011000_10001_00111_00000_00000000000;// move
mem[64] = 32'b010110_00111_00000_0000000000000000;// out
mem[65] = 32'b010100_00000000000000000000000000;// nop
mem[66] = 32'b010010_00000000000000000001000011;// jmp
//end
mem[67] = 32'b010111_00000000000000000000000000;// halt

  end
  
  assign InstructionOut = mem[address];
  
 endmodule 