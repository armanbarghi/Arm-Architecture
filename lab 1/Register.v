module Register #(parameter N = 32) (
  d_in, clk, sclr, ld, d_out
);
  input [N-1:0] d_in;
  input clk, sclr, ld;
  output [N-1:0] d_out;
  reg [N-1:0] d_out;
  
  always @(posedge clk, posedge sclr)
  begin
    if (sclr == 1'b1)
      d_out = 0;
    else if(ld == 1'b1)
      d_out = d_in;
    else
      d_out = d_out;
  end
  
endmodule
