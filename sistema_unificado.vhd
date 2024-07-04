library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_unificado is
    -- Aqui você define todos os sinais externos que precisa
    Port (
        CLOCK       : in  STD_LOGIC; -- Clock signal
        CLR         : in  STD_LOGIC;
        INT_MAN     : in  STD_LOGIC; -- Interruptor manual
        SEN_PRE     : in  STD_LOGIC; -- Sensor de presença
        TIMER       : in  STD_LOGIC; -- Timer signal
        SEN_LUM     : in  STD_LOGIC_VECTOR(7 downto 0); -- Sensor de luminosidade
        ENTR_HOR    : in  STD_LOGIC_VECTOR(5 downto 0); -- Hora de entrada
        LEDS_ON     : in  STD_LOGIC; -- Sinal para ligar os LEDs
        ALERTA      : out STD_LOGIC; -- Sinal de alerta
        ILUM_NAT    : out STD_LOGIC; -- Iluminação natural
        DISPL_STATUS: out STD_LOGIC_VECTOR(6 downto 0); -- Display de 7 segmentos
        LEDS_OUT    : out STD_LOGIC_VECTOR(7 downto 0) -- LEDs de saída
    );
end sistema_unificado;

architecture Behavioral of sistema_unificado is

    -- Instâncias dos componentes datapath e controladora
    component datapath
        Port (
            CLOCK       : in  STD_LOGIC; -- Clock signal
            TIMER       : in  STD_LOGIC; -- Timer signal
            RESET_SIGNAL: in  STD_LOGIC; -- Asynchronous reset signal
            LOAD_SIGNAL : in  STD_LOGIC; -- Synchronous load signal
            INCR_LED    : in  STD_LOGIC; -- Increment LED signal
            LEDS_ON     : in  STD_LOGIC; -- LEDs on signal
            LEDS        : out STD_LOGIC_VECTOR(7 downto 0); -- LED output
            ENTR_HOR    : in  STD_LOGIC_VECTOR(5 downto 0); -- Enter time
            TIME_ZERO   : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 00
            H0UP        : out STD_LOGIC; -- Greater than 00
            TIME_SEVEN  : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 07
            H0DOWN      : out STD_LOGIC; -- Less than 07
            HOUP        : out STD_LOGIC; -- Greater than 07
            TIME_TWELVE : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 12
            H18DOWN     : out STD_LOGIC; -- Less than 12
            H18UP       : out STD_LOGIC; -- Greater than 12
            TIME_EIGTHTEEN : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 18
            H24DOWN     : out STD_LOGIC; -- Less than 18
            H24UP       : out STD_LOGIC; -- Greater than 18
            SEN_LUM     : in  STD_LOGIC_VECTOR(7 downto 0); -- Sensor luminosity
            L20UP       : out STD_LOGIC; -- Greater than 14
            L180DOWN    : out STD_LOGIC; -- Less than 180
            L180UP      : out STD_LOGIC; -- Greater than 180
            L240DOWN    : out STD_LOGIC; -- Less than 240
            INCR_LEDS   : in  STD_LOGIC_VECTOR(7 downto 0); -- Increment LEDs
            LEDS_IN     : in  STD_LOGIC_VECTOR(7 downto 0); -- Current LEDs value
            LEDS_OUT    : out STD_LOGIC_VECTOR(7 downto 0); -- LEDs value to update
            C_IN        : in  STD_LOGIC -- Carry in, controls whether to increment
        );
    end component;

    component controladora
        Port (
            CLOCK         : in  std_logic; -- Clock signal
            CLR           : in  std_logic; -- Reset signal
            INT_MAN       : in  std_logic; -- Interruptor manual
            SEN_PRE       : in  std_logic; -- Sensor de presença
            H0UP          : in  std_logic; -- Hora maior que 00
            H7UP          : in  std_logic; -- Hora maior que 07
            H7DOWN        : in  std_logic; -- Hora menor que 07
            H18DOWN       : in  std_logic; -- Hora menor que 18
            H18UP         : in  std_logic; -- Hora maior que 18
            H24DOWN       : in  std_logic; -- Hora menor que 24
            H24UP         : in  std_logic; -- Hora maior que 24
            L20UP         : in  std_logic; -- Luminosidade maior que 20
            L180DOWN      : in  std_logic; -- Luminosidade menor que 180
            L180UP        : in  std_logic; -- Luminosidade maior que 180
            L240DOWN      : in  std_logic; -- Luminosidade menor que 240
            L240UP        : in  std_logic; -- Luminosidade maior que 240
            ALERTA        : out std_logic; -- Sinal de alerta
            ILUM_NAT      : out std_logic; -- Iluminação natural
            DISPL_STATUS  : out std_logic_vector(6 downto 0); -- display de 7 segmentos
            INCR_LEDS     : out std_logic -- Incrementa LEDs
        );
    end component;

    -- Sinais internos para conectar componentes
    signal INCR_LEDS   : STD_LOGIC_VECTOR(7 downto 0); -- Incrementa LEDs
    signal LEDS_IN     : STD_LOGIC_VECTOR(7 downto 0); -- Valor atual dos LEDs
    signal LEDS        : STD_LOGIC_VECTOR(7 downto 0); -- Valor dos LEDs
    signal H0UP, H7UP, H7DOWN, H18DOWN, H18UP, H24DOWN, H24UP : STD_LOGIC; -- Sinais de comparação de hora
    signal L20UP, L180DOWN, L180UP, L240DOWN, L240UP : STD_LOGIC; -- Sinais de comparação de luminosidade

