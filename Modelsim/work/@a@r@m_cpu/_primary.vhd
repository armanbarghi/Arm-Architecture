library verilog;
use verilog.vl_types.all;
entity ARM_cpu is
    port(
        clock           : in     vl_logic;
        rst             : in     vl_logic;
        mode            : in     vl_logic
    );
end ARM_cpu;
