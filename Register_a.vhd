LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity Register_a is
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

end Register_a;

architecture RTL of Register_a is

begin

	process(clock, async_reset, sync_load)

	begin

		if(async_reset ='1') then

			Q <= (others => '0');

		elsif (clock='1' and clock'event and sync_load= '1') then

			Q <= D;

		end if;

	end process;

end RTL;