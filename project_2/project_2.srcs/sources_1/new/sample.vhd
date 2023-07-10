library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
  port (a, b, sel : in std_logic;
        y : out std_logic);
end mux_2to1;

architecture behavioral of mux_2to1 is
begin
  process(a, b, sel)
  begin
    if sel = '0' then
      y <= a;
    else
      y <= b;
    end if;
  end process;
end behavioral;
