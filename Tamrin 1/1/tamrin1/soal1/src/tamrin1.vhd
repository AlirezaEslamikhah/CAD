library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.arr_package.all;

entity Q1 is
   port(
	arr : in arr_type 	  	;
	output: out integer	
   );
end entity Q1;


architecture Behavioral of Q1 is  
signal sum : integer := 0;
begin 
   -- process 	      
   -- begin
   --    for i in 0 to 2 loop 
   --       for j in 0 to 2 loop 
   --          sum <= sum + to_integer(unsigned(arr(i,j)));
   --          -- sum <= 1;
   --       end loop;
   --    end loop;
   --    output <= sum;
   --    wait;
   -- end process;

   sum <=  to_integer(unsigned(arr(0,0))) +  to_integer(unsigned(arr(0,1))) +  to_integer(unsigned(arr(0,2))) +
   to_integer(unsigned(arr(1,0))) +  to_integer(unsigned(arr(1,1))) +  to_integer(unsigned(arr(1,2))) +  to_integer(unsigned(arr(2,0))) +  to_integer(unsigned(arr(2,1))) +  to_integer(unsigned(arr(2,2)));
   output <= sum;
end architecture Behavioral;