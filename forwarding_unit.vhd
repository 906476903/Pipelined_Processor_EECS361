library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity forwarding_unit is
	port (id_ex_rs, id_ex_rt, ex_mem_rd, mem_wb_rd : in std_logic_vector (4 downto 0);
		ex_mem_we, mem_wb_we : in std_logic;
		forwardA, forwardB : out std_logic_vector(1 downto 0)
	);
end entity forwarding_unit;


architecture structure of forwarding_unit is

component forwarding_selector is 
	port ( sel : in std_logic;
		output : out std_logic_vector(1 downto 0)
	);
end component forwarding_selector;

component zero_checker is
	port ( input : in std_logic_vector(4 downto 0);
		output : out std_logic
	);
end component zero_checker;

signal int1, int2, int3, int4, int5, int6, int7, int8, int9, int10, int11, int12, int13, int14, int15, int16, int17, int18 : std_logic;
signal equal1, equal2, equal3, equal4: std_logic_vector(4 downto 0);
signal e1, e2, e3: std_logic;
signal m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14 : std_logic;
signal temp1, temp2 : std_logic_vector(1 downto 0);


begin

	exmem_rd0: zero_checker port map(ex_mem_rd, int1); -- int1 = EX/MEM.registerRd =/= 0
	eq0: xnor_gate_n generic map (n => 5)
		port map(ex_mem_rd, id_ex_rs, equal1); 
	eq01: and_gate port map(equal1(0), equal1(1), int2);
	eq02: and_gate port map(equal1(2), equal1(3), int3);
	eq03: and_gate port map(equal1(4), int2, int4);
	eq04: and_gate port map(int3, int4, int5); -- int5 = EX/MEM.registerRd == ID/EX.registerRs

	eq1: xnor_gate_n generic map (n => 5)
		port map(ex_mem_rd, id_ex_rt, equal2); 
	eq11: and_gate port map(equal2(0), equal2(1), int6);
	eq12: and_gate port map(equal2(2), equal2(3), int7);
	eq13: and_gate port map(equal2(4), int6, int8);
	eq14: and_gate port map(int7, int8, int9); -- int9 = EX/MEM.registerRd == ID/EX.registerRt

	memwb_rd0: zero_checker port map(mem_wb_rd, int10); -- int10 = MEM/WB.registerRd =/= 0

	eq2: xnor_gate_n generic map (n => 5)
		port map(mem_wb_rd, id_ex_rs, equal3); 
	eq21: and_gate port map(equal3(0), equal3(1), int11);
	eq22: and_gate port map(equal3(2), equal3(3), int12);
	eq23: and_gate port map(equal3(4), int11, int13);
	eq24: and_gate port map(int12, int13, int14); -- int14 = MEM/WB.registerRd == ID/EX.registerRs

	eq3: xnor_gate_n generic map (n => 5)
		port map(mem_wb_rd, id_ex_rt, equal4);
	eq31: and_gate port map(equal4(0), equal4(1), int15);
	eq32: and_gate port map(equal4(2), equal4(3), int16);
	eq33: and_gate port map(equal4(4), int15, int17);
	eq34: and_gate port map(int16, int17, int18); -- int18 = MEM/WB.registerRd == ID/EX.registerRt

	ex1: and_gate port map(ex_mem_we, int1, e1);
	ex2: and_gate port map(e1, int5, e2); -- e2 is 1 if ForwardA should be 10

	ex3: and_gate port map(e1, int9, e3); -- e3 is 1 if ForwardB should be 10

	mem1: not_gate port map(int5, m1);
	mem2: and_gate port map(m1, int1, m2);
	mem3: and_gate port map(m2, ex_mem_we, m3);
	mem4: not_gate port map(m3, m4); -- m4 is blue highlight in textbook
	mem5: and_gate port map(mem_wb_we, int10, m5);
	mem6: and_gate port map(m4, int14, m6);
	mem7: and_gate port map(m5, m6, m7); -- m7 is 1 if ForwardA should be 01

	mem8: not_gate port map(int9, m8);
	mem9: and_gate port map(int1, m8, m9);
	mem10: and_gate port map(m9, ex_mem_we, m10);
	mem11: not_gate port map(m10, m11); -- m11 is blue highlight in textbook
	mem12: and_gate port map(mem_wb_we, int10, m12);
	mem13: and_gate port map(m11, int18, m13);
	mem14: and_gate port map(m12, m13, m14); -- m14 is 1 if ForwardB should be 01

	muxA1: mux_n generic map(n => 2)
		port map(e2, "00", "10", temp1);
	muxA2: mux_n generic map(n => 2)
		port map(m7, temp1, "01", forwardA);
	muxB1: mux_n generic map(n => 2)
		port map(e3, "00", "10", temp2);
	muxB2: mux_n generic map(n => 2)
		port map(m14, temp2, "01", forwardB);

end structure;
