library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	


entity Q3 is
	 port(
		 input : in BIT_VECTOR(16 downto 1);
		 output : out BIT_VECTOR(1 downto 0)
	     );
end Q3;

architecture solve of Q3 is 
begin 
    process(input)
    variable zoj :integer;
    variable fard :integer;
    begin
    zoj := 0;
    fard := 0;
    for i in 1 to 16 loop
        if (i mod 2 = 0) then
            if(input(i) = '1') then
                zoj := zoj + 1;
            end if;
        else 
            if(input(i) = '1') then
                fard := fard + 1;
            end if;
        end if;
    end loop;


    if (zoj mod 3 = 0) then
        output(1) <= '1';
    else
        output(1) <= '0';
    end	 if;
    if (fard mod 5 = 0) then
        output(0) <= '1';
    else
        output(0) <= '0';
    end	 if;
    
    end process;
end solve;

