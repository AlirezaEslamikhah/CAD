SetActiveLib -work
comp -include "$dsn\src\Q4.vhd" 
comp -include "$dsn\src\TestBench\binarytounary_TB.vhd" 
asim +access +r TESTBENCH_FOR_binarytounary 
wave 
wave -noreg binary_input
wave -noreg unary_output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\binarytounary_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_binarytounary 
