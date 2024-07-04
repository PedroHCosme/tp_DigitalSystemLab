library ieee;
use ieee.std_logic_1164.all;

entity controladora is 
    port (
        CLOCK         : in  std_logic;
        CLR           : in  std_logic;
        INT_MAN       : in  std_logic;
        SEN_PRE       : in  std_logic;
        H0UP          : in  std_logic;
        H7UP          : in  std_logic;
        H7DOWN        : in  std_logic;
        H18DOWN       : in  std_logic;
        H18UP         : in  std_logic;
        H24DOWN       : in  std_logic;
        H24UP         : in  std_logic;
        L20UP         : in  std_logic;
        L180DOWN      : in  std_logic;
        L180UP        : in  std_logic;
        L240DOWN      : in  std_logic;
        L240UP        : in  std_logic;
        
        ALERTA        : out std_logic;
        ILUM_NAT      : out std_logic;
        DISPL_STATUS  : out std_logic_vector(6 downto 0); -- display de 7 segmentos
        INCR_LEDS     : out std_logic
    );
end controladora;

architecture RTL of controladora is

    type state_type is (INIT, DETECTA_PRESENCA, ERRO, MODO_NOTURNO, DESLIGAMENTO_AUTOMATICO, AJUSTE_ILUM, MANUTENCAO_ILUM, MEDIR_LUMINOSIDADE, MANUAL);
    
    signal estado_atual   : state_type := INIT;
    signal proximo_estado : state_type;

begin

    sequencial:
    process (CLOCK, CLR) is
    begin 
        if (CLR = '1') then
            estado_atual <= INIT;
        elsif (rising_edge(CLOCK)) then
            estado_atual <= proximo_estado;
        end if;
    end process sequencial;
    
    combinational:
    process (estado_atual, CLR, INT_MAN, SEN_PRE, H0UP, H7UP, H7DOWN, H18DOWN, H18UP, H24DOWN, H24UP, L20UP, L180DOWN, L180UP, L240DOWN, L240UP) is
    begin
        case estado_atual is
        
            when INIT =>
                ALERTA       <= '0';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0000000";
                INCR_LEDS    <= '0';
                
                if (INT_MAN = '1') then
                    proximo_estado <= MANUAL;
                elsif (H24UP = '1' or L20UP = '0' or L240UP = '1') then
                    proximo_estado <= ERRO;
                elsif (INT_MAN = '0') then
                    proximo_estado <= DETECTA_PRESENCA;
                end if;
                
            when DETECTA_PRESENCA =>
                ALERTA       <= '0';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0000000";
                INCR_LEDS    <= '0';
                
                if (INT_MAN = '0' and H7UP = '1' and H18DOWN = '1' and SEN_PRE = '0') then
                    proximo_estado <= DETECTA_PRESENCA;
                elsif (INT_MAN = '0' and ((H24DOWN = '1' or H18UP = '1') or (H7DOWN = '1' and H0UP = '1'))) then
                    proximo_estado <= MODO_NOTURNO;
                elsif (INT_MAN = '1') then 
                    proximo_estado <= MANUAL;
                elsif (H24UP = '1' or L240UP = '1' or L20UP = '0') then
                    proximo_estado <= ERRO;
                elsif (INT_MAN = '0' and H7UP = '1' and H18DOWN = '1' and SEN_PRE = '1') then
                    proximo_estado <= MEDIR_LUMINOSIDADE;
                end if;
                
            when MEDIR_LUMINOSIDADE =>
                ALERTA       <= '0';
                ILUM_NAT     <= '1';
                DISPL_STATUS <= "0000010";
                INCR_LEDS    <= '0';
                
                if (INT_MAN = '0' and ((H24DOWN = '1' or H18UP = '1') or (H7DOWN = '1' and H0UP = '1'))) then
                    proximo_estado <= MODO_NOTURNO;
                elsif (INT_MAN = '1') then 
                    proximo_estado <= MANUAL;
                elsif (H24UP = '1' or L240UP = '1' or L20UP = '0') then
                    proximo_estado <= ERRO;
                elsif (INT_MAN = '0') then
                    proximo_estado <= AJUSTE_ILUM;
                end if;
                
            when AJUSTE_ILUM =>
                ALERTA       <= '0';
                ILUM_NAT     <= '1';
                DISPL_STATUS <= "0000011";
                INCR_LEDS    <= '1';
                
                if (INT_MAN = '0' and ((H24DOWN = '1' or H18UP = '1') or (H7DOWN = '1' and H0UP = '1'))) then
                    proximo_estado <= MODO_NOTURNO;
                elsif (INT_MAN = '1') then 
                    proximo_estado <= MANUAL;
                elsif (H24UP = '1' or L240UP = '1' or L20UP = '0') then
                    proximo_estado <= ERRO;
                elsif (INT_MAN = '0' and H18DOWN = '1' and H7UP = '1' and L180DOWN = '1') then
                    proximo_estado <= AJUSTE_ILUM;
                elsif (INT_MAN = '0' and H18DOWN = '1' and H7UP = '1' and L180UP = '1') then
                    proximo_estado <= MANUTENCAO_ILUM;
                end if;
                
            when MANUTENCAO_ILUM =>
                ALERTA       <= '0';
                ILUM_NAT     <= '1';
                DISPL_STATUS <= "0000100";
                
                if (INT_MAN = '1') then 
                    proximo_estado <= MANUAL;
                elsif (H24UP = '1' or L240UP = '1' or L20UP = '0') then
                    proximo_estado <= ERRO;
                elsif (INT_MAN = '0' and SEN_PRE = '1' and L180UP = '1') then
                    proximo_estado <= MANUTENCAO_ILUM;
                else
                    proximo_estado <= ERRO;
                end if;
                
            when ERRO =>
                ALERTA       <= '1';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0001001";
                
                if (H24DOWN = '1' and L240DOWN = '1' and L20UP = '1') then 
                    proximo_estado <= INIT;
                else
                    proximo_estado <= ERRO;
                end if;
                
            when DESLIGAMENTO_AUTOMATICO =>
                ALERTA       <= '0';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0000000";
                
                if (H24UP = '1' or L240UP = '1' or L20UP = '0') then
                    proximo_estado <= ERRO;
                else
                    proximo_estado <= INIT;
                end if;
                
            when MODO_NOTURNO =>
                ALERTA       <= '0';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0000101";
                INCR_LEDS    <= '1';
                
                if (INT_MAN = '0' and H7UP = '1' and H18DOWN = '1') then 
                    proximo_estado <= DETECTA_PRESENCA;
                elsif (INT_MAN = '1') then 
                    proximo_estado <= MANUAL;
                end if;
                
            when MANUAL =>
                ALERTA       <= '1';
                ILUM_NAT     <= '0';
                DISPL_STATUS <= "0001001";
                
                if (H24DOWN = '1' and L240DOWN = '1' and L20UP = '1') then 
                    proximo_estado <= INIT;
                else
                    proximo_estado <= ERRO;
                end if;
                
            when others =>
                proximo_estado <= ERRO;
                
        end case;
    end process combinational;

end RTL;
