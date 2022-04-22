library verilog;
use verilog.vl_types.all;
entity InstMemory is
    port(
        AddrIn          : in     vl_logic_vector(31 downto 0);
        Inst            : out    vl_logic_vector(31 downto 0)
    );
end InstMemory;
