library verilog;
use verilog.vl_types.all;
entity EXP1 is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end EXP1;
