library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        carry_in        : in     vl_logic;
        exe_cmd         : in     vl_logic_vector(3 downto 0);
        status_bits     : out    vl_logic_vector(3 downto 0);
        result          : out    vl_logic_vector(31 downto 0)
    );
end ALU;
