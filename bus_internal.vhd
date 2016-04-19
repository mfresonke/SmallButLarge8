library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.small8_lib.all;

entity bus_internal is
  port(
    reg_a : in std_vect;
    reg_d : in std_vect;
    reg_r : in std_vect;
    reg_external : in std_vect;
    reg_pc : in double_std_vect;
    sel : in SELECTION_BUS_INTERNAL;
    output : out std_vect
  );
end;

architecture jjjj of bus_internal is
begin

  process(sel, reg_a, reg_d, reg_r, reg_external, reg_pc) is
  begin
    case(sel) is
      when S_A =>
        output <= reg_a;
      when S_D =>
        output <= reg_d;
      when S_R =>
        output <= reg_r;
      when S_EXTERNAL =>
        output <= reg_external;
      when S_PC_L =>
        output <= reg_pc(WIDTH-1 downto 0);
      when S_PC_H =>
        output <= reg_pc(DOUBLE_WIDTH-1 downto WIDTH);
      when others =>
        null;
    end case;
  end process;
end architecture;
