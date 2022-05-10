library verilog;
use verilog.vl_types.all;
entity \Register\ is
    generic(
        N               : integer := 32
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        d_in            : in     vl_logic_vector;
        d_out           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end \Register\;
