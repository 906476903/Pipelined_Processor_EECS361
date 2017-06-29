
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;


--INSTRUCTION FETCH UNIT -----------------------------
-- INCLUDES OUTPUTS OF NEXT ADDRESS LOGIC (NAL)- -------

entity fetch_pipe is
 generic (
	mem_file : string
  );
port( 
	clk 	: in std_logic;
	pc : in std_logic_vector (31 downto 0);
	instruction : out std_logic_vector (31 downto 0));
end fetch_pipe;


architecture struct of fetch_pipe is 


-- INSTRUCTION MEMORY -----------------------
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


signal mem_out : std_logic_vector (31 downto 0);  -- INSTRUCTION MEMORY OUT

begin 


C0: syncram generic map(mem_file)
port map(clk, '1', '1', '0', pc, X"00000000", mem_out);

instruction <= mem_out;

end struct;


