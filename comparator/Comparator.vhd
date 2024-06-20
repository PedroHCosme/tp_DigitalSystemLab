library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator is 
    generic(
        DATA_WIDTH : natural := 5
    );
    port(
        a	: in std_logic_vector(DATA_WIDTH-1 downto 0);
        b	: in std_logic_vector(DATA_WIDTH-1 downto 0);
        maior	: out std_logic;
        menor	: out std_logic;
        igual	: out std_logic
    );
end Comparator;

architecture Behavior of Comparator is
    begin
        process(a, b)
        begin
            if a > b then
                maior <= '1';
                igual <= '0';
                menor <= '0';
            elsif a = b then
                maior <= '0';
                igual <= '1';
                menor <= '0';
            else
                maior <= '0';
                igual <= '0';
                menor <= '1';
            end if;
        end process;
    end Behavior;
