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
    output [63:0] read_data;

    reg [2:0] state;
    reg [15:0] high_data1, high_data0, low_data1, low_data0;

    // We asssume that the SRAM will works in 6 clock

    always @(posedge clk, posedge rst) begin
        if (rst == 1'b1)
            state <= 3'b000;
        else if (state == 3'b110)
            state <= 3'b000;
        else if (wr_en | rd_en)
            state = state + 1'b1;
    end

    always @(state, rd_en, wr_en, SRAM_DQ) begin
        SRAM_ADDR = 18'd0;
        if ((state == 3'b001) & rd_en)
            low_data0 <= SRAM_DQ;
        else if ((state == 3'b010) & rd_en)
            high_data0 <= SRAM_DQ;
        else if ((state == 3'b011) & rd_en)
             low_data1 <= SRAM_DQ;
        else if ((state == 3'b100) & rd_en)
            high_data1 <= SRAM_DQ;
        
        if (rd_en) begin
            if (state == 3'b001)
                SRAM_ADDR = (address[17:0] >> 1);
            else if(state == 3'b010)
                SRAM_ADDR = (address[17:0] >> 1) + 2'b01;
            else if (state == 3'b011)
                SRAM_ADDR = (address[17:0] >> 1) + 2'b10;
            else if(state == 3'b100)
                SRAM_ADDR = (address[17:0] >> 1) + 2'b11;
        end
        if(wr_en)begin
            if (state == 3'b001)
                SRAM_ADDR = (address[17:0] >> 1);
            else if(state == 3'b010)
                SRAM_ADDR = (address[17:0] >> 1) + 2'b01;
        end
    end

    assign SRAM_WE_N = (rd_en & state >= 3'b001) ? 1'b1:
                       (wr_en & state == 3'b001) ? 1'b0:
                       (wr_en & state == 3'b010) ? 1'b0:
                       (wr_en & state == 3'b011) ? 1'b1:
                        1'b1;

    assign SRAM_DQ = ((state == 3'b001) & wr_en) ? write_data[15:0]:
                     ((state == 3'b010) & wr_en) ? write_data[31:16]:
                     16'bz;

    assign read_data = {high_data1, low_data1, high_data0, low_data0};


    assign ready = (state == 3'b110);


endmodule