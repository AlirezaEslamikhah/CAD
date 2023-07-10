library Q4;
use Q4.arr_package.all;

	-- Add your library and packages declaration here ...

entity q4_tb is
end q4_tb;

architecture TB_ARCHITECTURE of q4_tb is
	-- Component declaration of the tested unit
	component q4
	port(
		A : in arr;
		B : in arr;
		ouput : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : arr;
	signal B : arr;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ouput : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q4
		port map (
			A => A,
			B => B,
			ouput => ouput
		);

	-- Add your stimulus here ...
	process
	begin 
		wait for 100 ns;
		A <= ("000","001","010","011","100","101","110","111");
		B <= ("010","100","001","111","110","011","001","101");
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q4 of q4_tb is
	for TB_ARCHITECTURE
		for UUT : q4
			use entity work.q4(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q4;

