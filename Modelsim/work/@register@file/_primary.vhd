library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Dest_wb         : in     vl_logic_vector(3 downto 0);
        Result_WB       : in     vl_logic_vector(31 downto 0);
        writeBackEn     : in     vl_logic;
        reg1            : out    vl_logic_vector(31 downto 0);
        reg2            : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
