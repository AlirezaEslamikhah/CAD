------- code 

library ieee;
use ieee.std_logic_1164.all;

entity UnaryToBinary is
    port (
    Unary : in std_logic_vector(15 downto 0);
    Binary : out std_logic_vector(3 downto 0)
);
end entity UnaryToBinary;

architecture Behavioral of UnaryToBinary is
begin
    process(Unary)
    begin
    case Unary is
        when "0000000000000000" => Binary <= "0000";
        when "0000000000000001" => Binary <= "0001";
        when "0000000000000011" => Binary <= "0010";
        when "0000000000000111" => Binary <= "0011";
        when "0000000000001111" => Binary <= "0100";
        when "0000000000011111" => Binary <= "0101";
        when "0000000000111111" => Binary <= "0110";
        when "0000000001111111" => Binary <= "0111";
        when "0000000011111111" => Binary <= "1000";
        when "0000000111111111" => Binary <= "1001";
        when "0000001111111111" => Binary <= "1010";
        when "0000011111111111" => Binary <= "1011";
        when "0000111111111111" => Binary <= "1100";
        when "0001111111111111" => Binary <= "1101";
        when "0011111111111111" => Binary <= "1110";
        when "0111111111111111" => Binary <= "1111";
        when others => Binary <= "XXXX";  -- undefined behavior for invalid input
    end case;
    end process;
end architecture Behavioral;




--------test 




