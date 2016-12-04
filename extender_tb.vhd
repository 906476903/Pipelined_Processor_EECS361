library ieee;
use ieee.std_logic_1164.all;


entity extender_tb is
end entity;

architecture behav of extender_tb is

component extender is
port ( x: in std_logic_vector (15 downto 0);
op : in std_logic;
z: out std_logic_vector (31 downto 0));
end component;

signal x_tb : std_logic_vector (15 downto 0);
signal op_tb : std_logic;
signal z_tb : std_logic_vector (31 downto 0);

begin

dut: extender port map(x_tb, op_tb, z_tb);

testbench : process begin

x_tb <= X"0001";
wait for 1 ns;

x_tb <= X"8001";
wait for 1 ns;

end process;
end behav;