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
        reg2            : out    vl_logic_vector(31 downto 0);
        rf0             : out    vl_logic_vector(31 downto 0);
        rf1             : out    vl_logic_vector(31 downto 0);
        rf2             : out    vl_logic_vector(31 downto 0);
        rf3             : out    vl_logic_vector(31 downto 0);
        rf4             : out    vl_logic_vector(31 downto 0);
        rf5             : out    vl_logic_vector(31 downto 0);
        rf6             : out    vl_logic_vector(31 downto 0);
        rf7             : out    vl_logic_vector(31 downto 0);
        rf10            : out    vl_logic_vector(31 downto 0);
        rf11            : out    vl_logic_vector(31 downto 0)
    );
end RegisterFile;
