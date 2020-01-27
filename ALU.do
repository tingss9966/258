vlib work

vlog -timescale 1ns/1ns ALU.v

vsim mux

log {/*}

add wave {/*}
force {KEY[0]} 0
force {KEY[1]} 0
force {KEY[2]} 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 0
force {SW[7]} 0
run 10ns
