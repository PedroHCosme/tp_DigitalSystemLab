library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for the Comparator entity
entity Comparator_tb is
end Comparator_tb;

architecture behavioral of Comparator_tb is
    -- Comparator components
    component Comparator
        Port (
            a       : in  std_logic_vector(4 downto 0);
            b       : in  std_logic_vector(4 downto 0);
            maior  : out std_logic;
            igual  : out std_logic;
            menor  : out std_logic
        );
    end component;

    -- Signals to connect to the comparator
    signal a       : std_logic_vector(4 downto 0) := "00000";
    signal b       : std_logic_vector(4 downto 0) := "00000";
    signal maior  : std_logic;
    signal igual  : std_logic;
    signal menor  : std_logic;

begin
    -- Instantiate the comparator
    uut: Comparator
        Port map (
            a => a,
            b => b,
            maior => maior,
            igual => igual,
            menor => menor
        );

    -- Simulation process
    stim_proc: process
    begin
        -- Test 1: a < b
        a <= "00100";  -- 4
        b <= "01000";  -- 8
        wait for 10 ns;
        
        -- Test 2: a > b
        a <= "01100";  -- 12
        b <= "00110";  -- 6
        wait for 10 ns;
        
        -- Test 3: a == b
        a <= "01010";  -- 10
        b <= "01010";  -- 10
        wait for 10 ns;
        
        -- Test 4: a < b
        a <= "00010";  -- 2
        b <= "01110";  -- 14
        wait for 10 ns;
        
        -- Test 5: a > b
        a <= "01111";  -- 15
        b <= "00000";  -- 0
        wait for 10 ns;

        -- End the simulation
        wait;
    end process;
end behavioral;