library ieee;
use ieee.std_logic_1164.all;
use work.small8_lib.all;

entity regie_status is
  port (
    clk, rst    : in  std_logic;
    status_in   : in  status;
    enables : in status_controls;
    status_out : out status;
end;


architecture BHV of regie_status is
begin
  process(clk, rst)
  begin
    if rst = '1' then
      status_out <= ('0','0','0','0');
    elsif rising_edge(clk) then
      -- Actual code goes here...

      if (enables.C_clr = '1') then
        status_out.C <= '0';
      elsif (enables.C_set = '1') then
        status_out.C <= '1';
      elsif (enables.C_en = '1') then
        status_out.C <= status_in.C;
      end if;

      if (enables.V_en = '1') then
        status_out.V <= status_in.V;
      end if;

      if (enables.S_en = '1') then
        status_out.S <= status_in.S;
      end if;

      if (enables.Z_en = '1') then
        status_out.Z <= status_in.Z;
      end if;

      -- Actual code ends here...
    end if;
  end process;
end architecture;
