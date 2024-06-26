library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_NUMERIC.ALL;

entity datapath is
    Port (
        -- Clock and Timer Signals
        CLOCK       : in  STD_LOGIC; -- Clock signal
        TIMER       : in  STD_LOGIC; -- Timer signal

        -- LED Control Signals
        INCR_LED    : in  STD_LOGIC; -- Increment LED signal
        LEDS_ON     : in  STD_LOGIC; -- LEDs on signal
        LEDS        : out STD_LOGIC_VECTOR(7 downto 0); -- LED output

        -- Time Comparison Signals
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

        -- Sensor Luminosity Signals
        SEN_LUM     : in  STD_LOGIC_VECTOR(7 downto 0); -- Sensor luminosity
        L20UP       : out STD_LOGIC; -- Greater than 14
        L180DOWN    : out STD_LOGIC; -- Less than 180
        L180UP      : out STD_LOGIC; -- Greater than 180
        L240DOWN    : out STD_LOGIC; -- Less than 240

        -- LED Value Signals
        INCR_LEDS   : in  STD_LOGIC_VECTOR(7 downto 0); -- Increment LEDs
        LEDS_IN     : in  STD_LOGIC_VECTOR(7 downto 0); -- Current LEDs value
        LEDS_OUT    : out STD_LOGIC_VECTOR(7 downto 0); -- LEDs value to update
        C_IN        : in  STD_LOGIC -- Carry in, controls whether to increment
    );
end datapath;

architecture rtl of datapath is

    component reg8 is 
        port(
            CLOCK: in std_logic; --clock
            D: in std_logic_vector(7 downto 0); -- register in
            ASYNC_RESET : in std_logic; -- reset
            SYNC_LOAD : in std_logic; -- load
            Q: out std_logic_vector(7 downto 0) --register out
        );
    end reg8;
    
    component incrementer is
        port(
            C_IN  : in  std_logic_vector(7 downto 0);  -- Input signal
            C_OUT : out std_logic_vector(7 downto 0)   -- Output signal
        );
    end incrementer;
    
    component comparator8bits is
        port(
            A  : in  std_logic_vector(7 downto 0);  -- Input signal
            B  : in  std_logic_vector(7 downto 0);  -- Input signal
            EQ : out std_logic;  -- Output signal
            GT : out std_logic;  -- Output signal
            LT : out std_logic   -- Output signal
        );
    end comparator8bits;
    
    component comparator5bits is
        port(
            A  : in  std_logic_vector(4 downto 0);  -- Input signal
            B  : in  std_logic_vector(4 downto 0);  -- Input signal
            EQ : out std_logic;  -- Output signal
            GT : out std_logic;  -- Output signal
            LT : out std_logic   -- Output signal
        );
    end comparator5bits;
    
    component bcd is 
        port (
            C_IN: in std_logic_vector(3 downto 0);
            C_OUT: out std_logic_vector(6 downto 0)
        );
    end bcd;
    
    signal SEN_LUM_REG_OUT, LED_REG_OUT : STD_LOGIC_VECTOR(7 downto 0);
    
    begin
        reg8_LEDS: reg8 port map(
            CLOCK => CLOCK,
            D => SEN_LUM,
            ASYNC_RESET => '0', -- Corrected to constant '0' for example purposes
            SYNC_LOAD => '1', -- Corrected to constant '1' for example purposes
            Q => LED_REG_OUT
        );
        reg8_SEN_LUM: reg8 port map(
            CLOCK => CLOCK,
            D => LEDS_IN,
            ASYNC_RESET => '0', -- Corrected to constant '0' for example purposes
            SYNC_LOAD => '1', -- Corrected to constant '1' for example purposes
            Q => SEN_LUM_REG_OUT
        );
        incrementer_LEDS: incrementer port map(
            C_IN => INCR_LEDS,
            C_OUT => LEDS_OUT
        );

        comparator8bits_HOUP: comparator8bits port map(
            A => SEN_LUM_REG_OUT,
            B => TIME_SEVEN,
            EQ => open,
            GT => HOUP,
            LT => open
        );

        comparator5bits_L180DOWN: comparator5bits port map(
            A => SEN_LUM_REG_OUT(7 downto 3),
            B => "10110",
            EQ => open,
            GT => open,
            LT => L180DOWN
        );
        comparator5bits_L180UP: comparator5bits port map(
            A => SEN_LUM_REG_OUT(7 downto 3),
            B => "10110",
            EQ => open,
            GT => L180UP,
            LT => open
        );
        comparator5bits_L240DOWN: comparator5bits port map(
            A => SEN_LUM_REG_OUT(7 downto 3),
            B => "11110",
            EQ => open,
            GT => open,
            LT => L240DOWN
        );
end rtl; -- rtl