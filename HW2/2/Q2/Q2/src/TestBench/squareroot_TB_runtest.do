SetActiveLib -work
comp -include "$dsn\src\Q2.vhd" 
comp -include "$dsn\src\TestBench\squareroot_TB.vhd" 
asim +access +r TESTBENCH_FOR_squareroot 
wave 
wave -noreg input_vector
wave -noreg ceil_root
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\squareroot_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_squareroot 
