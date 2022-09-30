library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clock           : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic;
        pc_if           : out    vl_logic_vector(31 downto 0);
        instruction_if  : out    vl_logic_vector(31 downto 0);
        mem0            : out    vl_logic_vector(31 downto 0);
        mem1            : out    vl_logic_vector(31 downto 0);
        mem2            : out    vl_logic_vector(31 downto 0);
        mem3            : out    vl_logic_vector(31 downto 0);
        mem4            : out    vl_logic_vector(31 downto 0);
        mem5            : out    vl_logic_vector(31 downto 0);
        mem6            : out    vl_logic_vector(31 downto 0)
    );
end ARM_cpu;
