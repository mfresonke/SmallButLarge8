library ieee;
use ieee.std_logic_1164.all;

entity top_level is
    port (
        clk : in std_logic;
        switch  : in  std_logic_vector(9 downto 0);
        button_L  : in  std_logic_vector(2 downto 0);
        led0    : out std_logic_vector(6 downto 0);
        led0_dp : out std_logic;
        led1    : out std_logic_vector(6 downto 0);
        led1_dp : out std_logic;
        led2    : out std_logic_vector(6 downto 0);
        led2_dp : out std_logic;
        led3    : out std_logic_vector(6 downto 0);
        led3_dp : out std_logic
        );
end top_level;

architecture STR of top_level is

    -- Top Level Signals
    signal input : std_vect;
    signal setA : std_logic;
    signal setD : std_logic
    signal rst : std_logic;

    -- Small8 Connector Signals
    signal input_A : std_vect; -- output from registers
    signal input_B : std_vect;


begin  -- STR

    -- Input Mapping
    input <= not button_L;

    set1 <= not button(0);
    set2 <= not button(1);
    rst <= not button(2);

    with set1 & set2 select
      output <= input_A when '10',
      in2           when others;

    -- map adder output to two leftmost LEDs
    U_LED3 : entity  work.decoder7seg port map (
        input  => output1(7 downto 4),
        output => led3);

    U_LED2 : entity work.decoder7seg port map (
        input  => output1(3 downto 0),
        output => led2);

    -- all other LEDs should display 0
    U_LED1 : entity work.decoder7seg port map (
        input  => C0,
        output => led1);

    U_LED0 : entity work.decoder7seg port map (
        input  => C0,
        output => led0);

    -- show carry out on dp of leftmost LED
    -- should never be asserted due to 5-bit inputs
    led3_dp <= not done1;

    -- show 6th sum bit (actual carry out) on led2 dp
    led2_dp <= '1';
    led1_dp <= '1';
    led0_dp <= '1';

    go <= button(2);
    rst <= button(0);

end STR;


configuration top_level_cfg of top_level is
    for STR
        for U_GCD : gcd
            use entity work.gcd(FSMD);  -- change this line for other
                                                  -- architectures
        end for;
    end for;
end top_level_cfg;
