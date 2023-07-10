library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;
use IEEE.NUMERIC_STD.all;
use work.my_package.all;
use ieee.numeric_std.all;

entity Q3 is    
 port( 
 input1 : in matrix_2x2;
 op : in std_logic;
 input2 : in matrix_2x2;

 output : out integer
 );
end Q3;

architecture behavioral of Q3 is
begin
 process(input1, input2)
    begin
  if op = '1' then

   output <= (to_integer(unsigned(input1(0,0))) /  to_integer(unsigned(input2(0,0)))) + (to_integer(unsigned(input1(0,1))) /  to_integer(unsigned(input2(0,1)))) + (to_integer(unsigned(input1(1,0))) /  to_integer(unsigned(input2(1,0)))) + (to_integer(unsigned(input1(1,1))) /  to_integer(unsigned(input2(1,1))));
  else


   output <= (to_integer(unsigned(input1(0,0))) *  to_integer(unsigned(input2(0,0)))) + (to_integer(unsigned(input1(0,1))) *  to_integer(unsigned(input2(0,1)))) + (to_integer(unsigned(input1(1,0))) *  to_integer(unsigned(input2(1,0)))) + (to_integer(unsigned(input1(1,1))) *  to_integer(unsigned(input2(1,1))));
  end if;
    end process;
end behavioral;
