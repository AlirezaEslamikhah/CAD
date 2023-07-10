library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity Q2 is
  generic (	   

    n : positive := 3

  );


  port (	  

    BCD_Numbers : in std_logic_vector(4*n - 1 downto 0);   

    Sum : out integer

  ); 

end Q2;
 
architecture Behavioral of Q2 is
 
  component Full_Adder is
    port (
      A, B, Cin : in std_logic;

      Sum, Cout : out std_logic	 

    );
  end component;
  
  component Half_Adder is
    port (					

      A, B : in std_logic;	  

      Sum, Cout : out std_logic	   

    );
  end component;
 
  signal Carry : std_logic := '0';		 

      signal TempSum : std_logic_vector(4*n downto 0);
  
begin
 
  FA_inst: for i in 0 to n-1 generate	 
	
	
	
    signal A, B, S : std_logic_vector(3 downto 0);	  



    signal Cin, Cout : std_logic;
  begin
    A <= BCD_Numbers(4*i + 3 downto 4*i);  
    B <= TempSum(4*i + 3 downto 4*i);          
    
    FA_comp: Full_Adder port map (
      A => A(i), B => B(i),
      Cin => Carry,
      Sum => S(i), Cout => Cout
    );
    
    TempSum(4*i + 3 downto 4*i) <= std_logic_vector(S);      
    
  end generate FA_inst;      
  Sum <= to_integer(unsigned(TempSum));
  

end Behavioral;
 
