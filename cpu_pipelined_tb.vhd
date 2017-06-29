
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;


entity CPU_pipelined_tb is
end entity;

architecture behav of CPU_pipelined_tb is

component CPU_pipelined is
	generic (
		data_file : string
  	);
port (clk : in std_logic;
      pc_init: in std_logic;
 pc_trigger, pc_stall, pc_forward, pc_mem_stall : in std_logic);
end component;


signal clk_tb, pc_init_tb, pc_trigger_tb, pc_stall_tb, pc_forward_tb, pc_mem_stall_tb: std_logic;
signal mem_file : string (26 downto 1);


begin

dut : CPU_pipelined generic map (data_file => "bills_branch.dat") port map(clk_tb, pc_init_tb,pc_trigger_tb,pc_stall_tb, pc_forward_tb, pc_mem_stall_tb);

testbench: process begin


clk_tb <= '0';

pc_init_tb <='1';

wait for 200 ps;

clk_tb <= '1';
pc_trigger_tb <= '1';

wait for 200 ps;
pc_init_tb <= '0';
pc_stall_tb <= '1';
clk_tb <= '0';

wait for 200 ps;
pc_trigger_tb <= '0';
pc_mem_stall_tb <= '1';
clk_tb <= '1';

wait for 200 ps;
pc_stall_tb <= '0';


clk_tb <= '0';
pc_forward_tb <= '1';

wait for 200 ps;


clk_tb <= '1';

wait for 200 ps;
pc_forward_tb <= '0';

clk_tb <= '0';

wait for 200 ps;


clk_tb <= '1';

wait for 200 ps;

clk_tb <= '0';

wait for 200 ps;


clk_tb <= '1';

wait for 200 ps;
pc_mem_stall_tb <= '0';

G0: for i in 0 to 100 loop

clk_tb <= '0';

wait for 200 ps;

clk_tb <= '1';


wait for 200 ps;

end loop;

end process;

end behav;



