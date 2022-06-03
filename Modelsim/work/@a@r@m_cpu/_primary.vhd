library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clock           : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic;
        pc_if           : out    vl_logic_vector(31 downto 0);
        instruction_if  : out    vl_logic_vector(31 downto 0);
        rf0             : out    vl_logic_vector(31 downto 0);
        rf1             : out    vl_logic_vector(31 downto 0);
        rf2             : out    vl_logic_vector(31 downto 0);
        rf3             : out    vl_logic_vector(31 downto 0);
        rf4             : out    vl_logic_vector(31 downto 0);
        rf5             : out    vl_logic_vector(31 downto 0);
        rf6             : out    vl_logic_vector(31 downto 0);
        rf7             : out    vl_logic_vector(31 downto 0);
        rf10            : out    vl_logic_vector(31 downto 0);
        rf11            : out    vl_logic_vector(31 downto 0);
        sram_freeze     : out    vl_logic;
        sram_ready      : out    vl_logic;
        sram_we_n       : out    vl_logic;
        sram_dq         : out    vl_logic_vector(15 downto 0);
        sram_addr       : out    vl_logic_vector(17 downto 0)
    );
end ARM_cpu;
