library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		A : in STD_LOGIC_VECTOR(1 downto 0);
		B : in STD_LOGIC_VECTOR(1 downto 0);
		ALUop : in STD_LOGIC_VECTOR(1 downto 0);
		ALUout : out STD_LOGIC_VECTOR(2 downto 0);
		zero : out STD_LOGIC;
		negative : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(1 downto 0);
	signal B : STD_LOGIC_VECTOR(1 downto 0);
	signal ALUop : STD_LOGIC_VECTOR(1 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ALUout : STD_LOGIC_VECTOR(2 downto 0);
	signal zero : STD_LOGIC;
	signal negative : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			A => A,
			B => B,
			ALUop => ALUop,
			ALUout => ALUout,
			zero => zero,
			negative => negative
		);

	-- Add your stimulus here ...
	process 
	begin
		wait for 100 ns;
		A <= "10";
		B <= "01";
		ALUop <= "00";
		wait ;
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_alu;

