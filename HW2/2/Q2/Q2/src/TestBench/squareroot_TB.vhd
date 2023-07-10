library ieee;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity squareroot_tb is
end squareroot_tb;

architecture TB_ARCHITECTURE of squareroot_tb is
	-- Component declaration of the tested unit
	component squareroot
	port(
		input_vector : in STD_LOGIC_VECTOR(9 downto 0);
		ceil_root : out INTEGER range 0 to 1023 );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input_vector : STD_LOGIC_VECTOR(9 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ceil_root : INTEGER range 0 to 1023;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : squareroot
		port map (
			input_vector => input_vector,
			ceil_root => ceil_root
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 100ns;
		input_vector <= "0001110000"; 
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_squareroot of squareroot_tb is
	for TB_ARCHITECTURE
		for UUT : squareroot
			use entity work.squareroot(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_squareroot;

