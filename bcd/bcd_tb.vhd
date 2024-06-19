LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bcd_tb IS
    END bcd_tb;

ARCHITECTURE behavior OF bcd_tb IS 

        -- Component Declaration for the Unit Under Test (UUT)
        COMPONENT bcd
            PORT(
                    entrada : IN  std_logic_vector(3 downto 0);
                    saida : OUT  std_logic_vector(6 downto 0)
                        
                );
                END COMPONENT;

                -- Inputs
                signal entrada : std_logic_vector(3 downto 0) := (others => '0');

                -- Outputs
                signal saida : std_logic_vector(6 downto 0);

                -- Clock period definitions
                constant clk_period : time := 10 ns;

BEGIN

        -- Instantiate the Unit Under Test (UUT)
    uut: bcd PORT MAP (
            entrada => entrada,
                    saida => saida
                        
                      );

                          -- Clock process definitions
                          clk_process: process
                                  begin
                                              wait for clk_period / 2;
                                                      entrada <= not entrada;
                                                          end process;

                                                              -- Stimulus process
                                                              stim_proc: process
                                                                      begin
                                                                                  -- Hold reset state for 100 ns
                                                                                  wait for 100 ns; 

                                                                                          -- Insert stimulus here 
                                                                                          entrada <= "0000"; wait for 10 ns;
                                                                                                  entrada <= "0001"; wait for 10 ns;
                                                                                                          entrada <= "0010"; wait for 10 ns;
                                                                                                                  entrada <= "0011"; wait for 10 ns;
                                                                                                                          entrada <= "0100"; wait for 10 ns;
                                                                                                                                  entrada <= "0101"; wait for 10 ns;
                                                                                                                                          entrada <= "0110"; wait for 10 ns;
                                                                                                                                                  entrada <= "0111"; wait for 10 ns;
                                                                                                                                                          entrada <= "1000"; wait for 10 ns;
                                                                                                                                                                  entrada <= "1001"; wait for 10 ns;
                                                                                                                                                                          entrada <= "1010"; wait for 10 ns;
                                                                                                                                                                                  entrada <= "1011"; wait for 10 ns;
                                                                                                                                                                                          entrada <= "1100"; wait for 10 ns;
                                                                                                                                                                                                  entrada <= "1101"; wait for 10 ns;
                                                                                                                                                                                                          entrada <= "1110"; wait for 10 ns;
                                                                                                                                                                                                                  entrada <= "1111"; wait for 10 ns;

                                                                                                                                                                                                                          wait;
                                                                                                                                                                                                                              end process;

                                                                                                                                                                                                                          END behavior;

