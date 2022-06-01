module Memory (
    clk, rst,
    mem_read, mem_write,
    address, data,
    mem_result,
    mem0, mem1, mem2, mem3, mem4, mem5, mem6
);
    input clk, rst;
    input mem_read, mem_write;
    input [31:0] address, data;
    output [31:0] mem_result;

    output [31:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6;
    
    reg [31:0] mem[0:63];
	
    integer i;
    // Divide address into 4 to align the memory
	assign mem_result = (mem_read == 1'b1) ? mem[address >> 2] : 32'b0;

    always @(posedge clk, posedge rst) begin
        if(rst == 1'b1) begin
            for(i=0; i<64; i=i+1)
                mem[i] <= 32'b0;
        end
        else if(mem_write == 1'b1) begin
            mem[address >> 2] <= data;
        end
    end

    assign mem0 = mem[0];
    assign mem1 = mem[1];
    assign mem2 = mem[2];
    assign mem3 = mem[3];
    assign mem4 = mem[4];
    assign mem5 = mem[5];
    assign mem6 = mem[6];
 

endmodule