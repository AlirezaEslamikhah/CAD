library ieee;
use ieee.std_logic_1164.all;

package calc is   
    function add
    (
		A, B: in std_logic_vector(7 downto 0)
	) 
        return std_logic_vector;
    function sub
    (
		A, B: in std_logic_vector(7 downto 0)
	) 
        return std_logic_vector;
end package calc;




package body calc is
    function add(A, B: in std_logic_vector(7 downto 0)) 
        return std_logic_vector is
        variable sum: std_logic_vector(7 downto 0);
    begin
        sum(0) := A(0) xor B(0);
        for i in 1 to 7 loop
            sum(i) := (A(i) xor B(i)) xor (A(i-1) and B(i-1));
        end loop;
        return sum;
    end function add;

    function sub(A, B: in std_logic_vector(7 downto 0)) 
        return std_logic_vector is variable difference: std_logic_vector(7 downto 0);
    begin
        difference(0) := A(0) xor B(0);
        for i in 1 to 7 loop
            difference(i) := (A(i) xor B(i)) xor ((not A(i-1)) and B(i-1));
        end loop;
        return difference;
    end function sub;
end package body calc;




