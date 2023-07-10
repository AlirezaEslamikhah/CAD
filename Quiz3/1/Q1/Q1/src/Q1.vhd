library IEEE;
use IEEE.std_logic_1164.all;





entity Q1 is
   port(
      input0 : in INTEGER;
      input1 : in INTEGER;

      gcd : out INTEGER;


      lcm : out INTEGER
      );
end Q1;






architecture Q1 of Q1 is
begin

   process(input0, input1)
         variable first:INteger; 

         variable second:INteger; 

         variable rem0: INteger;
   begin
         first := input0;

         second := input1;

         while (second /= 0) loop
            
            rem0 := first mod second;
            first := second;
            second := rem0;
         end loop;
         gcd <= first;
         lcm <= input0 * input1 / first;
   end process;

end Q1;
