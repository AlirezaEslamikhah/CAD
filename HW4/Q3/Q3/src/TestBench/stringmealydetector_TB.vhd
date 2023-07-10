library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity stringmealydetector_tb is
end stringmealydetector_tb;

architecture TB_ARCHITECTURE of stringmealydetector_tb is
	-- Component declaration of the tested unit
	component stringdetector
	port(
		clk : in STD_LOGIC;
		reset : in STD_LOGIC;
		input : in STD_LOGIC;
		output : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal input : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : stringdetector
		port map (
			clk => clk,
			reset => reset,
			input => input,
			output => output
		);

	-- Add your stimulus here ...  
	clk_process : process
        begin
            clk <= '0';
            wait for 10 ns;
            -- wait for clk_period/2;
            clk <= '1';
            wait for 10 ns;
            -- wait for clk_period/2;
        end process;
    
        input <= '1' after 20 ns, '1' after 40 ns, '0' after 60 ns, '1' after 80 ns,
                '0' after 100 ns, '0' after 120 ns, '1' after 140 ns, '0' after 160 ns;
        
        reset <= '0' after 100 ns, '1' after 140 ns;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_stringdetector of stringmealydetector_tb is
	for TB_ARCHITECTURE
		for UUT : stringdetector
			use entity work.stringdetector(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_stringdetector;

