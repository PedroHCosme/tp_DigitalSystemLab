library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity incrementador is
    generic 
    (
        DATA_WIDTH: natural := 8
    );
    Port 
    (
        C_IN : in  std_logic_vector(DATA_WIDTH-1 downto 0);  -- Input signal
        C_OUT : out std_logic_vector(DATA_WIDTH-1 downto 0)   -- Output signal
    );
end incrementador;

architecture rtl of incrementador is
begin
    -- Process block: increments the input signal by 1
    process(C_IN)
    begin
        C_OUT <= std_logic_vector(unsigned(C_IN) + 1);
    end process;
end rtl;
