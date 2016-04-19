library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SMALL8_LIB.all;

entity datapath_external is
  port(
    clk, rst : in std_logic;
    -- Control
    ctrl_ext_dp : in controller_ext_datapath_controls;
    -- External I/O
    board_in : in board_inputs;
    board_out : out board_outputs;
    -- Bus I/O
    bus_out : buffer std_vect;
    in_bus_int : in std_vect;
    address_in : in double_std_vect
  );
end;

architecture ddppppp_EXTTT of datapath_external is

  ----- IO HANDLER -----
  -- Sanitized Input from Inport Registers
  signal inport0, inport1 : std_vect;
  -- Temporary Inputs to Output Register
  signal to_outport0_reg, to_outport1_reg : std_vect;

  signal ram : std_vect;

begin

  IO_HANDLER : entity work.io_handler
  port map (
    clk => clk,
    rst => rst,

    inport0_raw_input => board_in.inport0_raw_input,
    inport1_raw_input => board_in.inport1_raw_input,
    inport0_en => board_in.inport0_en,
    inport1_en => board_in.inport1_en,
    inport0 => inport0,
    inport1 => inport1,
    inport0_rst => board_in.inport0_rst,
    inport1_rst => board_in.inport1_rst,

    outport0 => board_out.outport0,
    outport1 => board_out.outport1,
    outport0_en => ctrl_ext_dp.outport0_reg_en,
    outport1_en => ctrl_ext_dp.outport1_reg_en,
    outport0_from_dp => to_outport0_reg,
    outport1_from_dp => to_outport1_reg
  );

  THE_EXT_BUS : entity work.bus_external
  port map (
    in_bus_int => in_bus_int,
    in_ram => ram,
    in_inport0 => inport0,
    in_inport1 => inport1,
    sel => ctrl_ext_dp.bus_select,
    output => bus_out
  );

  THE_RAM : entity work.ram
  port map (
    address => address_in,
    clock	=> clk,
    data	=> bus_out,
    wren => ctrl_ext_dp.ram_wren,
    q => ram
  );


end architecture;
