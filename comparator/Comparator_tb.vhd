library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Testbench para a entidade Comparator
entity Comparator_tb is
    end Comparator_tb;
    
    architecture behavioral of Comparator_tb is
        -- Componentes do comparador
        component Comparator
            Port (
                a       : in  std_logic_vector(3 downto 0);
                b       : in  std_logic_vector(3 downto 0);
                maior  : out std_logic;
                igual  : out std_logic;
                menor  : out std_logic
            );
        end component;
    
        -- Sinais para conectar ao comparador
        signal a       : std_logic_vector(3 downto 0) := "0000";
        signal b       : std_logic_vector(3 downto 0) := "0000";
        signal maior  : std_logic;
        signal igual  : std_logic;
        signal menor  : std_logic;
    
    begin
        -- Instancia o comparador
        uut: Comparator
            Port map (
                a => a,
                b => b,
                maior => maior,
                igual => igual,
                menor => menor
            );
    
        -- Processo de simulação
        stim_proc: process
        begin
            -- Teste 1: a < b
            a <= "0010";  -- 2
            b <= "0100";  -- 4
            wait for 10 ns;
            
            -- Teste 2: a > b
            a <= "0110";  -- 6
            b <= "0011";  -- 3
            wait for 10 ns;
            
            -- Teste 3: a == b
            a <= "1010";  -- 10
            b <= "1010";  -- 10
            wait for 10 ns;
            
            -- Teste 4: a < b
            a <= "0001";  -- 1
            b <= "0111";  -- 7
            wait for 10 ns;
            
            -- Teste 5: a > b
            a <= "1111";  -- 15
            b <= "0000";  -- 0
            wait for 10 ns;
    
            -- Finaliza a simulação
            wait;
        end process;
    end behavioral;
