--------CODE 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package com_package is
    type complex is record 
        x : integer range -128 to 127;
        y : integer range -128 to 127;
    end record;
end package com_package;



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.com_package.all;

entity complex_calculator is
    port (
        A : in complex;
        B : in complex;
        multiply : in std_logic;
        add : in std_logic;
        subtract : in std_logic;
        result : out complex
    );
end complex_calculator;


architecture Behavioral of complex_calculator is
begin
    process(A, B, multiply, add, subtract)
    begin
        if add = '1' then
            result.x <= A.x + B.x;
            result.y <= A.y + B.y;
        elsif subtract = '1' then
            result.x <= A.x - B.x;
            result.y <= A.y - B.y;
        elsif multiply = '1' then
            result.x <= (A.x * B.x) - (A.y * B.y);
            result.y <= (A.x * B.y) + (A.y * B.x);
        else
            result.x <= 0;
            result.y <= 0;
        end if;
    end process;
end Behavioral;



--------test 

library Q5;
use Q5.com_package.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
	-- Add your library and packages declaration here ...

entity complex_calculator_tb is
end complex_calculator_tb;




architecture TB_ARCHITECTURE of complex_calculator_tb is
	-- Component declaration of the tested unit
	component complex_calculator
	port(
		A : in complex;
		B : in complex;
		multiply : in STD_LOGIC;
		add : in STD_LOGIC;
		subtract : in STD_LOGIC;
		result : out complex );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : complex;
	signal B : complex;
	signal multiply : STD_LOGIC;
	signal add : STD_LOGIC;
	signal subtract : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal result : complex;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : complex_calculator
		port map (
			A => A,
			B => B,
			multiply => multiply,
			add => add,
			subtract => subtract,
			result => result
		);

	-- Add your stimulus here ...	
	process 
	begin
		wait for 100 ns;
		A <= (1, 2);
		B <= (3, 5);
		multiply <= '1';
		wait;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_complex_calculator of complex_calculator_tb is
	for TB_ARCHITECTURE
		for UUT : complex_calculator
			use entity work.complex_calculator(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_complex_calculator;

