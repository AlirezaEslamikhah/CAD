SetActiveLib -work
comp -include "$dsn\src\Q3.vhd" 
comp -include "$dsn\src\TestBench\unarytobinary_TB.vhd" 
asim +access +r TESTBENCH_FOR_unarytobinary 
wave 
wave -noreg Unary
wave -noreg Binary
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\unarytobinary_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_unarytobinary 
