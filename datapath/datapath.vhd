library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_NUMERIC.ALL;

entity datapath is
    Port (  CLOCK : in  STD_LOGIC; --clock 
            TIMER : in  STD_LOGIC; --timer
            INCR_LED : in STD_LOGIC; --increment LED
            SEN_LUM : in  STD_LOGIC_VECTOR (7 downto 0); -- sensor luminosity
            LEDS_ON : in STD_LOGIC; -- leds on
            LEDS : out STD_LOGIC_VECTOR(7 downto 0); -- leds

            -----------------TIME-----------------
            ENTR_HOR : in STD_LOGIC_VECTOR(5 downto 0); -- enter time

            TIME_ZERO : in STD_LOGIC_VECTOR(5 downto 0); -- time 00
            H0UP : out STD_LOGIC; -- greater than 00

            TIME_SEVEN : in STD_LOGIC_VECTOR(5 downto 0); -- time 07
            H0DOWN : out STD_LOGIC; -- less than 07
            HOUP : out STD_LOGIC; -- greater than 07

            TIME_TWELVE : in STD_LOGIC_VECTOR(5 downto 0); -- time 12
            H18DOWN : out STD_LOGIC; -- less than 12
            H18UP : out STD_LOGIC; -- greater than 12

            TIME_EIGTHTEEN : in STD_LOGIC_VECTOR(5 downto 0); -- time 18
            H24DOWN : out STD_LOGIC; -- less than 18
            H24UP : out STD_LOGIC; -- greater than 18
            ----------------------------------------
    )
end datapath;