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
		A <= (10, 5);
		B <= (4, 1);
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

