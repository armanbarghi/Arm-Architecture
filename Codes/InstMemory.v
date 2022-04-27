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
			$readmemb("../Codes/InstMem.txt", mem);
		end
	
	assign Inst = mem[AddrIn[17:2]];

endmodule
