library ieee;
use ieee.std_logic_1164.all;

entity BinaryToUnary_TB is
end entity BinaryToUnary_TB;

architecture Behavioral of BinaryToUnary_TB is
    component BinaryToUnary is
        port (
            binary_input  : in std_logic_vector(2 downto 0);
            unary_output : out std_logic_vector(7 downto 0)
        );
    end component BinaryToUnary;

    -- Signal declarations
    signal binary_input_tb : std_logic_vector(2 downto 0);
    signal unary_output_tb : std_logic_vector(7 downto 0);

begin
    -- Instantiate the unit under test
    uut: BinaryToUnary
    port map (
        binary_input  => binary_input_tb,
        unary_output => unary_output_tb
    );

    -- Stimulus process
    stimulus_process: process
    begin
        
        binary_input_tb <= "100";
        wait for 10 ns;

        binary_input_tb <= "010";
        wait for 10 ns;
        
        binary_input_tb <= "001";
        wait for 10 ns;
        

        wait;
    end process;

end architecture Behavioral;
