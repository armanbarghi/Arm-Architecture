# Arm-Architecture
In this project, we have implemented a processor with 5 pipeline stages including:
- Instruction-Fetch
- Instruction-Decode
- Execution
- Memory
- Write-Back

Also, a module called Hazard-Unit has been added to control the processor-dependent commands. The memory related to the data and the instruction is separated and implemented on the FPGA chip.

In the second step, a Forwarding-Unit and a new Hazard-Unit will be added to the project, reducing the stall delay with the help of feedback from dependent data and forwarding it to the next stages to accelerate the program.

In the third step, an SRAM memory controller is implemented on the FPGA chip, and then we implemented Cache memory to enhance the speed of the architecture when using SRAM memory.

In the instruction memory, a bubble sorting algorithm has been implemented to evaluate each step's functionality by a test bench module.
