library verilog;
use verilog.vl_types.all;
entity Hazard_Detection_Unit2 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        two_src         : in     vl_logic;
        exe_mem_r_en    : in     vl_logic;
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        exe_dest        : in     vl_logic_vector(3 downto 0);
        hazard          : out    vl_logic
    );
end Hazard_Detection_Unit2;
