library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity CPU_pipelined is
	generic (
		data_file : string
  	);
port (clk : in std_logic;
      pc_init : in std_logic);
end CPU_pipelined;

architecture structure of CPU_pipelined is

component alu_32 is 
	port (a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		op : in std_logic_vector(5 downto 0);
		shamt : in std_logic_vector (4 downto 0);
		result : out std_logic_vector(31 downto 0);
		carryout : out std_logic;
		overflow : out std_logic;
		zero : out std_logic
		);
end component alu_32;

component fetch_pipe is 
generic (
	mem_file : string
  );
port( 
	clk 	: in std_logic;
	pc : in std_logic_vector (31 downto 0);
	instruction : out std_logic_vector (31 downto 0));
end component;

component syncram is
  generic (
	mem_file : string
  );
  port (
	clk	: in std_logic;
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;

component sram is
  generic (
	mem_file : string
  );
  port (
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;

component register_32bit_32 is
port(
clk :in std_logic;
we: in std_logic;
rw : in std_logic_vector(4 downto 0);
ra : in std_logic_vector(4 downto 0);
rb : in std_logic_vector(4 downto 0);
busw : in  std_logic_vector(31 downto 0);
busa : out  std_logic_vector(31 downto 0);
busb : out  std_logic_vector(31 downto 0));
end component;

component extender is
port ( x: in std_logic_vector (15 downto 0);
	op :in std_logic;
	z: out std_logic_vector (31 downto 0));
end component;


component NAL_pipelined is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
zero, carryout : in std_logic;
pc_out: out std_logic_vector (31 downto 0);
pc_init : in std_logic);
end component;

component mux_32 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component;

component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;

component ID is
port(instruction : in std_logic_vector (31 downto 0);
control : out std_logic_vector (7 downto 0);
ALUop : out std_logic_vector (5 downto 0));
end component;


-- START OF ANY CHANGES FROM SINGLE CYLCE ------------------------------------ 

component Reg_IF_ID is
port(
clk : in std_logic;
pc_4_in :in std_logic_vector(31 downto 0);
instruction_in : in std_logic_vector(31 downto 0);
pc_4_out :out std_logic_vector(31 downto 0);
instruction_out : out std_logic_vector (31 downto 0));
end component;

component mux_8 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(7 downto 0);
	src1  : in  std_logic_vector(7 downto 0);
	z	    : out std_logic_vector(7 downto 0)
  );
end component;



component Reg_ID_EX is
port(
clk : in std_logic;
Rs_in, Rt_in , Rd_in, shamt_in : in std_logic_vector (4 downto 0);
imm16_in : in std_logic_vector(15 downto 0);
control_in : in std_logic_vector (7 downto 0);
ALUop_in :in std_logic_vector (5 downto 0);
Rs_out, Rt_out , Rd_out, shamt_out : out std_logic_vector (4 downto 0);
imm16_out : out std_logic_vector(15 downto 0);
control_out : out std_logic_vector (7 downto 0);
ALUop_out : out std_logic_vector (5 downto 0));
end component;

component Reg_EX_MEM is
port(
clk : in std_logic;
busB_in , busW_in: std_logic_vector (31 downto 0);
ALUresult_in : in std_logic_vector (31 downto 0);
control_in : in std_logic_vector (7 downto 0);
busB_out, busW_out : out std_logic_vector (31 downto 0);
ALUresult_out : out std_logic_vector (31 downto 0);
control_out : out std_logic_vector (7 downto 0));
end component;

component Reg_MEM_WB is
port(
clk : in std_logic;
dout_in, ALUresult_in, busW_in : in std_logic_vector (31 downto 0);
control_in : std_logic_vector (7 downto 0);
dout_out, ALUresult_out, busW_out : out std_logic_vector (31 downto 0);
control_out : out std_logic_vector (7 downto 0));
end component;

-- IFetch Stage Signals
signal clk_not : std_logic;
signal pc_reg, pc_reg_out, pc_reg_out_four : std_logic_vector (31 downto 0);
signal pc_next_temp, pc_next : std_logic_vector(31 downto 0);
signal ID_IF_pc_out : std_logic_vector (31 downto 0);
signal instruction_in, instruction_out : std_logic_vector (31 downto 0);



-- Decode/Reg Stage

signal Rw_out, Rt_in, Rs_in, Rd_in, Rt_out, Rs_out, Rd_out : std_logic_vector(4 downto 0);
signal shamt_in, shamt_out : std_logic_vector (4 downto 0);
signal imm16_in, imm16_out : std_logic_vector (15 downto 0);
signal control, control_in, control_out0 : std_logic_vector(7 downto 0);


 -- EX Stage
