library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.small8_lib.all;

entity bus_external is
  port(
    in_bus_int : in std_vect;
    in_ram : in std_vect;
    in_inport0 : in std_vect;
    in_inport1 : in std_vect;
    sel : in SELECTION_BUS_EXTERNAL;
    output : out std_vect
  );
end;

architecture ldjflkdsdlskfj of bus_external is
begin

  process(in_bus_int, in_ram, in_inport0, in_inport1, sel) is
  begin
    case(sel) is
      when S_INPORT0 =>
        output <= in_inport0;
      when S_INPORT1 =>
        output <= in_inport1;
      when S_RAM =>
        output <= in_ram;
      when S_BUS_INTERNAL =>
        output <= in_bus_int;
      when others =>
        null;
    end case;
  end process;
end architecture;
