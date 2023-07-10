library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.math_real.all;
use IEEE.NUMERIC_STD.all;
use ieee.numeric_std.all;

package my_package is
  type seven8bit is array (6 downto 0) of std_logic_vector(7 downto 0);
  type matrix_2x2 is array (1 downto 0, 1 downto 0) of std_logic_vector(3 downto 0);
end package my_package;
