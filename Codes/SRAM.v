module SRAM (
    clk, rst,
    SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N,
    SRAM_DQ,
    SRAM_ADDR
);
    input clk, rst;
    input SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N;
    inout [15:0] SRAM_DQ;       // SRAM Data bus 16 Bits
    input [17:0] SRAM_ADDR;     // SRAM Address bus 18 Bits
    
    reg [15:0] mem[0:512];
	
    assign SRAM_DQ = SRAM_WE_N ? mem[SRAM_ADDR] : {(16){1'bz}};

    always @(posedge clk) begin
        if (SRAM_WE_N == 1'b0) begin
            mem[SRAM_ADDR] <= SRAM_DQ;
        end
    end

endmodule