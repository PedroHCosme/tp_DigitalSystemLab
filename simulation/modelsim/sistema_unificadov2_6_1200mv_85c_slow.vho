-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "07/04/2024 08:34:19"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sistema_unificadov2 IS
    PORT (
	CLOCK : IN std_logic;
	CLR : IN std_logic;
	INT_MAN : IN std_logic;
	SEN_PRE : IN std_logic;
	ALERTA : OUT std_logic;
	ILUM_NAT : OUT std_logic;
	DISPL_STATUS : OUT std_logic_vector(6 DOWNTO 0);
	TIMER : IN std_logic;
	SEN_LUM : IN std_logic_vector(7 DOWNTO 0);
	ENTR_HOR : IN std_logic_vector(5 DOWNTO 0);
	LEDS : OUT std_logic_vector(7 DOWNTO 0)
	);
END sistema_unificadov2;

-- Design Ports Information
-- ALERTA	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ILUM_NAT	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[0]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[1]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[2]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[3]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[4]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[5]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DISPL_STATUS[6]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TIMER	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[0]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[1]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[5]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[6]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_LUM[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[5]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[0]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[1]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[2]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[3]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[4]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[5]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[6]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDS[7]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLR	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- INT_MAN	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[2]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[4]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[3]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[0]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENTR_HOR[1]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SEN_PRE	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sistema_unificadov2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK : std_logic;
SIGNAL ww_CLR : std_logic;
SIGNAL ww_INT_MAN : std_logic;
SIGNAL ww_SEN_PRE : std_logic;
SIGNAL ww_ALERTA : std_logic;
SIGNAL ww_ILUM_NAT : std_logic;
SIGNAL ww_DISPL_STATUS : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_TIMER : std_logic;
SIGNAL ww_SEN_LUM : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ENTR_HOR : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_LEDS : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLR~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \controladora_inst|Selector0~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TIMER~input_o\ : std_logic;
SIGNAL \SEN_LUM[0]~input_o\ : std_logic;
SIGNAL \SEN_LUM[1]~input_o\ : std_logic;
SIGNAL \SEN_LUM[2]~input_o\ : std_logic;
SIGNAL \SEN_LUM[3]~input_o\ : std_logic;
SIGNAL \SEN_LUM[4]~input_o\ : std_logic;
SIGNAL \SEN_LUM[5]~input_o\ : std_logic;
SIGNAL \SEN_LUM[6]~input_o\ : std_logic;
SIGNAL \SEN_LUM[7]~input_o\ : std_logic;
SIGNAL \ENTR_HOR[5]~input_o\ : std_logic;
SIGNAL \ALERTA~output_o\ : std_logic;
SIGNAL \ILUM_NAT~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[0]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[1]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[2]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[3]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[4]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[5]~output_o\ : std_logic;
SIGNAL \DISPL_STATUS[6]~output_o\ : std_logic;
SIGNAL \LEDS[0]~output_o\ : std_logic;
SIGNAL \LEDS[1]~output_o\ : std_logic;
SIGNAL \LEDS[2]~output_o\ : std_logic;
SIGNAL \LEDS[3]~output_o\ : std_logic;
SIGNAL \LEDS[4]~output_o\ : std_logic;
SIGNAL \LEDS[5]~output_o\ : std_logic;
SIGNAL \LEDS[6]~output_o\ : std_logic;
SIGNAL \LEDS[7]~output_o\ : std_logic;
SIGNAL \CLOCK~input_o\ : std_logic;
SIGNAL \CLOCK~inputclkctrl_outclk\ : std_logic;
SIGNAL \INT_MAN~input_o\ : std_logic;
SIGNAL \ENTR_HOR[2]~input_o\ : std_logic;
SIGNAL \ENTR_HOR[3]~input_o\ : std_logic;
SIGNAL \ENTR_HOR[4]~input_o\ : std_logic;
SIGNAL \ENTR_HOR[1]~input_o\ : std_logic;
SIGNAL \ENTR_HOR[0]~input_o\ : std_logic;
SIGNAL \controladora_inst|combinational~3_combout\ : std_logic;
SIGNAL \controladora_inst|combinational~5_combout\ : std_logic;
SIGNAL \SEN_PRE~input_o\ : std_logic;
SIGNAL \controladora_inst|combinational~2_combout\ : std_logic;
SIGNAL \controladora_inst|combinational~4_combout\ : std_logic;
SIGNAL \controladora_inst|Selector6~0_combout\ : std_logic;
SIGNAL \controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\ : std_logic;
SIGNAL \CLR~input_o\ : std_logic;
SIGNAL \CLR~inputclkctrl_outclk\ : std_logic;
SIGNAL \controladora_inst|estado_atual.DETECTA_PRESENCA~q\ : std_logic;
SIGNAL \controladora_inst|Selector8~0_combout\ : std_logic;
SIGNAL \controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\ : std_logic;
SIGNAL \controladora_inst|estado_atual.MODO_NOTURNO~q\ : std_logic;
SIGNAL \controladora_inst|Selector0~0_combout\ : std_logic;
SIGNAL \controladora_inst|Selector0~0clkctrl_outclk\ : std_logic;
SIGNAL \controladora_inst|estado_atual.INIT~feeder_combout\ : std_logic;
SIGNAL \controladora_inst|estado_atual.INIT~q\ : std_logic;
SIGNAL \controladora_inst|Selector3~0_combout\ : std_logic;
SIGNAL \controladora_inst|Selector3~1_combout\ : std_logic;
SIGNAL \controladora_inst|proximo_estado.MANUAL_420~combout\ : std_logic;
SIGNAL \controladora_inst|estado_atual.MANUAL~q\ : std_logic;
SIGNAL \controladora_inst|Selector7~0_combout\ : std_logic;
SIGNAL \controladora_inst|proximo_estado.ERRO_594~combout\ : std_logic;
SIGNAL \controladora_inst|estado_atual.ERRO~q\ : std_logic;
SIGNAL \controladora_inst|ALERTA~2_combout\ : std_logic;
SIGNAL \controladora_inst|WideOr1~combout\ : std_logic;
SIGNAL \controladora_inst|ALT_INV_ALERTA~2_combout\ : std_logic;
SIGNAL \ALT_INV_CLR~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_CLOCK <= CLOCK;
ww_CLR <= CLR;
ww_INT_MAN <= INT_MAN;
ww_SEN_PRE <= SEN_PRE;
ALERTA <= ww_ALERTA;
ILUM_NAT <= ww_ILUM_NAT;
DISPL_STATUS <= ww_DISPL_STATUS;
ww_TIMER <= TIMER;
ww_SEN_LUM <= SEN_LUM;
ww_ENTR_HOR <= ENTR_HOR;
LEDS <= ww_LEDS;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLR~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLR~input_o\);

