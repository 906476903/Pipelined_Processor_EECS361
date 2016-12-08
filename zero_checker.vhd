library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity zero_checker is
	port ( input : in std_logic_vector(4 downto 0);
		output : out std_logic
	);
end entity zero_checker;

architecture structure of zero_checker is 

signal temp1, temp2, temp3 : std_logic;

begin

	OR1: or_gate port map (input(4), input(3), temp1);
	OR2: or_gate port map (input(2), input(1), temp2);
	OR3: or_gate port map (temp1, input(0), temp3);
	OR4: or_gate port map (temp2, temp3, output);

end structure;
