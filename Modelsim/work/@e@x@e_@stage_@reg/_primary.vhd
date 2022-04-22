library verilog;
use verilog.vl_types.all;
entity EXE_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        wb_en_in        : in     vl_logic;
        mem_r_en_in     : in     vl_logic;
        mem_w_en_in     : in     vl_logic;
        alu_res_in      : in     vl_logic_vector(31 downto 0);
        val_rm_in       : in     vl_logic_vector(31 downto 0);
        dest_in         : in     vl_logic_vector(3 downto 0);
        wb_en           : out    vl_logic;
        mem_r_en        : out    vl_logic;
        mem_w_en        : out    vl_logic;
        alu_res         : out    vl_logic_vector(31 downto 0);
        val_rm          : out    vl_logic_vector(31 downto 0);
        dest            : out    vl_logic_vector(3 downto 0)
    );
end EXE_Stage_Reg;
