library ieee;
use ieee.MATH_REAL.all;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity counter_tb is
end counter_tb;

architecture TB_ARCHITECTURE of counter_tb is
	-- Component declaration of the tested unit
	component counter
	port(
		Clear : in STD_LOGIC;
		Preset : in STD_LOGIC;
		Count : in STD_LOGIC;
		Clock : in STD_LOGIC;
		CounterValue : out STD_LOGIC_VECTOR(11 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Clear : STD_LOGIC;
	signal Preset : STD_LOGIC;
	signal Count : STD_LOGIC;
	signal Clock : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal CounterValue : STD_LOGIC_VECTOR(11 downto 0);

	-- Add your code here ...
	constant Clock_Period : time := 10 ns;
	
begin

	-- Unit Under Test port map
	UUT : counter
		port map (
			Clear => Clear,
			Preset => Preset,
			Count => Count,
			Clock => Clock,
			CounterValue => CounterValue
		);
	-- Clock process
    process
    begin
        while now < 100 ns loop
            Clock <= '0';
            wait for Clock_Period / 2;
            Clock <= '1';
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process;
	
	-- Add your stimulus here ...
	 process
    begin
        -- Initialize inputs
        Clear <= '1';
        Preset <= '1';
        Count <= '0';
        wait for 100ns;
        
        Clear <= '0';
        Preset <= '0';
        Count <= '0';
        wait for 100ns;
        
        Clear <= '0';
        Preset <= '1';
        Count <= '0';
        wait for Clock_Period;
        
        Clear <= '0';
        Preset <= '1';
        Count <= '1';
        wait for Clock_Period;
        
        Clear <= '1';
        Preset <= '1';
        Count <= '0';
        wait for Clock_Period;
        
        Clear <= '0';
        Preset <= '0';
        Count <= '1';
        wait for Clock_Period;
        
        Clear <= '0';
        Preset <= '1';
        Count <= '0';
        wait for Clock_Period;
        
        Clear <= '0';
        Preset <= '1';
        Count <= '1';
        wait for Clock_Period;
        
        Clear <= '1';
        Preset <= '1';
        Count <= '0';
        wait for Clock_Period;
        
        wait;
    end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_counter of counter_tb is
	for TB_ARCHITECTURE
		for UUT : counter
			use entity work.counter(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_counter;

