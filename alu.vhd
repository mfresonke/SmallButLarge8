library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.SMALL8_LIB.all;

entity alu is
  generic (
    WIDTH : positive := 8
  );
  port (
    A : in std_logic_vector(WIDTH-1 downto 0);
    D : in std_logic_vector(WIDTH-1 downto 0);
    Sel : in ALU_INSTRUCTION;
    C_in : in std_logic;
    C_out : buffer std_logic;
    V : out std_logic;
    Z : out std_logic;
    S : out std_logic;
    Res : out std_logic_vector(WIDTH-1 downto 0)
  );
end;

architecture whydoihavetonamethisX_X of alu is

begin

  process(A, D, Sel, C_in) is
    variable A_temp : unsigned(WIDTH downto 0);
    variable D_temp : unsigned(WIDTH downto 0);
    variable Res_temp : unsigned(WIDTH-1 downto 0);
    variable big_Res_temp : unsigned(WIDTH downto 0);
  begin
    C_out <= '0';
    V <= '0';
    Z <= '0';
    S <= '0';
    A_temp := '0' & unsigned(A);
    D_temp := '0' & unsigned(D);
    Res_temp := (others => '0');
    big_Res_temp := (others => '0');

    case Sel is
      when ADD =>
        big_Res_temp := A_temp + D_temp;
        if C_in = '1' then
          big_Res_temp := big_Res_temp + to_unsigned(1, WIDTH+1);
        end if;
        C_out <= big_Res_temp(WIDTH);
        V <= big_Res_temp(WIDTH) xor big_Res_temp(WIDTH-1);
        Res_temp := big_Res_temp(WIDTH-1 downto 0);

      when SUB  =>
        Res_temp := unsigned(A) + unsigned((not std_logic_vector(D)));
        if C_in = '0' then
          Res_temp := Res_temp + to_unsigned(1, WIDTH);
        end if;
        if A_temp >= D_temp then
          V <= '1' xor Res_temp(WIDTH-1);
          C_out <= '1';
        else
          V <= '0' xor Res_temp(WIDTH-1);
        end if;

      when LOG_AND =>
        Res_temp := unsigned(A and D);

      when LOG_OR =>
        Res_temp := unsigned(A or D);

      when LOG_XOR =>
        Res_temp := unsigned(A xor D);

      when SL =>
        C_out <= A(WIDTH-1);
        Res_temp := unsigned(A(WIDTH-2 downto 0) & '0');

      when SR =>
        C_out <= A(0);
        Res_temp := unsigned('0' & A(WIDTH-1 downto 1));

      when RL =>
        C_out <= A(WIDTH-1);
        Res_temp := unsigned(A(WIDTH-2 downto 0) & C_in);
      when RR  =>
        C_out <= A(0);
        Res_temp := unsigned(C_in & A(WIDTH-1 downto 1));
      when others =>
        null;
    end case;

    if Res_temp = to_unsigned(0, WIDTH) then
      Z <= '1';
    end if;

    if Res_temp(WIDTH-1) = '1' then
      S <= '1';
    end if;

    Res <= std_logic_vector(Res_temp);
  end process;

end architecture;
