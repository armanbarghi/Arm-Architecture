library verilog;
use verilog.vl_types.all;
entity EXE_Stage is
    port(
        clk             : in     vl_logic;
        exe_cmd         : in     vl_logic_vector(3 downto 0);
        mem_r_en        : in     vl_logic;
        mem_w_en        : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        val_Rn          : in     vl_logic_vector(31 downto 0);
        val_Rm          : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic;
        shift_operand   : in     vl_logic_vector(11 downto 0);
        signed_imm_24   : in     vl_logic_vector(23 downto 0);
        SR              : in     vl_logic_vector(3 downto 0);
        sel_src1        : in     vl_logic_vector(1 downto 0);
        sel_src2        : in     vl_logic_vector(1 downto 0);
        mem_alu_res     : in     vl_logic_vector(31 downto 0);
        wb_value        : in     vl_logic_vector(31 downto 0);
        exp_en          : in     vl_logic;
        alu_exp_res     : out    vl_logic_vector(31 downto 0);
        br_addr         : out    vl_logic_vector(31 downto 0);
        val_Rm_out      : out    vl_logic_vector(31 downto 0);
        status          : out    vl_logic_vector(3 downto 0)
    );
end EXE_Stage;
