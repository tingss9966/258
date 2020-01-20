vlib work

vlog -timescale 1ns/1ns lab2_part3.v

vsim mux

log {/*}

add wave {/*}
# check for u (SW[0 ]), output should be 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 10ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
run 10ns
