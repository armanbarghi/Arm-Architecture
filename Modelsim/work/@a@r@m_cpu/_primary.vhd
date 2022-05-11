library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end ARM_cpu;
