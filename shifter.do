vlib work

vlog -timescale 1ns/1ns shifter.v

vsim shifter

log {/*}

add wave {/*}

force {KEY[0]} 0 0, 1 5 -repeat 10

force {SW[0]} 1
force {SW[1]} 0 
force {SW[2]} 1 
force {SW[3]} 0 
force {SW[4]} 0 
force {SW[5]} 1 
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 0
run 10ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 1
run 10 ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 0
force {KEY[1]} 1
force {KEY[2]} 1
force {KEY[3]} 0
run 10 ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[1]} 1
force {KEY[2]} 0
force {KEY[3]} 1
run 10 ns

force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[4]} 0
force {SW[5]} 1
force {SW[6]} 0
force {SW[7]} 1
force {SW[9]} 1
force {KEY[1]} 0
force {KEY[2]} 0
force {KEY[3]} 1
run 10 ns

