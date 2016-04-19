library ieee;
use ieee.std_logic_1164.all;
use work.SMALL8_LIB.all;

entity small8 is
  port(
    clk : in std_logic;
    rst : in std_logic;
    board_in : in board_inputs;
    board_out : out board_outputs
  );
end;

architecture hail_mary of small8 is

  -- Types

  type dp_bus_regies_type is record
    ext_raw_out : std_vect;
    ext_out : std_vect;
    int_raw_out : std_vect;
    int_out : std_vect;
  end record;

  -- Signals

  signal ctrl_ext_dp : controller_ext_datapath_controls;
  signal ctrl_int_dp : controller_int_datapath_controls;

  signal dp_bus_regies : dp_bus_regies_type;
  signal address_bus : double_std_vect;

begin

  THE_CONTROLLER : entity work.controller
  port map (
    clk => clk,
    rst => rst,
    ctrl_ext_dp => ctrl_ext_dp,
    ctrl_int_dp => ctrl_int_dp
  );

  THE_INT_DATAPATH : entity work.datapath_internal
  port map (
    clk => clk,
    rst => rst,
    ctrl_int_dp => ctrl_int_dp,
    raw_bus_out => dp_bus_regies.int_raw_out,
    in_bus_ext => dp_bus_regies.ext_out,
    address_out => address_bus
  );

  THE_EXT_DATAPATH : entity work.datapath_external
  port map (
    clk => clk,
    rst => rst,
  --control
    ctrl_ext_dp => ctrl_ext_dp,
  -- data i/o
    bus_out => dp_bus_regies.ext_raw_out,
    in_bus_int => dp_bus_regies.int_out,
  -- address bus in
    address_in => address_bus,
  --inputs
    board_in => board_in,
  --outputs
    board_out => board_out
  );

  -- Registers that Buffer Output from Each Bus

  EXT_DP_REGIE : entity work.regie
  port map (
    clk => clk,
    rst => rst,
    load => '1',
    input => dp_bus_regies.ext_raw_out,
    output => dp_bus_regies.ext_out
  );

  INT_DP_REGIE : entity work.regie
  port map (
    clk => clk,
    rst => rst,
    load => '1',
    input => dp_bus_regies.int_raw_out,
    output => dp_bus_regies.int_out
  );

end architecture;
