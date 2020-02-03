
vlib work

vlog -timescale 1ns/1ns lab4_part2.v

vsim lab4

log {/*}

add wave {/*}

force {KEY[0]} 0 0, 1 5 -repeat 10

force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 0
force {SW[9]} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[7]} 0
force {SW[6]} 0
force {SW[5]} 1
force {SW[9]} 1
run 10ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 0
force {SW[9]} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[7]} 0
force {SW[6]} 1
force {SW[5]} 1
force {SW[9]} 1
run 10ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 0
force {SW[9]} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[7]} 1
force {SW[6]} 0
force {SW[5]} 1
force {SW[9]} 1
run 10ns

force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 0
force {SW[9]} 1
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[7]} 1
force {SW[6]} 1
force {SW[5]} 1
force {SW[9]} 0
run 10ns
