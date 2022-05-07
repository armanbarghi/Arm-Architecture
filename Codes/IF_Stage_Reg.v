module IF_Stage_Reg (
    clk, rst, freeze, flush,
    PC_in, Inst_in,
    PC, Inst
);
    input clk, rst, freeze, flush;
    input [31:0] PC_in, Inst_in;
    output reg [31:0] PC, Inst;
    
    always @(posedge clk, posedge rst) begin
        if(rst == 1'b1) begin
            PC <= 32'b0;
            Inst <= 32'b0;
        end
        else if(flush == 1'b1) begin
            PC <= 32'b0;
            Inst <= 32'b0;
        end
        else if(freeze == 1'b1) begin
            PC <= PC;
            Inst <= Inst;
        end
        else begin
            PC <= PC_in;
            Inst <= Inst_in;
        end 
    end
        
endmodule