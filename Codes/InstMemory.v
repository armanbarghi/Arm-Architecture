module InstMemory (
	AddrIn,
	Inst
);
	input [31:0] AddrIn;
	output [31:0] Inst;

	reg [31:0] mem[0:65535];

	integer i;

	initial
		begin
			//for(i=0; i<65536; i=i+1)begin
			//	mem[i] = 32'b0000_00_0_0000_0_0000_0000_000000000000;
			//end
			//$readmemb("../Codes/InstMem.txt", mem);
			mem[0] = 32'b11100011101000000000000000010100;
			mem[1] = 32'b11100011101000000001101000000001;
			mem[2] = 32'b11100011101000000010000100000011;
			mem[3] = 32'b11100000100100100011000000000010;
		end
	
	assign Inst = mem[AddrIn[17:2]];

endmodule
