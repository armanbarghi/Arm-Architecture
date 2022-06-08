library verilog;
use verilog.vl_types.all;
entity SRAM_Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        rd_en           : in     vl_logic;
        wr_en           : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        SRAM_DQ         : inout  vl_logic_vector(15 downto 0);
        ready           : out    vl_logic;
        SRAM_WE_N       : out    vl_logic;
        SRAM_ADDR       : out    vl_logic_vector(17 downto 0);
        read_data       : out    vl_logic_vector(63 downto 0)
    );
end SRAM_Controller;
