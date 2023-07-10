library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity q3_tb is
end q3_tb;

architecture TB_ARCHITECTURE of q3_tb is
	-- Component declaration of the tested unit
	component q3
	port(
		input : in BIT_VECTOR(16 downto 1);
		output : out BIT_VECTOR(1 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : BIT_VECTOR(16 downto 1);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : BIT_VECTOR(1 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q3
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 100ns;
		input <= "1100110000111111";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q3 of q3_tb is
	for TB_ARCHITECTURE
		for UUT : q3
			use entity work.q3(solve);
		end for;
	end for;
end TESTBENCH_FOR_q3;

