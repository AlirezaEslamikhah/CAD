library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity SquareRoot is
    port (
        input_vector: in std_logic_vector(9 downto 0);
        ceil_root: out integer range 0 to 1023
    );
end entity SquareRoot;

architecture Behavioral of SquareRoot is
   
begin
    process (input_vector) 
	variable input_real: integer;
    variable root_real: integer;
	variable tmp : integer;
    begin
        input_real := to_integer(unsigned(input_vector));  	
		tmp := 0;
		while tmp**2 < input_real loop
			tmp:= tmp + 1;
		end loop;
		ceil_root <= tmp;
        --root_real <= math_real.sqrt(input_real);
--        ceil_root <= integer(ceil(root_real));	 
		
    end process;
end architecture Behavioral;
