module Hazard_Detection_Unit (
    clk, rst,
    two_src, exe_wb_en, mem_wb_en,
    src1, src2, exe_dest, mem_dest,
    hazard
);
    input clk, rst;
    input two_src, exe_wb_en, mem_wb_en;
    input [3:0] src1, src2, exe_dest, mem_dest;
    output reg hazard;

    always @(two_src, exe_wb_en, mem_wb_en, src1, src2, exe_dest, mem_dest) begin
        hazard = 1'b0;
        if (exe_wb_en == 1'b1) begin
            if (two_src == 1'b1) begin
                if ((exe_dest == src1) || (exe_dest == src2)) begin
                    hazard <= 1'b1;
                end
            else
                if (exe_dest == src1) begin
                    hazard <= 1'b1;
                end 
            end
        end
        if (mem_wb_en == 1'b1) begin
            if (two_src == 1'b1) begin
                if ((mem_dest == src1) || (mem_dest == src2)) begin
                    hazard <= 1'b1;
                end
            else
                if (mem_dest == src1) begin
                    hazard <= 1'b1;
                end 
            end
        end
    end
endmodule