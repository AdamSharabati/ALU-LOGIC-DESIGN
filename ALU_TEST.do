quit -sim
vcom ALU.vhd
vsim ALU

add wave A
add wave B
add wave OP
add wave Qout
add wave z
add wave c

force A 1
force B 1
force OP 00
run

force A 8
force B 2
force OP 01
run

force A 3
force B 2
force OP 10
run

force A 8
force B 2
force OP 11
run
