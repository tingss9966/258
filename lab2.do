vlib work

vlog -timescale 1ns/1ns lab2.v

vsim mux

log {/*}

add wave {/*}
# check for u (SW[0 ]), output should be 1
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 10ns

# check for v (SW[1]), output should be 1
force {SW[0]} 0
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 1
run 10ns

# check for w (SW[2]), output should be 1
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 0
run 10ns

# check for u (SW[0]), output should be 0
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0
force {SW[8]} 0
force {SW[9]} 0
run 10ns

# check for w (SW[2]), output should be 0
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 10ns

# check for x (SW[3]), output should be 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 10ns
