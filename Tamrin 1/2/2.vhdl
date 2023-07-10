------code 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity ALU is 
port(
    A,B: in std_logic_vector(1 downto 0);
    ALUop: in std_logic_vector(1 downto 0);
    ALUout: out std_logic_vector(2 downto 0);
    zero: out std_logic;
    negative : out std_logic := '0'
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A,B,ALUop)
    begin
        case ALUop is
            when "00" => 
                case A is
                    when "00"=>
                        case B is 
                            when "00" => ALUout <= "000";
                            when "01" => ALUout <= "001";
                            when "10" => ALUout <= "010";
                            when "11" => ALUout <= "011";
                            when others => ALUout <= "000";
                        end case;
                    when "01"=>
                        case B is 
                            when "00" => ALUout <= "001";
                            when "01" => ALUout <= "010";
                            when "10" => ALUout <= "011";
                            when "11" => ALUout <= "100";
                            when others => ALUout <= "000";
                        end case;
                    when "10"=>
                        case B is 
                            when "00" => ALUout <= "010";
                            when "01" => ALUout <= "011";
                            when "10" => ALUout <= "100";
                            when "11" => ALUout <= "101";
                            when others => ALUout <= "000";
                        end case;
                    when "11"=>
                        case B is 
                            when "00" => ALUout <= "011";
                            when "01" => ALUout <= "100";
                            when "10" => ALUout <= "101";
                            when "11" => ALUout <= "110";
                            when others => ALUout <= "000";
                        end case;
                    when others => ALUout <= "000";
                end case;
            when "01" => 
                case A is
                    when "00"=>
                        case B is 
                            when "00" => ALUout <= "000";
                            when "01" => 
								ALUout <= "001" ;
								negative <= '1';
                            when "10" => 
                                ALUout <= "010";
                                negative <= '1';
                            when "11" => 
                                ALUout <= "011";
                                negative <= '1';
                            when others => ALUout <= "000";
                        end case;
                    when "01"=>
                        case B is 
                            when "00" => ALUout <= "001";
                            when "01" => ALUout <= "000";
                            when "10" => 
                                ALUout <= "001";
                                negative <= '1';
                            when "11" => 
                                ALUout <= "010";
                                negative <= '1';
                            when others => ALUout <= "000";
                        end case;
                    when "10"=>
                        case B is 
                            when "00" => ALUout <= "010";
                            when "01" => ALUout <= "001";
                            when "10" => ALUout <= "010";
                            when "11" => 
                                ALUout <= "001";
                                negative <= '1';
                            when others => ALUout <= "000";
                        end case;
                    when "11"=>
                        case B is 
                            when "00" => ALUout <= "011";
                            when "01" => ALUout <= "010";
                            when "10" => ALUout <= "001";
                            when "11" => ALUout <= "010";
                            when others => ALUout <= "000";
                        end case;
                    when others => ALUout <= "000";
                end case;
            when "10" => ALUout <= ('0' & (A and B));
            when "11" => ALUout <= ('0' & (A or B));
            when others => ALUout <= "000";
        end case;
    end process;
    -- zero <= '1' when ALUout = "000" else '0';    
end Behavioral;







--------- test 


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
		ALUop <= "11";
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

