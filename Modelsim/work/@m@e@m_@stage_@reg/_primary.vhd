library verilog;
use verilog.vl_types.all;
entity MEM_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_r_en_in     : in     vl_logic;
        wb_en_in        : in     vl_logic;
        dest_in         : in     vl_logic_vector(3 downto 0);
        alu_res_in      : in     vl_logic_vector(31 downto 0);
        mem_val_in      : in     vl_logic_vector(31 downto 0);
        mem_r_en_out    : out    vl_logic;
        wb_en_out       : out    vl_logic;
        dest_out        : out    vl_logic_vector(3 downto 0);
        alu_res_out     : out    vl_logic_vector(31 downto 0);
        mem_val_out     : out    vl_logic_vector(31 downto 0)
    );
end MEM_Stage_Reg;
