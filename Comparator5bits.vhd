library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator5bits is 
    generic(
        DATA_WIDTH : natural := 5
    );
    port(
        A	: in std_logic_vector(DATA_WIDTH-1 downto 0);
        B	: in std_logic_vector(DATA_WIDTH-1 downto 0);
        GT	: out std_logic;
        LT	: out std_logic;
        EQ	: out std_logic
    );
end Comparator5bits;

architecture Behavior of Comparator5bits is
    begin
        process(A, B)
        begin
            if A > B then
                GT <= '1';
                EQ <= '0';
                LT <= '0';
            elsif A = B then
                GT <= '0';
                EQ <= '1';
                LT <= '0';
            else
                GT <= '0';
                EQ <= '0';
                LT <= '1';
            end if;
        end process;
    end Behavior;
