SetActiveLib -work
comp -include "$dsn\src\Q5.vhd" 
comp -include "$dsn\src\TestBench\complex_calculator_TB.vhd" 
asim +access +r TESTBENCH_FOR_complex_calculator 
wave 
wave -noreg A
wave -noreg B
wave -noreg multiply
wave -noreg add
wave -noreg subtract
wave -noreg result
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\complex_calculator_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_complex_calculator 
