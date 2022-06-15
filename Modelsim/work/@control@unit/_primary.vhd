library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        s               : in     vl_logic;
        mode            : in     vl_logic_vector(1 downto 0);
        op_code         : in     vl_logic_vector(3 downto 0);
        mem_r_en        : out    vl_logic;
        mem_w_en        : out    vl_logic;
        wb_en           : out    vl_logic;
        b               : out    vl_logic;
        s_out           : out    vl_logic;
        exp_en          : out    vl_logic;
        exp_ready       : out    vl_logic;
        exe_cmd         : out    vl_logic_vector(3 downto 0)
    );
end ControlUnit;
