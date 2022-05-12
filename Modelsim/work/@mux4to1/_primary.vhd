library verilog;
use verilog.vl_types.all;
entity Mux4to1 is
    generic(
        N               : integer := 32
    );
    port(
        i0              : in     vl_logic_vector;
        i1              : in     vl_logic_vector;
        i2              : in     vl_logic_vector;
        i3              : in     vl_logic_vector;
        sel             : in     vl_logic_vector(1 downto 0);
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end Mux4to1;