begin

    -- Instância do datapath
    datapath_inst: datapath port map(
        CLOCK => CLOCK,
        TIMER => TIMER,
        RESET_SIGNAL => CLR,
        LOAD_SIGNAL => CLR, -- Assumindo CLR como sinal de load também
        INCR_LED => INCR_LEDS,
        LEDS_ON => LEDS_ON,
        LEDS => LEDS,
        ENTR_HOR => ENTR_HOR,
        TIME_ZERO => "000000", --
        H0UP => H0UP,
        TIME_SEVEN => "000111", --
        H0DOWN => H0DOWN,
        HOUP => H7UP,
        TIME_TWELVE => "001100", --
        H18DOWN => H18DOWN,
        H18UP => H18UP,
        TIME_EIGTHTEEN => "010010", -- 
        H24DOWN => H24DOWN,
        H24UP => H24UP,
        SEN_LUM => SEN_LUM,
        L20UP => L20UP,
        L180DOWN => L180DOWN,
        L180UP => L180UP,
        L240DOWN => L240DOWN,
        INCR_LEDS => INCR_LEDS,
        LEDS_IN => LEDS_IN,
        LEDS_OUT => LEDS_OUT,
        C_IN => '0' -- Ajuste conforme necessário
    );

    -- Instância da controladora
    controladora_inst: controladora port map(
        CLOCK => CLOCK,
        CLR => CLR,
        INT_MAN => INT_MAN,
        SEN_PRE => SEN_PRE,
        H0UP => H0UP,
        H7UP => H7UP,
        H7DOWN => H7DOWN,
        H18DOWN => H18DOWN,
        H18UP => H18UP,
        H24DOWN => H24DOWN,
        H24UP => H24UP,
        L20UP => L20UP,
        L180DOWN => L180DOWN,
        L180UP => L180UP,
        L240DOWN => L240DOWN,
        L240UP => L240UP,
        ALERTA => ALERTA,
        ILUM_NAT => ILUM_NAT,
        DISPL_STATUS => DISPL_STATUS,
        INCR_LEDS => INCR_LEDS
    );

    -- Conexão das saídas para o exterior
    LEDS_OUT <= LEDS;

end Behavioral;
