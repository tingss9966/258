vlib work
vlog -timescale 1ns/1ns part2.v
vsim datapath
log {/*}
add wave {/*}

force {clk} 0 0, 1 5 -repeat 10

force {resetn} 1
force {data_in} 1010110
force {ld_a} 1
run 10ns

force {resetn} 1
force {data_in} 0010011
force {ld_b} 1
force {ld_a} 0
run 10ns

force {resetn} 1
force {data_in} 1010110
force {ld_a} 0
force {ld_b} 0
force {ld_w} 1
run 10ns
