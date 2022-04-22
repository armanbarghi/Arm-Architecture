module InstMemory (
	AddrIn,
	Inst
);
	input [31:0] AddrIn;
	output reg [31:0] Inst;

	reg [7:0] mem[0:65535];
	initial
		begin
			$readmemb("InstMem.txt", mem);
		end
	
	assign d_out = mem[AddrIn];

endmodule
