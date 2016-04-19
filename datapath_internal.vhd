library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SMALL8_LIB.all;

-- This Datapth is specific to the internals of the CPU

entity datapath_internal is
  port(
    clk, rst : in std_logic;
    ctrl_int_dp : in controller_int_datapath_controls;
    raw_bus_out : out std_vect;
    in_bus_ext : in std_vect;
    address_out : out double_std_vect
  );
end;

architecture in_ddppppp of datapath_internal is

begin


end architecture;
