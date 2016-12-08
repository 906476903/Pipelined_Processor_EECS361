onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_pipelined_tb/dut/clk
add wave -noupdate /cpu_pipelined_tb/dut/pc_init
add wave -noupdate /cpu_pipelined_tb/dut/clk_not
add wave -noupdate /cpu_pipelined_tb/dut/pc_reg
add wave -noupdate /cpu_pipelined_tb/dut/pc_reg_out
add wave -noupdate /cpu_pipelined_tb/dut/instruction_in
add wave -noupdate /cpu_pipelined_tb/dut/instruction_out
add wave -noupdate /cpu_pipelined_tb/dut/ID_IF_pc_out
add wave -noupdate /cpu_pipelined_tb/dut/pc_next
add wave -noupdate /cpu_pipelined_tb/dut/control
add wave -noupdate /cpu_pipelined_tb/dut/control_out0
add wave -noupdate /cpu_pipelined_tb/dut/control_out1
add wave -noupdate /cpu_pipelined_tb/dut/control_out2
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rw_out
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rt_in
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rs_in
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rd_in
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/shamt_in
add wave -noupdate /cpu_pipelined_tb/dut/imm16_in
add wave -noupdate /cpu_pipelined_tb/dut/ALUop_in
add wave -noupdate /cpu_pipelined_tb/dut/ALUop_out
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rt_out
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rs_out
add wave -noupdate -radix decimal /cpu_pipelined_tb/dut/Rd_out
add wave -noupdate -radix unsigned /cpu_pipelined_tb/dut/shamt_out
add wave -noupdate /cpu_pipelined_tb/dut/imm16_out
add wave -noupdate /cpu_pipelined_tb/dut/instrExt
add wave -noupdate /cpu_pipelined_tb/dut/busA
add wave -noupdate /cpu_pipelined_tb/dut/aluB
add wave -noupdate /cpu_pipelined_tb/dut/ALUresult_in
add wave -noupdate /cpu_pipelined_tb/dut/carryout
add wave -noupdate /cpu_pipelined_tb/dut/overflow
add wave -noupdate /cpu_pipelined_tb/dut/zero
add wave -noupdate /cpu_pipelined_tb/dut/busB_out
add wave -noupdate /cpu_pipelined_tb/dut/busB_in
add wave -noupdate /cpu_pipelined_tb/dut/busW_in
add wave -noupdate /cpu_pipelined_tb/dut/busW_out0
add wave -noupdate /cpu_pipelined_tb/dut/ALUresult_out0
add wave -noupdate /cpu_pipelined_tb/dut/not_WE
add wave -noupdate /cpu_pipelined_tb/dut/dout_in
add wave -noupdate /cpu_pipelined_tb/dut/dout_out
add wave -noupdate /cpu_pipelined_tb/dut/busW_out1
add wave -noupdate /cpu_pipelined_tb/dut/ALUresult_out1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {404 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 241
configure wave -valuecolwidth 220
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
WaveRestoreZoom {0 ps} {1520 ps}
