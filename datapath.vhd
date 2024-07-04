library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datapath is
    Port (
        -- Clock and Timer Signals
        CLOCK       : in  STD_LOGIC; -- Clock signal
        TIMER       : in  STD_LOGIC; -- Timer signal

        -- Reset and Load Signals
        RESET_SIGNAL: in  STD_LOGIC; -- Asynchronous reset signal
        LOAD_SIGNAL : in  STD_LOGIC; -- Synchronous load signal

        -- LED Control Signals
        INCR_LED    : in  STD_LOGIC; -- Increment LED signal
        LEDS_ON     : in  STD_LOGIC; -- LEDs on signal
        LEDS        : out STD_LOGIC_VECTOR(7 downto 0); -- LED output

        -- Time Comparison Signals
        ENTR_HOR    : in  STD_LOGIC_VECTOR(5 downto 0); -- Enter time
        TIME_ZERO   : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 00
        H7UP        : out STD_LOGIC; -- Greater than 00
        TIME_SEVEN  : in  STD_LOGIC_VECTOR(5 downto 0); -- Time 07
        H7DOWN      : out STD_LOGIC; -- Less than 07
        H0UP        : out STD_LOGIC; -- Greater than 07
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

    component Register_a is 
        port(
            CLOCK: in std_logic; --clock
            D: in std_logic_vector(7 downto 0); -- register in
            ASYNC_RESET : in std_logic; -- reset
            SYNC_LOAD : in std_logic; -- load
            Q: out std_logic_vector(7 downto 0) --register out
        );
    end component;

    component incrementador is
        port(
            C_IN  : in  std_logic_vector(7 downto 0);  -- Input signal
            C_OUT : out std_logic_vector(7 downto 0)   -- Output signal
        );
    end component;

    component Comparator8bits is
        port(
            A  : in  std_logic_vector(7 downto 0);  -- Input signal
            B  : in  std_logic_vector(7 downto 0);  -- Input signal
            EQ : out std_logic;  -- Output signal
            GT : out std_logic;  -- Output signal
            LT : out std_logic   -- Output signal
        );
    end component;

    component Comparator5bits is
        port(
            A  : in  std_logic_vector(4 downto 0);  -- Input signal
            B  : in  std_logic_vector(4 downto 0);  -- Input signal
            EQ : out std_logic;  -- Output signal
            GT : out std_logic;  -- Output signal
            LT : out std_logic   -- Output signal
        );
    end component;

    component bcd is 
        port (
            C_IN: in std_logic_vector(3 downto 0);
            C_OUT: out std_logic_vector(6 downto 0)
        );
    end component;

    signal SEN_LUM_REG_OUT, LED_REG_OUT : STD_LOGIC_VECTOR(7 downto 0);
    signal EQ, LT, GT : std_LOGIC;
    signal H24UP_comptime18, H24UP_comptime24 : std_LOGIC;
    signal LEDS_OUT_reg, LEDS_OUT_inc : STD_LOGIC_VECTOR(7 downto 0); -- Intermediate signals for LEDs
    signal select_leds_output : std_logic := '0'; -- Control signal for multiplexing LED outputs

    -- Intermediate signals for comparators
    signal H7DOWN_comptime00, H7DOWN_comptime07 : std_logic;
    signal H24DOWN_comptime18, H24DOWN_comptime24 : std_logic;
    signal L240DOWN_complum180, L240DOWN_complum240 : std_logic;

    begin
        reg8_LEDS: Register_a port map(
            CLOCK => CLOCK,
            D => SEN_LUM,
            ASYNC_RESET => RESET_SIGNAL,
            SYNC_LOAD => LOAD_SIGNAL,
            Q => LED_REG_OUT
        );
        reg8_SEN_LUM: Register_a port map(
            CLOCK => CLOCK,
            D => LEDS_IN,
            ASYNC_RESET => RESET_SIGNAL,
            SYNC_LOAD => LOAD_SIGNAL,
            Q => SEN_LUM_REG_OUT
        );
        comptime00 : Comparator5bits port map(
            A => ENTR_HOR(4 downto 0),
            B => "00000",
            EQ => EQ,
            GT => H7UP,
            LT => H7DOWN_comptime00
        );
        comptime07 : Comparator5bits port map(
            A => ENTR_HOR(4 downto 0),
            B => "00111",
            EQ => EQ,
            GT => H0UP,
            LT => H7DOWN_comptime07
        );
        comptime12 : Comparator5bits port map(
            A => ENTR_HOR(4 downto 0),
            B => "01100",
            EQ => EQ,
            GT => H18UP,
            LT => H18DOWN
        );
        comptime18 : Comparator5bits port map(
            A => ENTR_HOR(4 downto 0),
            B => "10010",
            EQ => EQ,
            GT => H24UP_comptime18,
            LT => H24DOWN_comptime18
        );
        comptime24: Comparator5bits port map(
            A => ENTR_HOR(4 downto 0),
            B => "11000",
            EQ => EQ,
            GT => H24UP_comptime24,
            LT => H24DOWN_comptime24
        );
        complum20: Comparator8bits port map(
            A => SEN_LUM_REG_OUT,
            B => "00001110",
            EQ => EQ,
            GT => L20UP,
            LT => LT
        );
        complum180: Comparator8bits port map(
            A => SEN_LUM_REG_OUT,
            B => "10110100",
            EQ => EQ,
            GT => L180UP,
            LT => L240DOWN_complum180
        );
        complum240: Comparator8bits port map(
            A => SEN_LUM_REG_OUT,
            B => "11110000",
            EQ => EQ,
            GT => GT,
            LT => L240DOWN_complum240
        );
        reg_leds: Register_a port map(
            CLOCK => CLOCK,
            D => LEDS_IN,
            ASYNC_RESET => RESET_SIGNAL,
            SYNC_LOAD => LOAD_SIGNAL,
            Q => LEDS_OUT_reg  -- Output to intermediate signal
        );
        incrementer_leds: incrementador port map(
            C_IN => INCR_LEDS,
            C_OUT => LEDS_OUT_inc  -- Output to another intermediate signal
        );

        -- Multiplexing logic for LED outputs
        LEDS_OUT <= LEDS_OUT_reg when select_leds_output = '0' else LEDS_OUT_inc;

        -- Combining conditions for H7DOWN, H24DOWN, and L240DOWN
        H7DOWN <= H7DOWN_comptime00 or H7DOWN_comptime07;
        H24DOWN <= H24DOWN_comptime18 or H24DOWN_comptime24;
        L240DOWN <= L240DOWN_complum180 or L240DOWN_complum240;

        H24UP <= H24UP_comptime18 OR H24UP_comptime24; -- Combining conditions for H24UP
end rtl;
