library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity incrementador_tb is
end incrementador_tb;

architecture behavior of incrementador_tb is
    constant DATA_WIDTH: natural := 8;
    signal C_IN: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal C_OUT: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
    -- Instantiate the unit under test (UUT)
    uut: entity work.incrementador(rtl)
        generic map (DATA_WIDTH => DATA_WIDTH)
        port map (
            C_IN => C_IN,
            C_OUT => C_OUT
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1: Increment 0
        C_IN <= (others => '0');
        wait for 10 ns;
        
        -- Test case 2: Increment 1
        C_IN <= "00000001";
        wait for 10 ns;
        
        -- Test case 3: Increment 255 (should wrap around to 0)
        C_IN <= "11111111";
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process stimulus;
end behavior;
