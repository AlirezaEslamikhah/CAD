library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Recursive_Functions is

    function BCD_to_Binary(BCD_num : in std_logic_vector) return std_logic_vector;


    function Binary_Reverser(input_vector : in std_logic_vector) return std_logic_vector;


end Recursive_Functions;

package body Recursive_Functions is

    function BCD_to_Binary(BCD_num : in std_logic_vector) return std_logic_vector is
        variable binary_result : std_logic_vector(3 downto 0) := (others => '0');
    begin
        if BCD_num'length = 1 then
            if BCD_num = "0000" then
                binary_result := "0000";
            elsif BCD_num = "0001" then
                binary_result := "0001";
            elsif BCD_num = "0010" then
                binary_result := "0010";
            elsif BCD_num = "0011" then
                binary_result := "0011";
            elsif BCD_num = "0100" then
                binary_result := "0100";
            elsif BCD_num = "0101" then
                binary_result := "0101";
            elsif BCD_num = "0110" then
                binary_result := "0110";
            elsif BCD_num = "0111" then
                binary_result := "0111";
            elsif BCD_num = "1000" then
                binary_result := "1000";
            elsif BCD_num = "1001" then
                binary_result := "1001";
            else
                binary_result := (others => 'X');
            end if;
        else
            binary_result := BCD_to_Binary(BCD_num(BCD_num'left - 1 downto 0)) & BCD_to_Binary(BCD_num(BCD_num'length - 1 downto BCD_num'left));
        end if;

        return binary_result;
    end BCD_to_Binary;

    function Binary_Reverser(input_vector : in std_logic_vector) return std_logic_vector is
        variable reversed_result : std_logic_vector(input_vector'length - 1 downto 0);
    begin
        if input_vector'length = 1 then
            reversed_result := input_vector;
        else
            reversed_result := input_vector(input_vector'length - 1 downto 0) & Binary_Reverser(input_vector(input_vector'length downto input_vector'length - 1));
        end if;

        return reversed_result;
    end Binary_Reverser;

end Recursive_Functions;
