library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic;
        pc_if           : out    vl_logic_vector(31 downto 0);
        instruction_if  : out    vl_logic_vector(31 downto 0)
    );
end ARM_cpu;
