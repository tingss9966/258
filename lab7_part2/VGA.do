vlib work
vlog -timescale 1ns/1ns part2.v
vsim control
log {/*}
add wave {/*}

force {clk} 0 0, 1 5 -repeat 10

force {resetn} 1
force {go} 1 
force {plot} 1 
run 10 ns

force {resetn} 1
force {go} 0
force {plot} 1  
run 10 ns

force {resetn} 1
force {go} 1 
force {plot} 1 
run 10 ns

force {resetn} 1
force {go} 1 
force {plot} 1 
run 10 ns

force {resetn} 1
force {go} 1 
force {plot} 0 
run 10 ns

force {resetn} 1
force {go} 1 
force {plot} 1 
run 10 ns
