# Virtual clock for purely combinational top
create_clock -name vclk -period 10.0

# 2 ns input arrival, 2 ns output required time
set_input_delay  2.0 -clock vclk [all_inputs]
set_output_delay 2.0 -clock vclk [all_outputs]
