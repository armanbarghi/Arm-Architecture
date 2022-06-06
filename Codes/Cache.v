module Cache(
  rst,
  clk,
  write_cache,
  data,
  tag,
  index,
  hit,
  data_out
);

  input rst, clk;
  input write_cache;
  input [63:0] data;
  input [9:0] tag;
  input [5:0] index;
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

  always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
      for(i=0; i<64; i=i+1) begin
        way0_data[i] = 64'b0;
        way1_data[i] = 64'b0;

        way0_tag[i] = 10'b0;
        way1_tag[i] = 10'b0;

        way0_valid[i] = 1'b0;
        way1_valid[i] = 1'b0;
      end
    end
    else if(write_cache == 1'b1) begin
        if(way0_valid[index] == 1'b0) begin
          way0_data[index] = data;
          way0_tag[index] = tag;
          way0_valid[index] = 1'b1;
          LRU[index] = 1'b0;
        end
        else if(way1_valid[index] == 1'b0) begin
          way1_data[index] = data;
          way1_tag[index] = tag;
          way1_valid[index] = 1'b1;
          LRU[index] = 1'b1;
        end
        else if(LRU[index] == 1'b0) begin
          way1_data[index] = data;
          way1_tag[index] = tag;
          way1_valid[index] = 1'b1;
          LRU[index] = 1'b1;
        end
        else if(LRU[index] == 1'b1) begin
          way0_data[index] = data;
          way0_tag[index] = tag;
          way0_valid[index] = 1'b1;
          LRU[index] = 1'b0; 
        end
    end
  end

  assign hit = (( (way0_tag[index] == tag ) & way0_valid[index] == 1'b1) | (way1_tag[index] == tag ) & way1_valid[index] == 1'b1) ? 1'b1 : 1'b0;

  assign data_out = (way0_tag[index] == tag  & way0_valid[index] == 1'b1) ? way0_data[index] :
                    (way1_tag[index] == tag  & way1_valid[index] == 1'b1) ? way1_data[index] :
                    64'bz;
  endmodule
