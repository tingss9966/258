vlib work

vlog -timescale 1ns/1ns lab3_part1.v

vsim block

log {/*}

add wave {/*}

force {select[0]} 0 0, 1 20 -repeat 40
force {select[1]} 0 0 ns, 1 40 ns -r 80
force {select[2]} 0 0 ns, 1 80 ns -r 160

force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[4]} 1
force {SW[5]} 0
force {SW[6]} 1
run 160ns


