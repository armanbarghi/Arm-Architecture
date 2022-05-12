library verilog;
use verilog.vl_types.all;
entity Forwarding_Unit is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_wb_en       : in     vl_logic;
        wb_wb_en        : in     vl_logic;
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        mem_dest        : in     vl_logic_vector(3 downto 0);
        wb_dest         : in     vl_logic_vector(3 downto 0);
        sel_src1        : out    vl_logic_vector(1 downto 0);
        sel_src2        : out    vl_logic_vector(1 downto 0)
    );
end Forwarding_Unit;