\CLOCK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK~input_o\);

\controladora_inst|Selector0~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \controladora_inst|Selector0~0_combout\);
\controladora_inst|ALT_INV_ALERTA~2_combout\ <= NOT \controladora_inst|ALERTA~2_combout\;
\ALT_INV_CLR~inputclkctrl_outclk\ <= NOT \CLR~inputclkctrl_outclk\;

-- Location: IOOBUF_X22_Y0_N2
\ALERTA~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controladora_inst|ALT_INV_ALERTA~2_combout\,
	devoe => ww_devoe,
	o => \ALERTA~output_o\);

-- Location: IOOBUF_X26_Y31_N2
\ILUM_NAT~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ILUM_NAT~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\DISPL_STATUS[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controladora_inst|WideOr1~combout\,
	devoe => ww_devoe,
	o => \DISPL_STATUS[0]~output_o\);

-- Location: IOOBUF_X29_Y31_N9
\DISPL_STATUS[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DISPL_STATUS[1]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\DISPL_STATUS[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	devoe => ww_devoe,
	o => \DISPL_STATUS[2]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\DISPL_STATUS[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \controladora_inst|ALT_INV_ALERTA~2_combout\,
	devoe => ww_devoe,
	o => \DISPL_STATUS[3]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\DISPL_STATUS[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DISPL_STATUS[4]~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\DISPL_STATUS[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DISPL_STATUS[5]~output_o\);

-- Location: IOOBUF_X33_Y24_N9
\DISPL_STATUS[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \DISPL_STATUS[6]~output_o\);

-- Location: IOOBUF_X26_Y0_N9
\LEDS[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[0]~output_o\);

-- Location: IOOBUF_X22_Y31_N2
\LEDS[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[1]~output_o\);

-- Location: IOOBUF_X33_Y27_N9
\LEDS[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[2]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\LEDS[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[3]~output_o\);

-- Location: IOOBUF_X24_Y31_N9
\LEDS[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[4]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\LEDS[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[5]~output_o\);

-- Location: IOOBUF_X29_Y31_N2
\LEDS[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[6]~output_o\);

-- Location: IOOBUF_X33_Y12_N2
\LEDS[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDS[7]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\CLOCK~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK,
	o => \CLOCK~input_o\);

-- Location: CLKCTRL_G17
\CLOCK~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK~inputclkctrl_outclk\);

-- Location: IOIBUF_X12_Y0_N8
\INT_MAN~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_INT_MAN,
	o => \INT_MAN~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\ENTR_HOR[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(2),
	o => \ENTR_HOR[2]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\ENTR_HOR[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(3),
	o => \ENTR_HOR[3]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\ENTR_HOR[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(4),
	o => \ENTR_HOR[4]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\ENTR_HOR[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(1),
	o => \ENTR_HOR[1]~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\ENTR_HOR[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(0),
	o => \ENTR_HOR[0]~input_o\);

-- Location: LCCOMB_X15_Y1_N10
\controladora_inst|combinational~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|combinational~3_combout\ = (!\ENTR_HOR[2]~input_o\ & ((\ENTR_HOR[3]~input_o\) # ((\ENTR_HOR[1]~input_o\) # (\ENTR_HOR[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENTR_HOR[2]~input_o\,
	datab => \ENTR_HOR[3]~input_o\,
	datac => \ENTR_HOR[1]~input_o\,
	datad => \ENTR_HOR[0]~input_o\,
	combout => \controladora_inst|combinational~3_combout\);

-- Location: LCCOMB_X15_Y1_N26
\controladora_inst|combinational~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|combinational~5_combout\ = (!\ENTR_HOR[4]~input_o\ & ((\controladora_inst|combinational~3_combout\) # ((\ENTR_HOR[2]~input_o\ & !\ENTR_HOR[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENTR_HOR[2]~input_o\,
	datab => \ENTR_HOR[3]~input_o\,
	datac => \ENTR_HOR[4]~input_o\,
	datad => \controladora_inst|combinational~3_combout\,
	combout => \controladora_inst|combinational~5_combout\);

-- Location: IOIBUF_X14_Y0_N1
\SEN_PRE~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_PRE,
	o => \SEN_PRE~input_o\);

-- Location: LCCOMB_X15_Y1_N2
\controladora_inst|combinational~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|combinational~2_combout\ = (\ENTR_HOR[2]~input_o\ & (!\ENTR_HOR[4]~input_o\ & !\ENTR_HOR[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENTR_HOR[2]~input_o\,
	datac => \ENTR_HOR[4]~input_o\,
	datad => \ENTR_HOR[3]~input_o\,
	combout => \controladora_inst|combinational~2_combout\);

-- Location: LCCOMB_X15_Y1_N12
\controladora_inst|combinational~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|combinational~4_combout\ = (!\INT_MAN~input_o\ & ((\controladora_inst|combinational~2_combout\) # ((\controladora_inst|combinational~3_combout\ & !\ENTR_HOR[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|combinational~3_combout\,
	datab => \controladora_inst|combinational~2_combout\,
	datac => \ENTR_HOR[4]~input_o\,
	datad => \INT_MAN~input_o\,
	combout => \controladora_inst|combinational~4_combout\);

-- Location: LCCOMB_X15_Y1_N4
\controladora_inst|Selector6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector6~0_combout\ = (\controladora_inst|combinational~4_combout\ & ((\controladora_inst|estado_atual.MODO_NOTURNO~q\) # ((!\SEN_PRE~input_o\ & \controladora_inst|estado_atual.DETECTA_PRESENCA~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|combinational~4_combout\,
	datab => \SEN_PRE~input_o\,
	datac => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	datad => \controladora_inst|estado_atual.DETECTA_PRESENCA~q\,
	combout => \controladora_inst|Selector6~0_combout\);

-- Location: LCCOMB_X15_Y1_N8
\controladora_inst|proximo_estado.DETECTA_PRESENCA_623\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\ = (GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & ((\controladora_inst|Selector6~0_combout\))) # (!GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & 
-- (\controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\,
	datac => \controladora_inst|Selector6~0_combout\,
	datad => \controladora_inst|Selector0~0clkctrl_outclk\,
	combout => \controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\);

-- Location: IOIBUF_X16_Y0_N22
\CLR~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLR,
	o => \CLR~input_o\);

-- Location: CLKCTRL_G19
\CLR~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLR~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLR~inputclkctrl_outclk\);

-- Location: FF_X15_Y1_N9
\controladora_inst|estado_atual.DETECTA_PRESENCA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \controladora_inst|proximo_estado.DETECTA_PRESENCA_623~combout\,
	clrn => \ALT_INV_CLR~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controladora_inst|estado_atual.DETECTA_PRESENCA~q\);

-- Location: LCCOMB_X15_Y1_N0
\controladora_inst|Selector8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector8~0_combout\ = (\controladora_inst|estado_atual.DETECTA_PRESENCA~q\ & (\INT_MAN~input_o\ $ (((\SEN_PRE~input_o\) # (!\controladora_inst|combinational~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INT_MAN~input_o\,
	datab => \SEN_PRE~input_o\,
	datac => \controladora_inst|combinational~4_combout\,
	datad => \controladora_inst|estado_atual.DETECTA_PRESENCA~q\,
	combout => \controladora_inst|Selector8~0_combout\);

-- Location: LCCOMB_X15_Y1_N24
\controladora_inst|proximo_estado.MODO_NOTURNO_565\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\ = (GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & ((\controladora_inst|Selector8~0_combout\))) # (!GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & 
-- (\controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\,
	datac => \controladora_inst|Selector8~0_combout\,
	datad => \controladora_inst|Selector0~0clkctrl_outclk\,
	combout => \controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\);

-- Location: FF_X15_Y1_N25
\controladora_inst|estado_atual.MODO_NOTURNO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~input_o\,
	d => \controladora_inst|proximo_estado.MODO_NOTURNO_565~combout\,
	clrn => \ALT_INV_CLR~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controladora_inst|estado_atual.MODO_NOTURNO~q\);

-- Location: LCCOMB_X15_Y1_N20
\controladora_inst|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector0~0_combout\ = (\INT_MAN~input_o\) # ((\controladora_inst|combinational~5_combout\) # (!\controladora_inst|estado_atual.MODO_NOTURNO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \INT_MAN~input_o\,
	datac => \controladora_inst|combinational~5_combout\,
	datad => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	combout => \controladora_inst|Selector0~0_combout\);

-- Location: CLKCTRL_G18
\controladora_inst|Selector0~0clkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \controladora_inst|Selector0~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \controladora_inst|Selector0~0clkctrl_outclk\);

-- Location: LCCOMB_X15_Y1_N18
\controladora_inst|estado_atual.INIT~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|estado_atual.INIT~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \controladora_inst|estado_atual.INIT~feeder_combout\);

-- Location: FF_X15_Y1_N19
\controladora_inst|estado_atual.INIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \controladora_inst|estado_atual.INIT~feeder_combout\,
	clrn => \ALT_INV_CLR~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controladora_inst|estado_atual.INIT~q\);

-- Location: LCCOMB_X15_Y1_N30
\controladora_inst|Selector3~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector3~0_combout\ = (\INT_MAN~input_o\ & ((\controladora_inst|estado_atual.MODO_NOTURNO~q\) # ((\controladora_inst|estado_atual.DETECTA_PRESENCA~q\) # (!\controladora_inst|estado_atual.INIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	datab => \controladora_inst|estado_atual.DETECTA_PRESENCA~q\,
	datac => \controladora_inst|estado_atual.INIT~q\,
	datad => \INT_MAN~input_o\,
	combout => \controladora_inst|Selector3~0_combout\);

-- Location: LCCOMB_X15_Y1_N14
\controladora_inst|Selector3~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector3~1_combout\ = (\controladora_inst|Selector3~0_combout\) # ((\controladora_inst|estado_atual.MODO_NOTURNO~q\ & !\controladora_inst|combinational~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|Selector3~0_combout\,
	datab => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	datac => \controladora_inst|combinational~5_combout\,
	combout => \controladora_inst|Selector3~1_combout\);

-- Location: LCCOMB_X15_Y1_N16
\controladora_inst|proximo_estado.MANUAL_420\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|proximo_estado.MANUAL_420~combout\ = (GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & ((\controladora_inst|Selector3~1_combout\))) # (!GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & 
-- (\controladora_inst|proximo_estado.MANUAL_420~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controladora_inst|proximo_estado.MANUAL_420~combout\,
	datac => \controladora_inst|Selector0~0clkctrl_outclk\,
	datad => \controladora_inst|Selector3~1_combout\,
	combout => \controladora_inst|proximo_estado.MANUAL_420~combout\);

-- Location: FF_X15_Y1_N17
\controladora_inst|estado_atual.MANUAL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \controladora_inst|proximo_estado.MANUAL_420~combout\,
	clrn => \ALT_INV_CLR~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controladora_inst|estado_atual.MANUAL~q\);

-- Location: LCCOMB_X15_Y1_N6
\controladora_inst|Selector7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|Selector7~0_combout\ = (\controladora_inst|estado_atual.MANUAL~q\) # ((\controladora_inst|estado_atual.ERRO~q\) # ((!\INT_MAN~input_o\ & !\controladora_inst|estado_atual.INIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \controladora_inst|estado_atual.MANUAL~q\,
	datab => \controladora_inst|estado_atual.ERRO~q\,
	datac => \INT_MAN~input_o\,
	datad => \controladora_inst|estado_atual.INIT~q\,
	combout => \controladora_inst|Selector7~0_combout\);

-- Location: LCCOMB_X15_Y1_N22
\controladora_inst|proximo_estado.ERRO_594\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|proximo_estado.ERRO_594~combout\ = (GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & (\controladora_inst|Selector7~0_combout\)) # (!GLOBAL(\controladora_inst|Selector0~0clkctrl_outclk\) & 
-- ((\controladora_inst|proximo_estado.ERRO_594~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controladora_inst|Selector7~0_combout\,
	datac => \controladora_inst|proximo_estado.ERRO_594~combout\,
	datad => \controladora_inst|Selector0~0clkctrl_outclk\,
	combout => \controladora_inst|proximo_estado.ERRO_594~combout\);

-- Location: FF_X15_Y1_N23
\controladora_inst|estado_atual.ERRO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK~inputclkctrl_outclk\,
	d => \controladora_inst|proximo_estado.ERRO_594~combout\,
	clrn => \ALT_INV_CLR~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \controladora_inst|estado_atual.ERRO~q\);

-- Location: LCCOMB_X16_Y1_N24
\controladora_inst|ALERTA~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|ALERTA~2_combout\ = (!\controladora_inst|estado_atual.MANUAL~q\ & !\controladora_inst|estado_atual.ERRO~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \controladora_inst|estado_atual.MANUAL~q\,
	datad => \controladora_inst|estado_atual.ERRO~q\,
	combout => \controladora_inst|ALERTA~2_combout\);

-- Location: LCCOMB_X15_Y1_N28
\controladora_inst|WideOr1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \controladora_inst|WideOr1~combout\ = (\controladora_inst|estado_atual.MODO_NOTURNO~q\) # ((\controladora_inst|estado_atual.MANUAL~q\) # (\controladora_inst|estado_atual.ERRO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \controladora_inst|estado_atual.MODO_NOTURNO~q\,
	datac => \controladora_inst|estado_atual.MANUAL~q\,
	datad => \controladora_inst|estado_atual.ERRO~q\,
	combout => \controladora_inst|WideOr1~combout\);

-- Location: IOIBUF_X16_Y0_N8
\TIMER~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TIMER,
	o => \TIMER~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\SEN_LUM[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(0),
	o => \SEN_LUM[0]~input_o\);

-- Location: IOIBUF_X33_Y10_N1
\SEN_LUM[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(1),
	o => \SEN_LUM[1]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\SEN_LUM[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(2),
	o => \SEN_LUM[2]~input_o\);

-- Location: IOIBUF_X26_Y31_N8
\SEN_LUM[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(3),
	o => \SEN_LUM[3]~input_o\);

-- Location: IOIBUF_X31_Y31_N8
\SEN_LUM[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(4),
	o => \SEN_LUM[4]~input_o\);

-- Location: IOIBUF_X10_Y31_N1
\SEN_LUM[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(5),
	o => \SEN_LUM[5]~input_o\);

-- Location: IOIBUF_X20_Y31_N8
\SEN_LUM[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(6),
	o => \SEN_LUM[6]~input_o\);

-- Location: IOIBUF_X33_Y28_N8
\SEN_LUM[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SEN_LUM(7),
	o => \SEN_LUM[7]~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\ENTR_HOR[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENTR_HOR(5),
	o => \ENTR_HOR[5]~input_o\);

ww_ALERTA <= \ALERTA~output_o\;

ww_ILUM_NAT <= \ILUM_NAT~output_o\;

ww_DISPL_STATUS(0) <= \DISPL_STATUS[0]~output_o\;

ww_DISPL_STATUS(1) <= \DISPL_STATUS[1]~output_o\;

ww_DISPL_STATUS(2) <= \DISPL_STATUS[2]~output_o\;

ww_DISPL_STATUS(3) <= \DISPL_STATUS[3]~output_o\;

ww_DISPL_STATUS(4) <= \DISPL_STATUS[4]~output_o\;

ww_DISPL_STATUS(5) <= \DISPL_STATUS[5]~output_o\;

ww_DISPL_STATUS(6) <= \DISPL_STATUS[6]~output_o\;

ww_LEDS(0) <= \LEDS[0]~output_o\;

ww_LEDS(1) <= \LEDS[1]~output_o\;

ww_LEDS(2) <= \LEDS[2]~output_o\;

ww_LEDS(3) <= \LEDS[3]~output_o\;

ww_LEDS(4) <= \LEDS[4]~output_o\;

ww_LEDS(5) <= \LEDS[5]~output_o\;

ww_LEDS(6) <= \LEDS[6]~output_o\;

ww_LEDS(7) <= \LEDS[7]~output_o\;
END structure;


