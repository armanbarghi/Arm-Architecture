module SRAM_Cotroller (
    clk, rst,
    wr_en, rd_en,
    address, write_data,
    ready,
    read_data,
    SRAM_DQ,
    SRAM_ADDR,
    SRAM_UB_N, SRAM_LB_N, SRAM_WE_N, SRAM_CE_N, SRAM_OE_N
);
    input clk, rst;
    input wr_en, rd_en;
    input [31:0] address, write_data;
    output ready;
    output [31:0] read_data;

    inout [15:0] SRAM_DQ;       // SRAM Data bus 16 Bits
    output [17:0] SRAM_ADDR;    // SRAM Address bus 18 Bits
    output SRAM_UB_N;           // SRAM High-byte Data mask
    output SRAM_LB_N;           // SRAM Low-byte Data mask
    output SRAM_WE_N;           // SRAM Write Enable
    output SRAM_CE_N;           // SRAM Chip Enable
    output SRAM_OE_N;           // SRAM Output Enable

    
endmodule