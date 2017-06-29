onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_pipelined_tb/dut/clk
add wave -noupdate /cpu_pipelined_tb/dut/pc_init
add wave -noupdate /cpu_pipelined_tb/dut/clk_not
add wave -noupdate /cpu_pipelined_tb/dut/pc_reg
add wave -noupdate /cpu_pipelined_tb/dut/pc_nal
add wave -noupdate /cpu_pipelined_tb/dut/pc_reg_temp
add wave -noupdate /cpu_pipelined_tb/dut/IF_PC
add wave -noupdate /cpu_pipelined_tb/dut/pc_next_temp
add wave -noupdate /cpu_pipelined_tb/dut/pc_next
add wave -noupdate /cpu_pipelined_tb/dut/pc_four
add wave -noupdate /cpu_pipelined_tb/dut/IF_instruction
add wave -noupdate /cpu_pipelined_tb/dut/ID_PC
add wave -noupdate /cpu_pipelined_tb/dut/Rw_out
add wave -noupdate /cpu_pipelined_tb/dut/Rd_in
add wave -noupdate /cpu_pipelined_tb/dut/Rt_out
add wave -noupdate /cpu_pipelined_tb/dut/Rs_out
add wave -noupdate /cpu_pipelined_tb/dut/Rd_out
add wave -noupdate /cpu_pipelined_tb/dut/shamt_in
add wave -noupdate /cpu_pipelined_tb/dut/shamt_out
add wave -noupdate /cpu_pipelined_tb/dut/imm16_in
add wave -noupdate /cpu_pipelined_tb/dut/imm16_out
add wave -noupdate /cpu_pipelined_tb/dut/ID_control
add wave -noupdate /cpu_pipelined_tb/dut/control_temp
add wave -noupdate /cpu_pipelined_tb/dut/ID_ALUop
add wave -noupdate /cpu_pipelined_tb/dut/EX_ALUop
add wave -noupdate /cpu_pipelined_tb/dut/ALUop_temp
add wave -noupdate /cpu_pipelined_tb/dut/EX_busB
add wave -noupdate /cpu_pipelined_tb/dut/ID_busB
add wave -noupdate /cpu_pipelined_tb/dut/carryout
add wave -noupdate /cpu_pipelined_tb/dut/overflow
add wave -noupdate /cpu_pipelined_tb/dut/zero
add wave -noupdate /cpu_pipelined_tb/dut/ID_busA
add wave -noupdate /cpu_pipelined_tb/dut/ID_busA_NAL
add wave -noupdate /cpu_pipelined_tb/dut/EX_busA
add wave -noupdate /cpu_pipelined_tb/dut/instrExt
add wave -noupdate /cpu_pipelined_tb/dut/aluB
add wave -noupdate /cpu_pipelined_tb/dut/MEM_busW
add wave -noupdate /cpu_pipelined_tb/dut/EX_ALUresult
add wave -noupdate /cpu_pipelined_tb/dut/MEM_ALUresult
add wave -noupdate /cpu_pipelined_tb/dut/not_WE
add wave -noupdate /cpu_pipelined_tb/dut/MEM_dout
add wave -noupdate /cpu_pipelined_tb/dut/WB_din
add wave -noupdate /cpu_pipelined_tb/dut/WB_busW
add wave -noupdate /cpu_pipelined_tb/dut/MEM_busB
add wave -noupdate /cpu_pipelined_tb/dut/WB_control
add wave -noupdate /cpu_pipelined_tb/dut/WB_ALUresult
add wave -noupdate /cpu_pipelined_tb/dut/WB_instruction
add wave -noupdate /cpu_pipelined_tb/dut/forwardA
add wave -noupdate /cpu_pipelined_tb/dut/forwardB
add wave -noupdate /cpu_pipelined_tb/dut/Rt_in
add wave -noupdate /cpu_pipelined_tb/dut/Rs_in
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/ID_instruction
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/EX_instruction
add wave -noupdate -radix hexadecimal /cpu_pipelined_tb/dut/MEM_instruction
add wave -noupdate /cpu_pipelined_tb/dut/EX_control
add wave -noupdate /cpu_pipelined_tb/dut/MEM_control
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2018 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 276
configure wave -valuecolwidth 100
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
WaveRestoreZoom {1785 ps} {2643 ps}
