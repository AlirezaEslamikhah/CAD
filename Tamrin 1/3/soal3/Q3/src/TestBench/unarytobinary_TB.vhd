library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity unarytobinary_tb is
end unarytobinary_tb;

architecture TB_ARCHITECTURE of unarytobinary_tb is
	-- Component declaration of the tested unit
	component unarytobinary
	port(
		Unary : in STD_LOGIC_VECTOR(15 downto 0);
		Binary : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Unary : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Binary : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : unarytobinary
		port map (
			Unary => Unary,
			Binary => Binary
		);

	-- Add your stimulus here ...
	process 
	begin 
		wait for 100ns;
		Unary <= "0000000000000001";
		wait for 100ns;
		Unary <= "0000000000000011";
		wait for 100ns;
		Unary <= "0000000000000111";
		wait for 100ns;
		Unary <= "0000000000001111";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_unarytobinary of unarytobinary_tb is
	for TB_ARCHITECTURE
		for UUT : unarytobinary
			use entity work.unarytobinary(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_unarytobinary;



-------test 


library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity unarytobinary_tb is
end unarytobinary_tb;

architecture TB_ARCHITECTURE of unarytobinary_tb is
	-- Component declaration of the tested unit
	component unarytobinary
	port(
		Unary : in STD_LOGIC_VECTOR(15 downto 0);
		Binary : out STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Unary : STD_LOGIC_VECTOR(15 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Binary : STD_LOGIC_VECTOR(3 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : unarytobinary
		port map (
			Unary => Unary,
			Binary => Binary
		);

	-- Add your stimulus here ...
	process 
	begin 
		wait for 100ns;
		Unary <= "0000000000000001";
		wait for 100ns;
		Unary <= "0000000000000011";
		wait for 100ns;
		Unary <= "0000000000000111";
		wait for 100ns;
		Unary <= "0000000000001111";
		wait;
	end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_unarytobinary of unarytobinary_tb is
	for TB_ARCHITECTURE
		for UUT : unarytobinary
			use entity work.unarytobinary(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_unarytobinary;

