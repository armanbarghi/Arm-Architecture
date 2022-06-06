library verilog;
use verilog.vl_types.all;
entity Cache is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        write_cache     : in     vl_logic;
        data            : in     vl_logic_vector(63 downto 0);
        tag             : in     vl_logic_vector(9 downto 0);
        index           : in     vl_logic_vector(5 downto 0);
        hit             : out    vl_logic;
        data_out        : out    vl_logic_vector(63 downto 0)
    );
end Cache;
