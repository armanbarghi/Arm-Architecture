module Hazard_Detection_Unit2 (
    clk, rst,
    two_src, mem_r_en,
    src1, src2, exe_dest,
    hazard
);
    input clk, rst;
    input two_src, mem_r_en;
    input [3:0] src1, src2, exe_dest;
    output reg hazard;

    always @(two_src, mem_r_en, src1, src2, exe_dest) begin
        hazard = 1'b0;
        if (mem_r_en == 1'b1) begin
            if (two_src == 1'b1) begin
                if ((exe_dest == src1) || (exe_dest == src2)) begin
                    hazard = 1'b1;
                end
            end
            else begin
                if (exe_dest == src1) begin
                    hazard = 1'b1;
                end
            end
        end
    end
    
endmodule