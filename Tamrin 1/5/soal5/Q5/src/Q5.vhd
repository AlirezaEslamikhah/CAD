library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.com_package.all;

entity complex_calculator is
    port (
        A : in complex;
        B : in complex;
        multiply : in std_logic;
        add : in std_logic;
        subtract : in std_logic;
        result : out complex
    );
end complex_calculator;


architecture Behavioral of complex_calculator is
begin
    process(A, B, multiply, add, subtract)
    begin
        if add = '1' then
            result.x <= A.x + B.x;
            result.y <= A.y + B.y;
        elsif subtract = '1' then
            result.x <= A.x - B.x;
            result.y <= A.y - B.y;
        elsif multiply = '1' then
            result.x <= (A.x * B.x) - (A.y * B.y);
            result.y <= (A.x * B.y) + (A.y * B.x);
        else
            result.x <= 0;
            result.y <= 0;
        end if;
    end process;
end Behavioral;