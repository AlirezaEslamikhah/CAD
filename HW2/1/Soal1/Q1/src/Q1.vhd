library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_STD.ALL;	
use work.pack.all;

entity Q1 is 
    port(
        input: in array8;
        output: out array8
        );
    end Q1;

architecture Q1_arch of Q1 is
begin 
    process(input)
    variable temp: std_logic_vector(0 to 7);
    variable res : array8;
    begin
    res := input;
    for i in 0 to 9 loop
        for j in 0 to 9 loop
            if (unsigned(res(i)) <= unsigned(res(j))) then
                temp := res(i);
                res(i) := res(j);
                res(j) := temp;
            end if;
        end loop;
    end loop;
    output <= res;
    end process;
end Q1_arch;

