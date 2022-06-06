library verilog;
use verilog.vl_types.all;
entity Cache_Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        MEM_R_EN        : in     vl_logic;
        MEM_W_EN        : in     vl_logic;
        rdata           : out    vl_logic_vector(31 downto 0);
        ready           : out    vl_logic;
        sram_address    : out    vl_logic_vector(31 downto 0);
        sram_wdata      : out    vl_logic_vector(31 downto 0);
        write           : out    vl_logic;
        read            : out    vl_logic;
        sram_rdata      : in     vl_logic_vector(63 downto 0);
        sram_ready      : in     vl_logic
    );
end Cache_Controller;
