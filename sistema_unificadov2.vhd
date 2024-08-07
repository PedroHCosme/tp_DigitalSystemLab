library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sistema_unificadov2 is
    Port (
        CLOCK       : in  STD_LOGIC;
        CLR         : in  STD_LOGIC;
        --controladora
        INT_MAN     : in  STD_LOGIC;
        SEN_PRE     : in  STD_LOGIC;
        ALERTA      : out STD_LOGIC;
        ILUM_NAT    : out STD_LOGIC;
        DISPL_STATUS: out STD_LOGIC_VECTOR(6 downto 0);
        --datapath
        TIMER       : in  STD_LOGIC;
        SEN_LUM     : in  STD_LOGIC_VECTOR(7 downto 0);
        ENTR_HOR    : in  STD_LOGIC_VECTOR(5 downto 0);
        LEDS        : out STD_LOGIC_VECTOR(7 downto 0)
    );
end sistema_unificadov2;

architecture rtl of sistema_unificadov2 is

    -- Instâncias dos componentes datapath e controladora
    component datapath
        Port (
            CLOCK       : in  STD_LOGIC;
            TIMER       : in  STD_LOGIC;
            RESET_SIGNAL: in  STD_LOGIC;
            LOAD_SIGNAL : in  STD_LOGIC;
            INCR_LED    : in  STD_LOGIC;
            LEDS        : out STD_LOGIC_VECTOR(7 downto 0);
            ENTR_HOR    : in  STD_LOGIC_VECTOR(5 downto 0);
            TIME_ZERO   : in  STD_LOGIC_VECTOR(5 downto 0);
            H0UP        : out STD_LOGIC;
            TIME_SEVEN  : in  STD_LOGIC_VECTOR(5 downto 0);
            H7DOWN      : out STD_LOGIC;
            H7UP        : out STD_LOGIC;
            TIME_TWELVE : in  STD_LOGIC_VECTOR(5 downto 0);
            H18DOWN     : out STD_LOGIC;
            H18UP       : out STD_LOGIC;
            TIME_EIGTHTEEN : in  STD_LOGIC_VECTOR(5 downto 0);
            H24DOWN     : out STD_LOGIC;
            H24UP       : out STD_LOGIC;
            SEN_LUM     : in  STD_LOGIC_VECTOR(7 downto 0);
            L20UP       : out STD_LOGIC;
            L180DOWN    : out STD_LOGIC;
            L180UP      : out STD_LOGIC;
            L240DOWN    : out STD_LOGIC;
            LEDS_IN     : in  STD_LOGIC_VECTOR(7 downto 0);
            C_IN        : in  STD_LOGIC
        );
    end component;

    component controladora
        Port (
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
    end component;

    -- Sinais internos para conectar componentes
    signal INCR_LEDS   : STD_LOGIC;
    signal LEDS_IN     : STD_LOGIC_VECTOR(7 downto 0);
    signal H0UP, H7UP, H7DOWN, H18DOWN, H18UP, H24DOWN, H24UP : STD_LOGIC;
    signal L20UP, L180DOWN, L180UP, L240DOWN, L240UP : STD_LOGIC;

begin

    -- Instância do datapath
    datapath_inst: datapath port map(
        CLOCK       => CLOCK,
        TIMER       => TIMER,
        RESET_SIGNAL=> CLR,
        LOAD_SIGNAL => CLR, -- Assuming CLR is also the load signal
        INCR_LED    => INCR_LEDS,
        LEDS        => LEDS, -- Directly connect LEDS
        ENTR_HOR    => ENTR_HOR,
        TIME_ZERO   => "000000", -- Adjust based on system logic as necessary
        H7UP        => H7UP,
        TIME_SEVEN  => "000111", -- Adjust as necessary
        H7DOWN      => H7DOWN,
        H0UP        => H0UP,
        TIME_TWELVE => "001100", -- Adjust as necessary
        H18DOWN     => H18DOWN,
        H18UP       => H18UP,
        TIME_EIGTHTEEN => "010010", -- Adjust as necessary
        H24DOWN     => H24DOWN,
        H24UP       => H24UP,
        SEN_LUM     => SEN_LUM,
        L20UP       => L20UP,
        L180DOWN    => L180DOWN,
        L180UP      => L180UP,
        L240DOWN    => L240DOWN,
        LEDS_IN     => LEDS_IN,
        C_IN        => '0' -- Adjust as necessary
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
        L240UP => L240UP, -- Connect L240UP to the controladora component
        ALERTA => ALERTA,
        ILUM_NAT => ILUM_NAT,
        DISPL_STATUS => DISPL_STATUS,
        INCR_LEDS => INCR_LEDS
    );

end rtl;
