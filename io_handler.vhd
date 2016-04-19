library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.small8_lib.all;

entity io_handler is
  port (
    clk, rst : in std_logic;
    inport0, inport1 : out std_vect;
    inport0_raw_input, inport1_raw_input : in std_vect;
    inport0_en, inport1_en : in std_logic;
    inport0_rst, inport1_rst : in std_logic;

    outport0, outport1 : out std_vect;
    outport0_en, outport1_en : in std_logic;
    outport0_from_dp, outport1_from_dp: in std_vect
  );
end;

architecture xX_Xx of io_handler is

begin

  INPORT0_REG : entity work.regie
    generic map(
      WIDTH => WIDTH
    )
    port map(
      clk => clk,
      rst => inport0_rst,
      load => inport0_en,
      input => inport0_raw_input,
      output => inport0
  );

  INPORT1_REG : entity work.regie
    generic map(
      WIDTH => WIDTH
    )
    port map(
      clk => clk,
      rst => inport1_rst,
      load => inport1_en,
      input => inport1_raw_input,
      output => inport1
  );

  OUTPORT0_REG : entity work.regie
    generic map(
      WIDTH => WIDTH
    )
    port map(
      clk => clk,
      rst => rst,
      load => outport0_en,
      input => outport0_from_dp,
      output => outport0
  );


  OUTPORT1_REG : entity work.regie
    generic map(
      WIDTH => WIDTH
    )
    port map(
      clk => clk,
      rst => rst,
      load => outport1_en,
      input => outport1_from_dp,
      output => outport1
  );

end architecture;
