library verilog;
use verilog.vl_types.all;
entity ID_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wb_wb_en        : in     vl_logic;
        hazard          : in     vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0);
        status_reg      : in     vl_logic_vector(3 downto 0);
        wb_value        : in     vl_logic_vector(31 downto 0);
        wb_dest         : in     vl_logic_vector(3 downto 0);
        exp_en          : out    vl_logic;
        exp_ready       : out    vl_logic;
        two_src         : out    vl_logic;
        imm             : out    vl_logic;
        mem_r_en        : out    vl_logic;
        mem_w_en        : out    vl_logic;
        wb_en           : out    vl_logic;
        b               : out    vl_logic;
        s               : out    vl_logic;
        exe_cmd         : out    vl_logic_vector(3 downto 0);
        src1            : out    vl_logic_vector(3 downto 0);
        src2            : out    vl_logic_vector(3 downto 0);
        dest            : out    vl_logic_vector(3 downto 0);
        shift_operand   : out    vl_logic_vector(11 downto 0);
        signed_imm_24   : out    vl_logic_vector(23 downto 0);
        val_rn          : out    vl_logic_vector(31 downto 0);
        val_rm          : out    vl_logic_vector(31 downto 0)
    );
end ID_Stage;
