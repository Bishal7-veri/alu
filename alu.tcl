# Read your Verilog file
read_verilog alu_design.v

hierarchy -check -top alu_simple

proc

techmap


# Perform mapping
dfflibmap -liberty Nangate.lib
abc -liberty Nangate.lib

clean
# Write synthesized netlist
write_verilog -noattr alu_simple_synth.v

write_blif alu_simple.blif
write_json alu_simple.json

stat
