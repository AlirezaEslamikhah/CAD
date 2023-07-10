library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BinaryToUnary is
    port (
        binary_input  : in std_logic_vector(2 downto 0);
        unary_output : out std_logic_vector(7 downto 0)
    );
end entity BinaryToUnary;

architecture Behavioral of BinaryToUnary is
begin
    process(binary_input)
    begin
        case binary_input is
            when "000" =>
                unary_output <= "00000000";
                
            when "001" =>
                unary_output <= "00000001";
                
            when "010" =>
                unary_output <= "00000011";
                
            when "011" =>
                unary_output <= "00000111";
                
            when "100" =>
                unary_output <= "00001111";
                
            when "101" =>
                unary_output <= "00011111";
                
            when "110" =>
                unary_output <= "00111111";
                
            when "111" =>
                unary_output <= "11111111";
                
            when others =>
                unary_output <= (others => '0');
        end case;
    end process;
    
end architecture Behavioral;
