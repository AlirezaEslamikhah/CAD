library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.arr_package.all;

entity Q4 is
    port (
        A,B : in arr;
        ouput : out integer
    );
end entity Q4;


architecture Behavioral of Q4 is
begin
    ouput <= (to_integer(unsigned( A(0))) * to_integer(unsigned(B(0)))) +
                (to_integer(unsigned( A(1))) * to_integer(unsigned(B(1)))) +
                (to_integer(unsigned( A(2))) * to_integer(unsigned(B(2)))) +
                (to_integer(unsigned( A(3))) * to_integer(unsigned(B(3)))) +
                (to_integer(unsigned( A(4))) * to_integer(unsigned(B(4)))) +
                (to_integer(unsigned( A(5))) * to_integer(unsigned(B(5)))) +
                (to_integer(unsigned( A(6))) * to_integer(unsigned(B(6)))) +
                (to_integer(unsigned( A(7))) * to_integer(unsigned(B(7)))) ;
end architecture Behavioral;