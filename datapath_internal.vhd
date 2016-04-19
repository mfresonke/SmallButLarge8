library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SMALL8_LIB.all;

-- This Datapth is specific to the internals of the CPU

entity datapath_internal is
  port(
    clk, rst : in std_logic;
    ctrl_int_dp : in controller_int_datapath_controls;
    bus_out : out std_vect;
    in_bus_ext : in std_vect;
    address_out : out double_std_vect
  );
end;

architecture in_ddppppp of datapath_internal is

  signal status_to_reg, status_from_reg : status;

begin

  -- Generic Register Setup. We need a bunch!
  REGIE_A : entity work.regie
  port map (
    clk => clk,
    rst => rst,
    load => '1',
    input => dp_bus_regies.ext_raw_out,
    output => dp_bus_regies.ext_out
  );

  REGIE_D : entity work.regie
  port map (
    clk => clk,
    rst => rst,
    load => '1',
    input => dp_bus_regies.ext_raw_out,
    output => dp_bus_regies.ext_out
  );

  THE_ALU : entity work.alu
  generic map (
    WIDTH => WIDTH
  ),
  port map (
    A =>
    D
    Sel
    C_in
    C_out
    V
    Z
    S
    Res
  )


end architecture;
