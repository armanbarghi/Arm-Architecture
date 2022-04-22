module RegisterFile (
    clk, rst,
    src1, src2, Dest_wb,
    Result_WB,
    writeBackEn,
    reg1, reg2
);
    input clk, rst;
    input [3:0] src1, src2, Dest_wb;
    input[31:0] Result_WB;
    output writeBackEn;
    output [31:0] reg1, reg2;

    reg [31:0] register_file[0:15];
    integer  i;

    assign reg1 = register_file[src1];
    assign reg2 = register_file[src2];

    always @(negedge clk, posedge rst) begin
        if (rst == 1'b1)
            for ( i=0 ; i<15 ; i=i+1 )  // reg 15 is for special purpose
                register_file[i] <= i;
        else if (writeBackEn == 1'b1)
            register_file[Dest_wb] <= Result_WB;
    end
    
endmodule