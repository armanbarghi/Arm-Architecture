library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        data            : in     vl_logic_vector(31 downto 0);
        mem_result      : out    vl_logic_vector(31 downto 0)
    );
end Memory;
