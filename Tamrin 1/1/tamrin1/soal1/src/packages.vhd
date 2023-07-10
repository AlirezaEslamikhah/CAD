library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package arr_package is
    type arr_type is array (0 to 2,0 to 2) of std_logic_vector(0 to 3);
end package arr_package;