module Status_Reg(
    clk, rst, ld, 
    d_in, 
    d_out
);
    input clk, rst, ld;
    input [3:0] d_in;
    output reg [3:0] d_out;
  
    always @(negedge clk, posedge rst) begin
        if (rst == 1'b1)
            d_out <= 4'b0;
        else begin
            if(ld == 1'b1)
                d_out <= d_in;
            else
                d_out <= d_out;
        end
    end

endmodule
