library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Register_a_tb is
end Register_a_tb;

architecture teste of Register_a_tb is

component Register_a is 

    generic
    (
            DATA_WIDTH : natural := 8
    );
    
    port( 
            
            clock: in std_logic;
            D: in std_logic_vector((DATA_WIDTH -1) downto 0);
          
            async_reset : in std_logic;
            sync_load : in std_logic;
          
            Q: out std_logic_vector((DATA_WIDTH -1) downto 0)
        );
         
end component;

signal D, Q: std_logic_vector(7 downto 0);
signal sync_load, async_reset : std_logic;
signal clock: std_logic := '0';

begin

Register_a_instance : Register_a generic map (DATA_WIDTH => 8) port map(
    D=>D, Q=>Q, 
    sync_load=>sync_load, 
    async_reset=>async_reset,
    clock=>clock);

-- Dados de entrada:
clock <= not clock after 5 ns when now < 100 ns else '0';
D <= x"00", x"80" after 20 ns, x"70" after 40 ns, x"40" after 60 ns;
sync_load <= '0', '1' after 10 ns, '0' after 30 ns;
async_reset <= '0', '1' after 10 ns, '0' after 30 ns;

end teste;