library verilog;
use verilog.vl_types.all;
entity Mux2to1_32b is
    port(
        i0              : in     vl_logic_vector(31 downto 0);
        i1              : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end Mux2to1_32b;
