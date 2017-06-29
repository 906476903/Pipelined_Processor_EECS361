library ieee;
use ieee.std_logic_1164.all;


entity Reg_IF_ID is
port(
clk : in std_logic;
pc_4_in :in std_logic_vector(31 downto 0);
instruction_in : in std_logic_vector(31 downto 0);
pc_4_out :out std_logic_vector(31 downto 0);
instruction_out : out std_logic_vector (31 downto 0));
end entity;


architecture struct of Reg_IF_ID is


component register_1bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
end component;

component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;

component not_gate is
port ( x : in std_logic;
z : out std_logic);
end component;

signal clk_not : std_logic;


begin

C0: not_gate port map (clk, clk_not);

pc_reg: register_32bit port map (clk, clk_not, pc_4_in, pc_4_out);
I_reg: register_32bit port map (clk, clk_not, instruction_in, instruction_out);







end struct;



