vlib work

vlog -timescale 1ns/1ns lab3_part2.v

vsim adder

log {/*}

add wave {/*}

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
force {SW[8]} 0
force {SW[9]} 1
run 10ns
