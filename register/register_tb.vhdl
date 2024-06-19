library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for the test bench
entity Register_tb is
-- Empty entity as test benches do not need external connections
end Register_tb;

-- Architecture of the test bench
architecture behavior of Register_tb is

    -- Signal declarations
    signal clk     : std_logic := '0'; -- Initialize clock to '0'
    signal rst     : std_logic := '0'; -- Initialize reset to '0'
    signal en      : std_logic := '0'; -- Initialize enable to '0'
    signal data_in : std_logic_vector(7 downto 0) := (others => '0'); -- Input data
    signal data_out: std_logic_vector(7 downto 0); -- Output data

    -- Component declaration of the Register
    component Register_a
        Port (
            clk     : in  std_logic;
            rst     : in  std_logic;
            en      : in  std_logic;
            data_in : in  std_logic_vector(7 downto 0);
            data_out: out std_logic_vector(7 downto 0)
        );
    end component;

begin

    -- Instantiate the Register
    uut: Register_a port map (
        clk => clk,
        rst => rst,
        en => en,
        data_in => data_in,
        data_out => data_out
    );

    -- Clock process (generates a clock signal of 10 ns period)
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns; -- Half period at low
        clk <= '1';
        wait for 5 ns; -- Half period at high
    end process;

    -- Test process
    stim_proc: process
    begin
        -- Reset the register
        rst <= '1'; 
        wait for 20 ns;
        rst <= '0';

        -- Test case 1: Write and retain data
        data_in <= "10101010"; -- Arbitrary data
        en <= '1'; -- Enable writing
        wait for 10 ns;

        -- Test case 2: Check retention with enable low
        en <= '0';
        wait for 10 ns;

        -- Test case 3: Check data change with enable
        data_in <= "01010101";
        en <= '1';
        wait for 10 ns;

        -- Reset while enabled
        rst <= '1';
        wait for 10 ns;
        rst <= '0';

        -- End of test
        wait;
    end process;

end behavior;
