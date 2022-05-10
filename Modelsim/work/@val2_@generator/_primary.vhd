library verilog;
use verilog.vl_types.all;
entity Val2_Generator is
    port(
        shift_operand   : in     vl_logic_vector(11 downto 0);
        imm             : in     vl_logic;
        val_rm          : in     vl_logic_vector(31 downto 0);
        control_input   : in     vl_logic;
        val2            : out    vl_logic_vector(31 downto 0)
    );
end Val2_Generator;
