library ieee;
use ieee.std_logic_1164.all;

entity stall_unit_tb is
end entity;

architecture behav of stall_unit_tb is

component stall_unit is 
port (instruction : in std_logic_vector(31 downto 0);
control : in std_logic_vector(7 downto 0);
stall : out std_logic);
end component;


signal instruction_tb : std_logic_vector(31 downto 0);
signal control_tb : std_logic_vector (7 downto 0);
signal stall_tb : std_logic;


begin

dut: stall_unit port map(instruction_tb, control_tb, stall_tb);
testbench: process begin

instruction_tb <= X"20050001";
control_tb <= "00000000";

wait for 1 ns;
instruction_tb <= X"00421400";

wait for 1 ns;
instruction_tb <= X"8C430000";


wait for 1 ns;

end process;
end behav;



