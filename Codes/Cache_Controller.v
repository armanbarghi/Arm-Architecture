module Cache_Controller(
    input clk, rst,
    
    //memory stage unit
    input [31:0] address,
    input [31:0] wdata,
    input MEM_R_EN,
    input MEM_W_EN,
    output [31:0] rdata,
    output ready,
    
    //SRAM Controller
    output [31:0] sram_address,
    output [31:0] sram_wdata,
    output write,
    output read, //FIX ME!
    input [63:0] sram_rdata,
    input sram_ready
);
    wire write_cache, hit;
    wire [63:0] cache_data;

    Cache cache_mem(
        .rst(rst),
        .clk(clk),
        .write_cache(write_cache),
        .data(sram_rdata), //FIX ME
        .tag(address[18:9]),
        .index(address[8:3]),
        .hit(hit),
        .data_out(cache_data)
    );
    assign ready = sram_ready | hit;
  
    assign rdata = (address[2] == 1'b1) ? cache_data[63:32] : cache_data[31:0];

    assign write_cache = read & sram_ready;

    assign sram_wdata = wdata;
    assign write = MEM_W_EN;
    assign sram_address = address;
    assign read = ~hit & MEM_R_EN;



endmodule