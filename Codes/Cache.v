module Cache(
    clk, rst,
    write_cacheR,
    write_cacheW,
    rdata,
    wdata,
    tag,
    index,
    offset,
    hit,
    data_out
);
    input clk, rst;
    input write_cacheR, write_cacheW;
    input [63:0] rdata;
    input [31:0] wdata;
    input [9:0] tag;
    input [5:0] index;
    input [2:0] offset;
    output hit;
    output[63:0] data_out;

    reg [63:0] way0_data[0:63];
    reg [63:0] way1_data[0:63];

    reg [9:0] way0_tag[0:63];
    reg [9:0] way1_tag[0:63];

    reg way0_valid[0:63];
    reg way1_valid[0:63];

    reg LRU[0:63];
    integer i;

    always @(posedge clk, posedge rst) begin
        if (rst == 1'b1) begin
            for ( i=0 ; i<64 ; i=i+1 ) begin
                way0_valid[i] <= 1'b0;
                way1_valid[i] <= 1'b0;
            end
        end
        else if (write_cacheR == 1'b1) begin
            if (way0_valid[index] == 1'b0) begin
                way0_data[index] <= rdata;
                way0_tag[index] <= tag;
                way0_valid[index] <= 1'b1;
                LRU[index] <= 1'b0;
            end
            else if (way1_valid[index] == 1'b0) begin
                way1_data[index] <= rdata;
                way1_tag[index] <= tag;
                way1_valid[index] <= 1'b1;
                LRU[index] <= 1'b1;
            end
            else if (LRU[index] == 1'b0) begin
                way1_data[index] <= rdata;
                way1_tag[index] <= tag;
                way1_valid[index] <= 1'b1;
                LRU[index] <= 1'b1;
            end
            else if (LRU[index] == 1'b1) begin
                way0_data[index] <= rdata;
                way0_tag[index] <= tag;
                way0_valid[index] <= 1'b1;
                LRU[index] <= 1'b0; 
            end
        end
        else if (write_cacheW == 1'b1) begin
            if ((way0_tag[index] == tag) & (way0_valid[index] == 1'b1)) begin
                LRU[index] <= 1'b0;
                if (offset[2] == 1'b1)
                    way0_data[index][63:32] <= wdata;
                else
                    way0_data[index][31:0] <= wdata;
            end
            else if ((way1_tag[index] == tag) & (way1_valid[index] == 1'b1)) begin
                LRU[index] <= 1'b1;
                if (offset[2] == 1'b1)
                    way1_data[index][63:32] <= wdata;
                else
                    way1_data[index][31:0] <= wdata;
            end
        end
    end

    assign hit = (   ((way0_tag[index] == tag) & (way0_valid[index] == 1'b1)) | ((way1_tag[index] == tag) & (way1_valid[index] == 1'b1))   );

    assign data_out = (way0_tag[index] == tag & way0_valid[index] == 1'b1) ? way0_data[index] :
                      (way1_tag[index] == tag & way1_valid[index] == 1'b1) ? way1_data[index] :
                      64'bz;

endmodule
