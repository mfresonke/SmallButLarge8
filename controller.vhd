library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SMALL8_LIB.all;

entity controller is
  port(
    rst, clk : in std_logic;
    ctrl_ext_dp : out controller_ext_datapath_controls;
    ctrl_int_dp : out controller_int_datapath_controls
  );
end;

architecture really_complicated of controller is

  type states is (
    init
  );

  signal state, next_state : states;

begin

  -- generic two-process update
  process(rst, clk) is
  begin
    if rst = '1' then
      state <= init;
    elsif rising_edge(clk) then
      state <= next_state;
    end if;
  end process;

    -- Main State Process
    process(state) is
    begin

      case(state) is
        when init =>


        when others =>
          null;

        end case;

    end process;


end architecture;
