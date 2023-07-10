
----- code 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package arr_package is
    type arr_type is array (0 to 2,0 to 2) of std_logic_vector(0 to 3);
end package arr_package;


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.arr_package.all;

entity Q1 is
   port(
	arr : in arr_type 	  	;
	output: out integer	
   );
end entity Q1;


architecture Behavioral of Q1 is  
signal sum : integer := 0;
begin 
    sum <=  to_integer(unsigned(arr(0,0))) +  to_integer(unsigned(arr(0,1))) +  to_integer(unsigned(arr(0,2))) +
    to_integer(unsigned(arr(1,0))) +  to_integer(unsigned(arr(1,1))) +  to_integer(unsigned(arr(1,2))) +  to_integer(unsigned(arr(2,0))) +  to_integer(unsigned(arr(2,1))) +  to_integer(unsigned(arr(2,2)));
    output <= sum;
end architecture Behavioral;






-------------test




library soal1;
use soal1.arr_package.all;

	-- Add your library and packages declaration here ...

entity q1_tb is
end q1_tb;

architecture TB_ARCHITECTURE of q1_tb is
	-- Component declaration of the tested unit
	component q1
	port(
		arr : in arr_type;
		output : out INTEGER );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal arr : arr_type;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal output : INTEGER;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : q1
		port map (
			arr => arr,
			output => output
		);

	-- Add your stimulus here ...
	process 
	begin 
		wait for 100ns;
		arr <= (("0101","0111","0110"),("0101","1011","0011"),("0111","1001","0111"));
		wait for 100ns;
		arr <= (("1101","1111","0100"),("1101","1001","1100"),("0101","1011","1000"));
		wait;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_q1 of q1_tb is
	for TB_ARCHITECTURE
		for UUT : q1
			use entity work.q1(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_q1;

