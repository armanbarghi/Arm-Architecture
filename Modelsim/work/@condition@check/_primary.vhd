library verilog;
use verilog.vl_types.all;
entity ConditionCheck is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        cond            : in     vl_logic_vector(3 downto 0);
        status_reg      : in     vl_logic_vector(3 downto 0);
        cond_out        : out    vl_logic
    );
end ConditionCheck;
