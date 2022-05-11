library verilog;
use verilog.vl_types.all;
entity Status_Reg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ld              : in     vl_logic;
        d_in            : in     vl_logic_vector(3 downto 0);
        d_out           : out    vl_logic_vector(3 downto 0)
    );
end Status_Reg;
