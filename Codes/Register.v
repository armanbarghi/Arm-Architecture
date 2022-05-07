module Register #(parameter N = 32) (
  clk, rst, ld, 
  d_in, 
  d_out
);
  input clk, rst, ld;
  input [N-1:0] d_in;
  output reg [N-1:0] d_out;
  
  always @(posedge clk, posedge rst)
  begin
    if (rst == 1'b1)
      d_out <= 32'b0;
    else if(ld == 1'b1)
      d_out <= d_in;
    else
      d_out <= d_out;
  end
  
endmodule
