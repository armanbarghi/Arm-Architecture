library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clock           : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic;
        sram_we_n       : out    vl_logic;
        sram_dq         : inout  vl_logic_vector(15 downto 0);
        sram_addr       : out    vl_logic_vector(17 downto 0)
    );
end ARM_cpu;
