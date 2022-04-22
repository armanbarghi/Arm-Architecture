library verilog;
use verilog.vl_types.all;
entity IF_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        freeze          : in     vl_logic;
        Branch_taken    : in     vl_logic;
        BranchAddr      : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        Inst            : out    vl_logic_vector(31 downto 0)
    );
end IF_Stage;
