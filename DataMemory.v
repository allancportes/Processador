module DataMemory(clock, address, flag, DataOut, data); 

input [31:0] data;	
input [31:0] address;	
input clock , flag;
output [31:0] DataOut;
reg [31:0] Out[100:0];

always @ (posedge clock) begin 

if (flag)						
	Out[address] = data;
end
assign DataOut = Out[address];

endmodule