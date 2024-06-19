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
        entrada  : in  std_logic_vector(DATA_WIDTH-1 downto 0);  -- Input signal
        saida : out std_logic_vector(DATA_WIDTH-1 downto 0)   -- Output signal
    );
end incrementador;

architecture rtl of incrementador is
begin
    -- Process block: increments the input signal by 1
    process(entrada)
    begin
        saida <= std_logic_vector(unsigned(entrada) + 1);
    end process;
end rtl;
