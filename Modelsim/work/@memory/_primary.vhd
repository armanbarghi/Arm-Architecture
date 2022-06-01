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
        mem_result      : out    vl_logic_vector(31 downto 0);
        mem0            : out    vl_logic_vector(31 downto 0);
        mem1            : out    vl_logic_vector(31 downto 0);
        mem2            : out    vl_logic_vector(31 downto 0);
        mem3            : out    vl_logic_vector(31 downto 0);
        mem4            : out    vl_logic_vector(31 downto 0);
        mem5            : out    vl_logic_vector(31 downto 0);
        mem6            : out    vl_logic_vector(31 downto 0)
    );
end Memory;
