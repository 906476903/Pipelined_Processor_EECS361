library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity forwarding_selector is 
	port ( sel : in std_logic;
		output : out std_logic_vector(1 downto 0)
	);
end entity forwarding_selector;

architecture structure of forwarding_selector is

component mux is
	port ( sel : in std_logic;
		src0 : in std_logic;
		src1 : in std_logic;
		z : out std_logic
	);
end component mux;

begin

	mux1: mux port map (sel, '0', '1', output(1));
	mux2: mux port map (sel, '1', '0', output(0));

end structure;
