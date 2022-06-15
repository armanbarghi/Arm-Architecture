module InstMemory (
	AddrIn,
	Inst
);
	input [31:0] AddrIn;
	output [31:0] Inst;

	reg [31:0] mem[0:65535];

	initial begin
		// $readmemb("../Codes/InstMem.txt", mem);
		mem[0] = 32'b1110_00_1_1101_0_0000_0000_000100000001; //MOV R0, 0x40000000
		mem[1] = 32'b1110_00_1_1101_0_0000_0001_000000000000; //MOV R1, 0x00000000
		mem[2] = 32'b1110_00_0_0011_0_0000_0010_000000000000; //EXP R2, R0	//R2 = 0x40EC7326
		mem[3] = 32'b1110_00_0_0011_0_0001_0011_000000000001; //EXP R3, R1	//R2 = 0x3F800000
		mem[4] = 32'b1110_10_1_0_111111111111111111111111 ;   //B #-1
	end

	assign Inst = mem[AddrIn[17:2]];

endmodule
