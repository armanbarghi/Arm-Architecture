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
    output read, //FIXME: with source conflict
    input [63:0] sram_rdata,
    input sram_ready
);
    wire write_cache, hit;
    wire [63:0] cache_word;
    wire [31:0] cache_data;

    Cache cache_mem(
        .rst(rst),
        .clk(clk),
        .write_cacheR(write_cacheR),
        .write_cacheW(write_cacheW),
        .rdata(sram_rdata), //FIX ME
        .wdata(wdata),
        .tag(address[18:9]),
        .index(address[8:3]),
        .offset(address[2:0]),
        .hit(hit),
        .data_out(cache_word)
    );
    assign ready = ((sram_ready | hit) & MEM_R_EN) | (sram_ready & MEM_W_EN);
  
    assign cache_data = (address[2] == 1'b1) ? cache_word[63:32] : cache_word[31:0];

    assign rdata = (hit == 1) ? cache_data : sram_rdata;

    assign write_cacheR =  ~hit & MEM_R_EN & sram_ready; 
    assign write_cacheW = hit & MEM_W_EN & sram_ready;

    assign sram_wdata = wdata;
    assign write = MEM_W_EN;
    assign sram_address = address;
    assign read = ~hit & MEM_R_EN;



endmodule