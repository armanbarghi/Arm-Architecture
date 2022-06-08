library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        write_cacheR    : in     vl_logic;
        write_cacheW    : in     vl_logic;
        rdata           : in     vl_logic_vector(63 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        tag             : in     vl_logic_vector(9 downto 0);
        index           : in     vl_logic_vector(5 downto 0);
        offset          : in     vl_logic_vector(2 downto 0);
        hit             : out    vl_logic;
        data_out        : out    vl_logic_vector(63 downto 0)
    );
end Cache;
