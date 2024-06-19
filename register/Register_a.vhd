library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration
entity Register_a is
    generic (
        DATA_WIDTH : integer := 8  -- Default data width of 8 bits
    );
    port (
        clk : in std_logic;  -- Clock
        rst : in std_logic;  -- Reset
        en  : in std_logic;  -- Enable
        data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);  -- Input data
        data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0)  -- Output data
    );
end Register_a;

-- Architecture declaration
architecture Behavioral of Register_a is
begin
    -- Process block for register logic
    process (clk, rst)
    begin
        if rising_edge(clk) then  -- Trigger on the rising edge of the clock
            if rst = '1' then  -- Synchronous reset
                data_out <= (others => '0');
            elsif en = '1' then  -- Check if enable is high
                data_out <= data_in;  -- Transfer input to output
            end if;
        end if;
    end process;  -- End of process block
end Behavioral;  -- End of architecture
