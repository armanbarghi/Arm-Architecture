module RegisterFile (
    clk, rst,
    src1, src2, Dest_wb,
    Result_WB,
    writeBackEn,
    reg1, reg2,
    rf0, rf1, rf2, rf3, rf4, rf5, rf6, rf7, rf10, rf11
);
    input clk, rst;
    input [3:0] src1, src2, Dest_wb;
    input [31:0] Result_WB;
    input writeBackEn;
    output [31:0] reg1, reg2;
    output [31:0] rf0, rf1, rf2, rf3, rf4, rf5, rf6, rf7, rf10, rf11;

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
            $display("register_file[%0d]=%0d / time=%0t", Dest_wb, register_file[Dest_wb], $time);
    end

    assign rf0 = register_file[0];
    assign rf1 = register_file[1];
    assign rf2 = register_file[2];
    assign rf3 = register_file[3];
    assign rf4 = register_file[4];
    assign rf5 = register_file[5];
    assign rf6 = register_file[6];
    assign rf7 = register_file[7];
    assign rf10 = register_file[10];
    assign rf11 = register_file[11];

endmodule
