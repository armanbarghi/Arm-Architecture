module EXE_Stage_Reg (
    clk, rst,
    wb_en_in, mem_r_en_in, mem_w_en_in,
    alu_res_in, val_rm_in, dest_in,
    wb_en, mem_r_en, mem_w_en, alu_res,
    val_rm, dest
);

input clk, rst, wb_en_in, mem_r_en_in, mem_w_en_in;
input [31:0] alu_res_in, val_rm_in;
input [3:0] dest_in;
output reg wb_en, mem_r_en, mem_w_en;
output reg [31:0] alu_res, val_rm;
output reg [3:0] dest;

always @(posedge clk, posedge rst) begin
        if (rst == 1'b1) begin
            mem_r_en <= 1'b0;
            mem_w_en <= 1'b0;
            wb_en <= 1'b0;
            alu_res <= 32'b0;
            val_rm <= 32'b0;
            dest <= 4'b0;
        end
        else begin
            mem_r_en <= mem_r_en_in;
            mem_w_en <= mem_w_en_in;
            wb_en <= wb_en_in;
            alu_res <= alu_res_in;
            val_rm <= val_rm_in;
            dest <= dest_in;
        end
    end
    

endmodule