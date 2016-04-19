library ieee;
use ieee.std_logic_1164.all;

entity decoder7seg is
	port(
		input  : in  std_logic_vector(3 downto 0);
		output : out std_logic_vector(6 downto 0)
	);
end decoder7seg;

architecture decoderArch of decoder7seg is
begin
	process(input)
	begin
		case input is
			when "0000" => output <= "1000000";
			when "0001" => output <= "1111001";
			when "0010" => output <= "0100100";
			when "0011" => output <= "0110000"; --0011 0000110 
			when "0100" => output <= "0011001"; --0100 1001100 
			when "0101" => output <= "0010010"; --0101 0100100 
			when "0110" => output <= "0000010"; --0110 0100000 
			when "0111" => output <= "1111000"; --0111 0001111 
			when "1000" => output <= "0000000"; --1000 0000000 
			when "1001" => output <= "0011000"; --1001 0001100 
			when "1010" => output <= "0001000"; --1010 0001000
			when "1011" => output <= "0000011"; --1011 1100000
			when "1100" => output <= "1000110"; --1100 0110001 
			when "1101" => output <= "0100001"; --1101 1000010 
			when "1110" => output <= "0000110"; --1110 0110000 
			when "1111" => output <= "0001110"; --1111 0111000 
			when others => null;
		end case;
	end process;
end decoderArch; 