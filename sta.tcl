# 0. Point to the same liberty you used in Yosys
set lib Nangate.lib

# 1. Read
read_liberty  $lib
read_verilog  alu_simple_syn.v
link_design   alu_simple

# 2. Constraints
read_sdc alu.sdc

# 3. Reports you usually need
report_checks  -path_delay min_max -digits 3
report_tns
report_wns

exit
