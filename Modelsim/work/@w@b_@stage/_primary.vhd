library verilog;
use verilog.vl_types.all;
entity WB_Stage is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        mem_r_en        : in     vl_logic;
        alu_res         : in     vl_logic_vector(31 downto 0);
        mem_res         : in     vl_logic_vector(31 downto 0);
        wb_val          : out    vl_logic_vector(31 downto 0)
    );
end WB_Stage;
