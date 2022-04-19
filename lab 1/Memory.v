module Memory (
    clk, rst,
    mem_read, mem_write,
    address, data,
    mem_result
);
    input clk, rst;
    input mem_read, mem_write;
    input [31:0] address, data;
    output [31:0] mem_result;
    
    reg [31:0] mem[0:63];
    initial
		begin
			$readmemb("DataMem.txt", mem);
		end
	
    // Divide address into 4 to align the memory
	assign mem_result = (mem_read == 1'b1) ? mem[address >> 2] : 32'b0;

    always @(posedge clk) begin
        if (mem_write == 1'b1) begin
            mem[address >> 2] <= data;
        end
    end
endmodule