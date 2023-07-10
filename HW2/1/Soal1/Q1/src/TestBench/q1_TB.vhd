library Q1;
use Q1.pack.all;

	-- Add your library and packages declaration here ...

entity q1_tb is
end q1_tb;

architecture TB_ARCHITECTURE of q1_tb is
	-- Component declaration of the tested unit
	component q1
	port(
		input : in array8;
		output : out array8 );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal input : array8;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : array8;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q1
		port map (
			input => input,
			output => output
		);

	-- Add your stimulus here ... 
	process
	begin
		wait for 100ns;
		input <= ("10101010","10110101","00111111","11100000","11111111","00000000","10000000","01001011","11111110","10111000");
		wait for 100ns;
		input <= ("10101110","10010001","01111111","01100000","11111111","00000000","10000000","11011011","00011110","10101000");
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q1 of q1_tb is
	for TB_ARCHITECTURE
		for UUT : q1
			use entity work.q1(q1_arch);
		end for;
	end for;
end TESTBENCH_FOR_q1;

