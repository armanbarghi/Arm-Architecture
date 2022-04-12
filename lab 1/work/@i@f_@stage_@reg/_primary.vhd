library verilog;
use verilog.vl_types.all;
entity IF_Stage_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        freeze          : in     vl_logic;
        flush           : in     vl_logic;
        PC_in           : in     vl_logic_vector(31 downto 0);
        Inst_in         : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        Inst            : out    vl_logic_vector(31 downto 0)
    );
end IF_Stage_Reg;
