module SRAM_Controller (
    clk, rst,
    rd_en, wr_en,
    address, write_data,
    SRAM_DQ,
    ready,
    SRAM_WE_N,
    SRAM_ADDR,
    read_data
);
    input clk, rst;
    input rd_en, wr_en;
    input [31:0] address, write_data;

    inout [15:0] SRAM_DQ;       // SRAM Data bus 16 Bits
    output ready;
    output SRAM_WE_N;           // SRAM Write Enable
    output reg [17:0] SRAM_ADDR;    // SRAM Address bus 18 Bits
    output [31:0] read_data;

    reg [2:0] state;
    reg [15:0] high_data, low_data;

    // We asssume that the SRAM will works in 6 clock

    always @(posedge clk, posedge rst) begin
        if (rst == 1'b1)
            state <= 3'b000;
        else if (state == 3'b101)
            state <= 3'b000;
        else if (wr_en | rd_en)
            state = state + 1'b1;
    end

    always @(state, rd_en, wr_en) begin
        if ((state == 3'b010) & rd_en)
            low_data <= SRAM_DQ;
        else if ((state == 3'b011) & rd_en)
            high_data <= SRAM_DQ;
        
        if (wr_en | rd_en) begin
            if (state <= 3'b001)
                SRAM_ADDR = (address[17:0] >> 1);
            else
                SRAM_ADDR = (address[17:0] >> 1) + 1'b1;
        end
    end

    assign SRAM_WE_N = (rd_en & state >= 3'b001) ? 1'b1:
                       (wr_en) ? (state == 3'b001) ? 1'b0:
                                 (state == 3'b010) ? 1'b0:
                                 (state == 3'b011) ? 1'b1: 1'bz
                        : 1'bz;

    assign SRAM_DQ = ((state == 3'b001) & wr_en) ? write_data[15:0]:
                     ((state == 3'b010) & wr_en) ? write_data[31:16]:
                     16'bz;

    assign read_data = {high_data, low_data};

    assign ready = (wr_en | rd_en) ? (state == 3'b101): 1'b1;

endmodule