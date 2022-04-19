module MEM_Stage_Reg (
    clk, rst,
    mem_r_en_in, wb_en_in,
    dest_in,
    alu_res_in, mem_val_in,
    mem_r_en_out, wb_en_out,
    dest_out,
    alu_res_out, mem_val_out
);
    input clk, rst;
    input mem_r_en_in, wb_en_in;
    input [3:0] dest_in;
    input [31:0] alu_res_in, mem_val_in;
    output reg mem_r_en_out, wb_en_out;
    output reg [3:0] dest_out;
    output reg [31:0] alu_res_out, mem_val_out;

    always @(posedge clk, posedge rst) begin
        if (rst == 1'b1) begin
            mem_r_en_out <= 1'b0;
            wb_en_out <= 1'b0;
            dest_out <= 4'b0;
            alu_res_out <= 32'b0;
            mem_val_out <= 32'b0;
        end
        else begin
            mem_r_en_out <= mem_r_en_in;
            wb_en_out <= wb_en_in;
            dest_out <= dest_in;
            alu_res_out <= alu_res_in;
            mem_val_out <= mem_val_in;
        end
    end
endmodule