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
                ASYNC_RESET => RESET_SIGNAL,
                SYNC_LOAD => LOAD_SIGNAL,
                Q => LED_REG_OUT
            );
            reg8_SEN_LUM: reg8 port map(
                CLOCK => CLOCK,
                D => LEDS_IN,
                ASYNC_RESET => RESET_SIGNAL,
                SYNC_LOAD => LOAD_SIGNAL,
                Q => SEN_LUM_REG_OUT
            );
            comptime00 : comparator5bits port map(
                A => ENTR_HOR(5 downto 0),
                B => "00000",
                EQ => EQ,
                GT => H0UP,
                LT => H0DOWN
            );
            comptime07 : comparator5bits port map(
                A => ENTR_HOR(5 downto 0),
                B => "00111",
                EQ => EQ,
                GT => HOUP,
                LT => H0DOWN
            );
            comptime12 : comparator5bits port map(
                A => ENTR_HOR(5 downto 0),
                B => "01100",
                EQ => EQ,
                GT => H18UP,
                LT => H18DOWN
            );
            comptime18 : comparator5bits port map(
                A => ENTR_HOR(5 downto 0),
                B => "10010",
                EQ => EQ,
                GT => H24UP,
                LT => H24DOWN
            );
            comptime24: comparator5bits port map(
                A => ENTR_HOR(5 downto 0),
                B => "11000",
                EQ => EQ,
                GT => H24UP,
                LT => H24DOWN
            );
            complum20: comparator8bits port map(
                A => SEN_LUM_REG_OUT,
                B => "00001110",
                EQ => EQ,
                GT => L20UP,
                LT => LT
            );
            complum180: comparator8bits port map(
                A => SEN_LUM_REG_OUT,
                B => "10110100",
                EQ => EQ,
                GT => L180UP,
                LT => L240DOWN
            );
            complum240: comparator8bits port map(
                A => SEN_LUM_REG_OUT,
                B => "11110000",
                EQ => EQ,
                GT => GT,
                LT => L240DOWN
            );
            reg_leds: reg8 port map(
                CLOCK => CLOCK,
                D => LEDS_IN,
                ASYNC_RESET => RESET_SIGNAL,
                SYNC_LOAD => LOAD_SIGNAL,
                Q => LEDS_OUT
            );
            incrementer_leds: incrementer port map(
                C_IN => INCR_LEDS,
                C_OUT => LEDS_OUT
            );

end rtl ; -- rtl