library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package com_package is
    type complex is record 
        x : integer range -128 to 127;
        y : integer range -128 to 127;
    end record;
end package com_package;



