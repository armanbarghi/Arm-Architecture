module EXE_Stage_Reg (
    clk, rst, flush,
    wb_en_in, mem_r_en_in, mem_w_en_in,
    alu_res_in, st_val_in, dest_in,
    wb_en, mem_r_en, mem_w_en, alu_res,
    st_val, dest
);

input clk, rst, flush, wb_en_in, mem_r_en_in, mem_w_en_in;
input [31:0] alu_res_in, st_val_in;
input [3:0] dest_in;
output reg wb_en, mem_r_en, mem_w_en;
output reg [31:0] alu_res, st_val;
output reg [3:0] dest;

always @(posedge clk, posedge rst) begin
        if ((rst == 1'b1) || (flush == 1'b1)) begin
            mem_r_en <= 1'b0;
            mem_w_en <= 1'b0;
            wb_en <= 1'b0;
            alu_res <= 32'b0;
            st_val <= 32'b0;
            dest <= 4'b0;
        end
        else begin
            mem_r_en <= mem_r_en_in;
            mem_w_en <= mem_w_en_in;
            wb_en <= wb_en_in;
            alu_res <= alu_res_in;
            st_val <= st_val_in;
            dest <= dest_in;
        end
    end
    

endmodule