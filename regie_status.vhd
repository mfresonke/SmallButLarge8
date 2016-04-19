library ieee;
use ieee.std_logic_1164.all;
use work.small8_lib.all;

entity regie_status is
  port (
    clk, rst    : in  std_logic;
    C, V, S, Z   : in  std_logic;
    C_en, V_en, S_en, Z_en : in std_logic;
    C_set, C_rst : in std_logic;
    status : out STATUS_HOLDER;
end;


architecture BHV of regie_status is
begin
  process(clk, rst)
  begin
    if rst = '1' then
      status <= (others => '0');
    elsif rising_edge(clk) then
      -- Actual code goes here...
      if (load = '1') then
        output <= input;
      end if;
      -- Actual code ends here...
    end if;
  end process;
end architecture;
