onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_pipelined_tb/dut/clk
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/pc_next
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/IF_pc
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/IF_instruction
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/ID_IF_pc
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/ID_instruction
add wave -noupdate /cpu_pipelined_tb/dut/ID_control
add wave -noupdate /cpu_pipelined_tb/dut/ID_ALUop
add wave -noupdate /cpu_pipelined_tb/dut/EX_control
add wave -noupdate /cpu_pipelined_tb/dut/EX_ALUop
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/EX_ALUresult
add wave -noupdate /cpu_pipelined_tb/dut/MEM_control
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/MEM_ALUresult
add wave -noupdate /cpu_pipelined_tb/dut/MEM_dout
add wave -noupdate /cpu_pipelined_tb/dut/WB_control
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/busB_out
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/busB_in
add wave -noupdate /cpu_pipelined_tb/dut/WB_din
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/WB_busW
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/WB_ALUresult
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2304 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 261
configure wave -valuecolwidth 241
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1044 ps} {2472 ps}
