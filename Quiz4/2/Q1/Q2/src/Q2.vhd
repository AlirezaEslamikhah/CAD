library ieee;
use ieee.std_logic_1164.all;
use work.calc.all;

entity Q2 is
    port (
        A, B: in std_logic_vector(7 downto 0);
        op: in std_logic; 
		
        result: out std_logic_vector(7 downto 0)
    );
end entity Q2;

architecture Solve of Calculator is
begin
    process(A, B, op)
    begin
        if op = '1' then
			
            result <= subtraction(A, B);
			
        else 
            
			result <= addition(A, B);
        end if;
        
    end process;


end architecture Solve;
