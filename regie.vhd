library ieee;
use ieee.std_logic_1164.all;

entity regie is
  generic (
    WIDTH  :     positive := 8);
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    load   : in  std_logic;
    input  : in  std_logic_vector(WIDTH-1 downto 0);
    output : out std_logic_vector(WIDTH-1 downto 0));
end;


architecture BHV of regie is
begin
  process(clk, rst)
  begin
    if (rst = '1') then
      output   <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (load = '1') then
        output <= input;
      end if;
    end if;
  end process;
end architecture;