signal ALUop_in, ALUop_out, ALUop_temp: std_logic_vector(5 downto 0);
signal control_out1 : std_logic_vector (7 downto 0);
signal busB_out, busB_in : std_logic_vector(31 downto 0);
signal carryout, overflow, zero : std_logic;
signal  busA, instrExt, aluB : std_logic_vector (31 downto 0);
signal busW_in, busW_out0 : std_logic_vector (31 downto 0);
signal ALUresult_in, ALUresult_out0 : std_logic_vector (31 downto 0);





-- Mem Stage

signal not_WE : std_logic;
signal dout_in, dout_out : std_logic_vector(31 downto 0);
signal busW_out1 : std_logic_vector(31 downto 0);


-----------WB STAGE SIGNALS ---------------------------
signal control_out2 : std_logic_vector (7 downto 0);
signal ALUresult_out1 : std_logic_vector (31 downto 0);

begin

-- START OF IFETCH PHASE --------------------------------------------------------------------------------------------------------------------------------
	NOT_CLK_GEN : not_gate port map(clk, clk_not); -- create not of clock for reg signals
	

	M1: alu_32 port map (pc_reg_out, X"00000004", "100000", "XXXXX", pc_next);
	
	--M0: mux_32 port map(pc_init, pc_next_temp, pc_reg_out_four, pc_next);

	PC_Initialization: mux_32 port map(pc_init, pc_next, X"00400020", pc_reg); -- choose between X"00400020" or calcualted next PC

	PC_Register : register_32bit port map(clk, '1', pc_reg, pc_reg_out);-- register latch to hold next pc

	IFETCH: fetch_pipe generic map(data_file) 
	port map(clk, pc_reg_out, instruction_in); -- instruction fetch


-- END OF IFETCH PHASE --
	R0: Reg_IF_ID port map(clk_not, pc_reg_out, instruction_in, ID_IF_pc_out, instruction_out);
-- START OF REG/DEC Phase--

	I0: Rs_in <= instruction_out(25 downto 21);
	I1: Rt_in <= instruction_out(20 downto 16);
	I2: Rd_in <= instruction_out(15 downto 11);
	I3: shamt_in <= instruction_out(10 downto 6);
	I5: imm16_in <= instruction_out(15 downto 0);
	

	CONTROL_GENERATE: ID port map(instruction_out, control, ALUop_in); -- generate control signals
	-- order is RegDst, ALUSrc, MemReg, RegWr, MemWr, Branch, Jump, Extop

	MUX2: mux_8 port map(pc_init, control, "XXXXXXXX", control_in);
	


	MUX1: mux_n 
		generic map (n => 5)
		port map (control(7), Rt_in, Rd_in, Rw_out);  -- choose between Rt and Rd for Rw, which is Rd



-- END OF REG/DEC PHASE --
	R1: Reg_ID_EX port map(clk_not, Rs_in, Rt_in, Rw_out, shamt_in, imm16_in, control_in, ALUop_in, Rs_out, Rt_out, Rd_out, shamt_out, imm16_out, control_out0, ALUop_out);


-- START OF EX PHASE --
	REG: register_32bit_32 port map (clk, control_out0(4), Rw_out, Rs_out, Rt_out, busW_out1, busA, busB_in); -- 32 bit register, MemREg
	

	EXT: extender port map (imm16_out, control_out0(0), instrExt); -- extender for imm16 field


	MUX4: mux_32 port map (control_out0(6), busB_in, instrExt, aluB); --select ALUSrc from imm16 or busb, control is ALUSrc

	ALU: alu_32 port map (busA, aluB, ALUop_out, shamt_out, ALUresult_in, carryout, overflow, zero); -- perform ALU op


	NextAddress: NAL_pipelined port map(ID_IF_pc_out, instruction_out, zero, carryout, pc_next_temp, pc_init); -- next address logic
-- END OF EX PHASE -- 
	R2 : Reg_EX_MEM port map (clk_not, busB_in, busW_in, ALUresult_in, control_out0, busB_out, busW_out0, ALUresult_out0, control_out1);


-- START OF MEM PHASE --
	NOT_WE_GENERATE : not_gate port map(control_out1(3), not_WE); -- make WE and OE opposites
	DMEM: syncram
		generic map (data_file)
		port map( clk_not, '1', not_WE, control_out1(3), ALUresult_out0, busB_out, dout_in);  -- data memory, control is MemWrite

-- END OF MEM PHASE 

	R3: Reg_MEM_WB port map (clk_not, dout_in, ALUresult_out0, busW_out0, control_out1, dout_out, ALUresult_out1, busW_out1, control_out2);

-- START OF WB PHASE --
	MUX3: mux_32 port map (control_out2(5), ALUresult_out1, dout_out, busW_out1);  -- select ALU_out or Mem_out, control is MemReg
	

end structure;
