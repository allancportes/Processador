module MuxULA(input1, input2, out, select); //Mux de entrada da ULA

  input select;
  input [31:0] input1, input2;
  output reg [31:0] out;

 always @ (*) begin
	
 	case(select)
		   1'b0 : out = input1;
    	 	1'b1 : out = input2;
   	endcase
   
  end

endmodule